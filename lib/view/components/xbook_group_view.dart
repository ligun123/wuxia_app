import 'package:app/view/components/xbook_cell.dart';
import 'package:app/view/components/xbook_item.dart';
import "package:flutter/material.dart";

class XBookGroupView extends StatelessWidget {
  XBookGroupView({Key key}) : super(key: key);

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
            "Section Title",
            style: theme.textTheme.subtitle,
          ),
          Spacer(),
          GestureDetector(
            child: Text(
              "More",
              style: theme.textTheme.subtitle.copyWith(color: theme.primaryColor),
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
          XBookCell(),
          SizedBox(height: 8),
          XBookCell(),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              XBookItem(),
              XBookItem(),
              XBookItem(),
            ],
          ),
        ],
      ),
    );
  }
}
