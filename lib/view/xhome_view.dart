import 'dart:io';
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
        onTap: () {
          // XRoutes.push(context, 'XSubView', arguments: ['Home->SubView']);
          final ddd = Dio();
          final DefaultHttpClientAdapter adapter = ddd.httpClientAdapter;

          adapter.onHttpClientCreate = (client) {
            client.badCertificateCallback = (cert, host, port) {
              return true;
            };
            // client.findProxy = (uri) {
            //   return 'PROXY 192.168.8.4:8888';
            // };
            return client;
          };

          ddd.get("https://wuxianovel.net:8081").then((resp) {
            print(resp);
          });
        },
      ),
    );
  }
}
