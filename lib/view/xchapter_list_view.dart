import 'package:app/model/mchapter.dart';
import 'package:app/utils/xapi.dart';
import 'package:app/utils/xresponse.dart';
import 'package:app/view/components/xchapter_cell.dart';
import 'package:app/view/components/xglobal_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rxdart/subjects.dart';

class XChapterListView extends StatefulWidget {
  final String bookId;    //id,非uid
  final String name;
  XChapterListView({
    Key key,
    this.bookId,
    this.name,
  }) : super(key: key);

  _XChapterListViewState createState() => _XChapterListViewState();
}

class _XChapterListViewState extends State<XChapterListView> {
  XChapterListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = XChapterListViewModel(bookId: widget.bookId);

    viewModel.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: StreamBuilder(
        stream: viewModel.chapterListSubj.stream,
        builder: (BuildContext context,
            AsyncSnapshot<List<MChapterSimple>> snapshot) {
          if (snapshot.hasError) {
            return XGlobalNeterrorView(
              onRefresh: viewModel.refresh,
            );
          }
          return EasyRefresh(
              onRefresh: viewModel.refresh,
              onLoad: viewModel.fetchMore,
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (ctx, index) {
                  return XChapterCell(
                    chapter: snapshot.data[index],
                  );
                },
              ));
        },
      ),
    );
  }
}

class XChapterListViewModel {
  final chapterListSubj = PublishSubject<List<MChapterSimple>>();

  final _chapterList = <MChapterSimple>[];

  final String bookId;

  int page = 0;

  XChapterListViewModel({this.bookId});

  Future<XResponse> refresh() {
    return XApi.chapterList(bookid: bookId, page: 0).then((resp) {
      if (resp.isOK()) {
        _chapterList.clear();
        _chapterList.addAll(resp.data);
        chapterListSubj.add(_chapterList);
        page = 0;
      } else {
        if (_chapterList.length == 0) {
          chapterListSubj.addError(resp.error);
        }
      }
      return resp;
    });
  }

  Future<XResponse> fetchMore() {
    return XApi.chapterList(bookid: bookId, page: page + 1).then((resp) {
      if (resp.isOK()) {
        _chapterList.addAll(resp.data);
        chapterListSubj.add(_chapterList);
        page++;
      }
      return resp;
    });
  }
}
