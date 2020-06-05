import 'dart:convert';
import 'package:app/model/mbook.dart';
import 'package:app/utils/xdb_manager.dart';
import 'package:app/utils/xglobal_inherit.dart';
import 'package:app/view/components/xbook_cell.dart';
import 'package:flutter/material.dart';

class XHomeView extends StatefulWidget {
  XHomeView({Key key}) : super(key: key);

  _XHomeViewState createState() => _XHomeViewState();
}

class _XHomeViewState extends State<XHomeView> {
  @override
  void initState() {
    super.initState();
    loadBookshelf();
  }

  @override
  Widget build(BuildContext context) {
    final bookshelf = XGlobalInherited.of(context).bookshelf.books;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookshelf"),
      ),
      body: ListView.builder(
        itemCount: bookshelf?.length ?? 0,
        itemBuilder: (ctx, index) {
          return _buildCell(context, book: bookshelf[index]);
        },
      ),
    );
  }

  Widget _buildCell(BuildContext context, {MBook book}) {
    Widget cell = Padding(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 4,
        bottom: 4,
      ),
      child: XBookCell(
        bookModel: book,
        onTap: (b) {
          //TODO: read now
        },
      ),
    );
    cell = Dismissible(
      key: Key(book.uid),
      direction: DismissDirection.endToStart,
      child: cell,
      onDismissed: (direction) {
        setState(() {
          setState(() {
            XGlobalInherited.of(context).bookshelf.remove(book);
          });
        });
      },
      background: Container(
        color: Colors.red,
        child: ListTile(
          trailing: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
    return cell;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(XHomeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadBookshelf() {
    XDBManager.shared.openDB();
    XDBManager.shared.getValue("bookshelf").then((onValue) {
      final List jsonList = jsonDecode(onValue ?? "[]");
      final bookList = jsonList.map<MBook>((f) => MBook.fromJson(f)).toList();
      setState(() {
        XGlobalInherited.of(context).bookshelf.books = bookList;
      });
    });
  }
}
