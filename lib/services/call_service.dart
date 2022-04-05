import 'package:base_project/services/api_client.dart';
import 'package:base_project/services/locator.dart';
import 'package:base_project/util/config.dart';
import 'package:base_project/util/constant.dart';
import 'package:dio/dio.dart';

class CallService {
  var apiClient = locator<ApiClient>();
  CallService();

  Future<Response<dynamic>> connect(
      String path, Map<String, dynamic> data, String method) async {
    try {
      Response<dynamic> response;
      var json = data;

      if (Constant.showLog) Config.log('paramsss $json');

      switch (method) {
        case Constant.get:
          response = await apiClient.get(path, json);
          break;
        case Constant.post:
          response = await apiClient.post(path, json);
          break;
        default:
          response = await apiClient.post(path, json);
      }
      return response;
    } catch (e) {
      if (Constant.showLog) Config.log(e.toString());
      throw Exception(e.toString());
    }
  }
}
