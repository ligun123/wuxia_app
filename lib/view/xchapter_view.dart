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
        title: Text("Chapter"),
      ),
      body: Stack(
        children: <Widget>[
          EasyRefresh(
            onLoad: loadMore,
            onRefresh: loadPrevious,
            child: ListView.builder(
              itemCount: chapterList.length,
              itemBuilder: (ctx, index) {
                final cp = chapterList[index];
                return Text(cp.content);
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
