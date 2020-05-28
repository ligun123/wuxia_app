import 'dart:io';
import 'package:app/model/mbook.dart';
import 'package:app/utils/xrequest.dart';
import 'package:app/view/components/xbook_cell.dart';
import 'package:app/xroutes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/adapters/io_adapter.dart';

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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
              top: 4,
              bottom: 4,
            ),
            child: XBookCell(),
          );
        },
      ),
    );
  }
}
