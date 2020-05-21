import 'package:dio/dio.dart';
import 'package:dio/src/adapters/io_adapter.dart';

enum XRequestMethod {
  POST,
  GET,
  PUT,
  DELETE,
  UPLOAD,
}

class XRequest {

  static Dio _dio;

  static void setupDio([BaseOptions options]) {
    _dio = Dio(options);
  }

  static void setHeader({String key, dynamic value}) {
    if (_dio.options.headers == null) {
      _dio.options.headers = {};
    }
    _dio.options.headers[key] = value;
  }

  static dynamic getHeader({String key}) {
    return _dio.options.headers[key];
  }

  XRequestMethod method;
  String path;
  Map<String, dynamic> query;
  Map<String, dynamic> body;
  Map<String, dynamic> header;

  XRequest({
    this.method = XRequestMethod.GET,
    this.path,
    this.query,
    this.body,
    this.header,
  });
}
