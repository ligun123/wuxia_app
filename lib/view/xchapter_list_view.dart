import 'package:app/model/mchapter.dart';
import 'package:flutter/material.dart';

class XChapterListView extends StatefulWidget {
  final String bookId;
  final String name;
  XChapterListView({
    Key key,
    this.bookId,
    this.name,
  }) : super(key: key);

  _XChapterListViewState createState() => _XChapterListViewState();
}

class _XChapterListViewState extends State<XChapterListView> {
  List<MChapterSimple> chapters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),),
      body: ListView(),
    );
  }
}
