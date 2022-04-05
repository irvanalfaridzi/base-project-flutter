import 'package:base_project/services/interceptor.dart';
import 'package:base_project/util/config.dart';
import 'package:dio/dio.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    dio = Dio();
    dio.options.baseUrl = Config.currentUrl;
    dio.options.connectTimeout = Config.connectTimeout;
    dio.options.receiveTimeout = Config.receiveTimeout;
    dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
    dio.options.headers['Accept-Language'] = 'ind';
    dio.interceptors.add(AppInterceptors());
  }

  Future<Response<T>> post<T>(String url, Map<String, dynamic> data) {
    return dio.post(url, data: data);
  }

  Future<Response<T>> get<T>(String url, Map<String, dynamic> data) {
    return dio.get(url, queryParameters: data);
  }
}
