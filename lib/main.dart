import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:app/utils/xrequest.dart';
import 'package:app/xroutes.dart';

void main() {
  final option = BaseOptions(
    // baseUrl: "https://wuxianovel.net:8081",
    baseUrl: "http://wuxianovel.net:8080",
    connectTimeout: 5000,
    receiveTimeout: 5000,
    sendTimeout: 5000,
    headers: {
      'Authorization': 'Bearer token',
      'common-header': 'xx',
    },
  );
  XRequest.setupDio(option);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'XBottomController',
      onGenerateRoute: XRoutes.routeGenerater,
      onUnknownRoute: XRoutes.unknownGenerater,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
    );
  }
}
