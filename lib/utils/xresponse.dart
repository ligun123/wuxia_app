import 'package:dio/dio.dart';

class XResponse<T> {
  int code;
  String msg;
  T data;
  dynamic error;

  XResponse({
    this.code,
    this.msg,
    this.data,
    this.error,
  });

  XResponse.fromOrigin(Response<Map<String, dynamic>> resp,
      [T jsonTransfer(dynamic json)]) {
    final dataJson = resp.data;
    this.data = jsonTransfer(dataJson["data"]);
    this.code = dataJson["code"] as int;
    this.msg = dataJson["msg"] as String;
  }
}
