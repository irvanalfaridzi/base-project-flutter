import 'package:dio/dio.dart';

class Utility {
  static String handleError(DioError error) {
    String errorDescription = "";
    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = "Koneksi gagal, periksa kembali internet anda";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Koneksi timeout dengan server";
        break;
      case DioErrorType.other:
        errorDescription = error.message
            .substring(error.message.indexOf(':') + 2, error.message.length);
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Koneksi timeout saat menerima data dari server";
        break;
      case DioErrorType.response:
        errorDescription =
            "Received invalid status code: ${error.response?.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Connection timeout when send data to server";
        break;
    }
    return errorDescription;
  }
}