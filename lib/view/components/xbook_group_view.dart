import 'package:app/view/components/xbook_cell.dart';
import 'package:app/view/components/xbook_item.dart';
import "package:flutter/material.dart";

class XBookGroupView extends StatelessWidget {
  XBookGroupView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
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
    return SizedBox(
      height: 56,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.book,
            size: 16,
          ),
          Text("Section Title"),
          Spacer(),
          GestureDetector(
            child: Text("More"),
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
          XBookCell(),
          Row(
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
