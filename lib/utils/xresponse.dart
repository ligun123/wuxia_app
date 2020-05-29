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
  });

  XResponse.fromOrigin(Response<Map<String, dynamic>> resp,
      [T jsonTransfer(dynamic json)]) {
    final dataJson = resp.data;
    final dataOfData = dataJson["data"];
    this.data = jsonTransfer(dataOfData);
    this.code = dataJson["code"] as int;
    this.msg = dataJson["msg"] as String;
  }

  XResponse.fromError(dynamic e) {
    this.error = e;
    this.code = -1;
    this.msg = e.toString();
  }

  bool isOK() {
    return this.code == 200;
  }
  
}
