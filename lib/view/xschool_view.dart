import 'package:app/xroutes.dart';
import 'package:flutter/material.dart';

class XSchoolView extends StatefulWidget {
  XSchoolView({Key key}) : super(key: key);

  _XSchoolViewState createState() => _XSchoolViewState();
}

class _XSchoolViewState extends State<XSchoolView> {
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