import 'dart:convert';

import 'package:app/model/mbook.dart';
import 'package:app/utils/xdb_manager.dart';
import 'package:app/view/components/xbook_cell.dart';
import 'package:flutter/material.dart';

class XHomeView extends StatefulWidget {
  XHomeView({Key key}) : super(key: key);

  _XHomeViewState createState() => _XHomeViewState();
}

class _XHomeViewState extends State<XHomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<MBook> bookshelf = [];

  @override
  void initState() {
    super.initState();
    XDBManager.shared.openDB();
    XDBManager.shared.getValue("bookshelf").then((onValue) {
      final List jsonList = jsonDecode(onValue ?? "[]");
      setState(() {
        final bookList = jsonList.map<MBook>((f) => MBook.fromJson(f)).toList();
        setState(() {
          bookshelf = bookList;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: bookshelf.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
              top: 4,
              bottom: 4,
            ),
            child: XBookCell(
              bookModel: bookshelf[index],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
