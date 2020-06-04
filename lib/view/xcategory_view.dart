import 'package:app/model/mbook.dart';
import 'package:app/utils/xapi.dart';
import 'package:app/view/components/xbook_cell.dart';
import 'package:flutter/material.dart';

class XCategoryView extends StatefulWidget {
  final String category;
  XCategoryView({Key key, this.category}) : super(key: key);

  _XCategoryViewState createState() => _XCategoryViewState();
}

class _XCategoryViewState extends State<XCategoryView> {
  List<MBook> books;
  @override
  void initState() {
    super.initState();
    XApi.categoryList(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: ListView(
        children: books
            .map((f) => XBookCell(
                  bookModel: f,
                  onTap: bookCellTap,
                ))
            .toList(),
      ),
    );
  }

  void bookCellTap(MBook book) {}
}
