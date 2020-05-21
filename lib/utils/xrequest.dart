import 'package:dcache_flutter/dcache.dart';
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

  XRequestMethod method;
  String baseUrl;
  String path;
  Map<String, dynamic> query;
  Map<String, dynamic> body;
  Map<String, dynamic> header;

  Duration cacheDuration;
  DCachePolicy cachePolicy;

  XRequest({
    this.method = XRequestMethod.GET,
    this.baseUrl,
    this.path,
    this.query,
    this.body,
    this.header,
    this.cacheDuration = const Duration(days: 3),
    this.cachePolicy = DCachePolicy.refreshFirst,
  });

  Future<Response> send() async {
    final opt = RequestOptions(
      headers: this.header,
      baseUrl: this.baseUrl,
    );
    DCacheOptions optOfCache = DCacheOptions(
      age: this.cacheDuration,
      policy: this.cachePolicy,
    );
    opt.extra = optOfCache.toJson();
    Response resp;
    switch (this.method) {
      case XRequestMethod.GET:
        resp = await _dio.get(this.path,
            queryParameters: this.query, options: opt);
        break;
      case XRequestMethod.POST:
        resp = await _dio.post(
          this.path,
          data: this.body,
          queryParameters: this.query,
          options: opt,
        );
        break;
      default:
    }
    return resp;
  }

  static void setupDio([BaseOptions options]) {
    _dio = Dio(options);
    final DefaultHttpClientAdapter adapter = _dio.httpClientAdapter;
    adapter.onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) {
        return true;
      };
      return client;
    };
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

  static void addCache() {
    final storage = DSqliteStorage(encoder: DCacheEncoder());
    final cacheOption = DCacheOptions(
        age: Duration(days: 7), policy: DCachePolicy.refreshFirst);
    final cache = DCache(
      storage: storage,
      options: cacheOption,
      ignoreFunc: (resp) {
        // 过滤有错误发生的response，因为缓存错误的response没有意义
        // 过滤post或者put的提交数据的response
        if (resp.statusCode != 200 ||
            !(resp.data is Map<String, dynamic>) ||
            resp.request.method == 'POST' ||
            resp.request.method == 'PUT') {
          return true;
        }
        final data = resp.data as Map<String, dynamic>;
        final code = data['code'];
        // 过滤code!=200的respone
        if (!(code == 200 || code == '200')) {
          return true;
        }
        return false;
      },
    );
    _dio.interceptors.add(cache);
  }
}
