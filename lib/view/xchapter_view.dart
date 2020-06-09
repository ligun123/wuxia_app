import 'package:app/model/mchapter.dart';
import 'package:app/utils/xapi.dart';
import 'package:app/utils/xresponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class XChapterView extends StatefulWidget {
  final MChapterSimple initChapter;
  XChapterView({
    Key key,
    this.initChapter,
  }) : super(key: key);

  _XChapterViewState createState() => _XChapterViewState();
}

class _XChapterViewState extends State<XChapterView> {
  final scrollController = ScrollController();
  final chapterList = <MChapter>[];

  MChapter currentChapter;

  @override
  void initState() {
    super.initState();
    XApi.chapterDetail(
      bookid: widget.initChapter.bookId,
      cindex: widget.initChapter.cindex,
    ).then((resp) {
      if (resp.isOK()) {
        setState(() {
          chapterList.add(resp.data);
          currentChapter = resp.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentChapter?.name ?? ""),
      ),
      body: Stack(
        children: <Widget>[
          EasyRefresh(
            onLoad: loadMore,
            onRefresh: loadPrevious,
            child: ListView.builder(
              controller: scrollController,
              itemCount: chapterList.length,
              itemBuilder: (ctx, index) {
                final cp = chapterList[index];
                return Column(
                  children: <Widget>[
                    SizedBox(height: 24,),
                    Text(cp.name, style: TextStyle(fontSize: 24),),
                    Text(cp.content),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<XResponse> loadMore() {
    return XApi.chapterDetail(
            bookid: currentChapter.bookId, cindex: currentChapter.cindex + 1)
        .then((resp) {
      if (resp.isOK()) {
        setState(() {
          chapterList.add(resp.data);
          currentChapter = resp.data;
        });
      }
      return resp;
    });
  }

  Future<XResponse> loadPrevious() {
    if (currentChapter.cindex > 0) {
      return XApi.chapterDetail(
              bookid: currentChapter.bookId, cindex: currentChapter.cindex - 1)
          .then((resp) {
        if (resp.isOK()) {
          setState(() {
            scrollController.jumpTo(100);
            chapterList.insert(0, resp.data);
            currentChapter = resp.data;
          });
        }
        return resp;
      });
    }
    return Future.delayed(Duration(milliseconds: 200));
  }
}
