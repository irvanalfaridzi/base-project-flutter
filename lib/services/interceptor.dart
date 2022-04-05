import 'package:base_project/util/config.dart';
import 'package:base_project/util/constant.dart';
import 'package:base_project/util/utility.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Config.log('Uri: ' + options.uri.toString());
    Config.log('Header: ' + options.headers.toString());
    Config.log('Path: ' + options.path.toString());
    Config.log('Request: ' + options.data.toString());
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Constant.showLog) Config.log(response.toString());
    if (Constant.showLog) Config.log("<-- END HTTP");

    final result = response.data;
    String message = '';
    try {
      if (result.containsKey('errorCode')) {
        if (result.containsKey('fullMessage')) {
          message = result['fullMessage'] as String;
        }
      }
    } catch (e) {
      Config.log('Error: ${e.toString()}');
    }
    if (message.isNotEmpty) {
      handler.reject(
          DioError(requestOptions: response.requestOptions, error: message),
          false);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Config.log('ERROR: [${err.response?.statusCode}]');
    if (err.message.contains(Constant.rTIMEOUT)) {
      err.type = DioErrorType.cancel;
      err.error = Utility.handleError(err);
    } else if (err.message.contains(Constant.rREFUSED)) {
      err.type = DioErrorType.cancel;
      err.error = Utility.handleError(err);
    } else if (err.message.contains(Constant.rFAILED)) {
      err.type = DioErrorType.cancel;
      err.error = Utility.handleError(err);
    } else if (err.message.contains(Constant.rSOCKETEXC)) {
      err.type = DioErrorType.cancel;
      err.error = Utility.handleError(err);
    } else if (err.message.contains(Constant.rEXCEPT)) {
      err.error = Utility.handleError(err);
    } else {
      err.error = Constant.errSERVER;
    }
    return super.onError(err, handler);
  }
}
