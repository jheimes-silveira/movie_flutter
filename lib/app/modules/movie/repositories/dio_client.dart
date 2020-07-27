import 'package:dio/dio.dart';
import 'package:movie_flutter/app/config/env.dart';

class DioClient {
  static Dio _singleton;

  DioClient._();

  static Dio getInstance() {
    if (_singleton == null) {
      _singleton = createInstance(Env.getUrlBase(), 15 * 1000);
    }

    return _singleton;
  }

  static Dio createInstance(String url, int timeout) {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      connectTimeout: timeout,
      receiveTimeout: timeout,
    );

    options.headers["Content-Type"] = "application/json";

    Dio dio = new Dio(options);

    return dio;
  }

  static updateInstance(Dio dio) {
    _singleton = dio;
  }
}
