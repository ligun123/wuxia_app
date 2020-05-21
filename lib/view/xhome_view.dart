import 'dart:io';
import 'package:app/utils/xrequest.dart';
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
      body: GestureDetector(
        child: Center(
          child: Text("Home"),
        ),
        onTap: () async {
          // XRoutes.push(context, 'XSubView', arguments: ['Home->SubView']);
          final req = XRequest(path: "/");
          final resp = await req.send();
          print(resp.data);
        },
      ),
    );
  }
}
