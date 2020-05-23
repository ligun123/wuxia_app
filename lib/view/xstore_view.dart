import 'package:app/xroutes.dart';
import 'package:flutter/material.dart';

class XStoreView extends StatefulWidget {
  XStoreView({Key key}) : super(key: key);

  _XStoreViewState createState() => _XStoreViewState();
}

class _XStoreViewState extends State<XStoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("School"),),
      body: GestureDetector(
        child: Center(
          child: Text("School"),
        ),
        onTap: () {
          XRoutes.push(context, 'XSubView', arguments: ['School->SubView']);
        },
      ),
    );
  }
}