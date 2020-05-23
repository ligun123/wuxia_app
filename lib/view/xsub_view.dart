import "package:flutter/material.dart";

class XSubView extends StatefulWidget {
  final String centerString;
  XSubView({Key key, this.centerString}) : super(key: key);

  _XSubViewState createState() => _XSubViewState();
}

class _XSubViewState extends State<XSubView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.centerString),),
      body: Center(child: Text(widget.centerString),),
    );
  }
}