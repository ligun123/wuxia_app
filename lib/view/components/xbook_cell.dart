import "package:flutter/material.dart";

class XBookCell extends StatefulWidget {
  XBookCell({Key key}) : super(key: key);

  _XBookCellState createState() => _XBookCellState();
}

class _XBookCellState extends State<XBookCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("book cell"),
    );
  }
}