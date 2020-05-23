import "package:flutter/material.dart";


/**
 * simple of book
 */

class XBookItem extends StatefulWidget {
  XBookItem({Key key}) : super(key: key);

  _XBookItemState createState() => _XBookItemState();
}

class _XBookItemState extends State<XBookItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("book item"),
    );
  }
}