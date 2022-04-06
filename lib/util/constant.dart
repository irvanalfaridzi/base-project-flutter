import 'package:flutter/material.dart';

class Constant {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static String appName = 'Base Project Flutter';
  static const bool showLog = true;

  static const String get = 'GET';
  static const String post = 'POST';

  //RESPONSE CODE
  static const String rSUCCESS = '200';
  static const String rTIMEOUT = '404';
  static const String rREFUSED = 'Connection refused';
  static const String rFAILED = 'Connection failed';
  static const String rSOCKETEXC = 'SocketException';
  static const String rEXCEPT = 'Exception:';
  static const String errSERVER = '500';

  //PATH ENDPOINT
  static const String singleUser = 'users/';
  static const String listUser = 'users?page=';
  static const String login = 'login';
  static const String register = 'register';
}
