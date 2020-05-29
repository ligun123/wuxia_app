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
    return SizedBox(
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
            style: theme.textTheme.subtitle,
          ),
          Spacer(),
          GestureDetector(
            child: Text(
              "More",
              style:
                  theme.textTheme.subtitle.copyWith(color: theme.primaryColor),
            ),
            onTap: () {
              //TODO: jump to more
            },
          )
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildWrapGesture(
              context,
              XBookCell(
                bookModel: groupModel.getBookAtIndex(0),
              )),
          SizedBox(height: 8),
          _buildWrapGesture(
              context,
              XBookCell(
                bookModel: groupModel.getBookAtIndex(1),
              )),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildWrapGesture(
                  context,
                  XBookItem(
                    bookModel: groupModel.getBookAtIndex(2),
                  )),
              _buildWrapGesture(
                  context,
                  XBookItem(
                    bookModel: groupModel.getBookAtIndex(3),
                  )),
              _buildWrapGesture(
                  context,
                  XBookItem(
                    bookModel: groupModel.getBookAtIndex(4),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWrapGesture(BuildContext context, Widget bookWidget) {
    return GestureDetector(
      onTap: () {
        //TODO: jump to book detail
        XRoutes.push(context, "XBookView");
      },
      child: bookWidget,
    );
  }
}
