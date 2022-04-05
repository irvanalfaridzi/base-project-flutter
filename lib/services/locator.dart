import 'package:base_project/services/api_client.dart';
import 'package:base_project/services/call_service.dart';
import 'package:base_project/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => CallService());
  locator.registerLazySingleton(() => ApiClient());
  debugPrint('Registered Locator');
}
