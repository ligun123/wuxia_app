import 'package:app/model/mbook.dart';
import 'package:app/model/mbook_group.dart';
import 'package:app/view/components/xbook_cell.dart';
import 'package:app/view/components/xbook_item.dart';
import 'package:app/xroutes.dart';
import "package:flutter/material.dart";

class XBookGroupView extends StatelessWidget {
  final MBookGroup groupModel;
  XBookGroupView({
    Key key,
    this.groupModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTitleRow(context),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    final theme = Theme.of(context);
    Widget widget = Container(
      color: Color(0x00000000),
      height: 56,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.book,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          SizedBox(width: 4),
          Text(
            groupModel.section,
            style: theme.textTheme.subtitle2,
          ),
          Spacer(),
          Text(
            "More",
            style: theme.textTheme.subtitle2.copyWith(color: theme.primaryColor),
          ),
        ],
      ),
    );
    widget = GestureDetector(
      onTap: () {
        XRoutes.push(context, "XCategoryView", arguments: [groupModel.section, groupModel.books]);
      },
      child: widget,
    );
    return widget;
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          XBookCell(
            bookModel: groupModel.getBookAtIndex(0),
            onTap: (book) {
              onBookTap(context, book);
            },
          ),
          SizedBox(height: 8),
          XBookCell(
            bookModel: groupModel.getBookAtIndex(1),
            onTap: (book) {
              onBookTap(context, book);
            },
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              XBookItem(
                bookModel: groupModel.getBookAtIndex(2),
                onTap: (book) {
                  onBookTap(context, book);
                },
              ),
              XBookItem(
                bookModel: groupModel.getBookAtIndex(3),
                onTap: (book) {
                  onBookTap(context, book);
                },
              ),
              XBookItem(
                bookModel: groupModel.getBookAtIndex(4),
                onTap: (book) {
                  onBookTap(context, book);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onBookTap(BuildContext context, MBook book) {
    XRoutes.push(context, "XBookView", arguments: [book.uid]);
  }
}
