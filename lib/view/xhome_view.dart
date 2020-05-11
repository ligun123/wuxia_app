import 'package:app/xroutes.dart';
import 'package:flutter/material.dart';

class XHomeView extends StatefulWidget {
  XHomeView({Key key}) : super(key: key);

  _XHomeViewState createState() => _XHomeViewState();
}

class _XHomeViewState extends State<XHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: GestureDetector(
        child: Center(
          child: Text("Home"),
        ),
        onTap: () {
          XRoutes.push(context, 'XSubView', arguments: ['Home->SubView']);
        },
      ),
    );
  }
}
