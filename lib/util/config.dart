import 'package:base_project/util/constant.dart';
import 'package:flutter/material.dart';

class Config extends InheritedWidget {
  const Config({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static bool isDebuging = false;
  static int isDevelopment = 0;

  static String currentUrl = "";
  static String currentUrlImage = "";

  static int connectTimeout = 90000;
  static int receiveTimeout = 90000;

  static String http = "http://";
  static String https = "https://";
  static String productionURL = "";
  static String developmentUrl = "reqres.in/";
  static String serverApi = "api/";
  static String serverImage = "";
  static String developmentImageUrl = "";
  static String productionImageUrl = "";

  void isDebug(bool debug) {
    isDebuging = debug;
  }

  void setMode(int mode) {
    if (mode == 0) {
      currentUrl = https + productionURL + serverApi;
      currentUrlImage = https + productionImageUrl;
    } else {
      currentUrl = https + developmentUrl + serverApi;
      currentUrlImage = https + developmentImageUrl;
    }
  }

  static void log(String message) {
    if (isDebuging) {
      if (Constant.showLog) debugPrint(Constant.appName + (" : ") + message);
    }
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
