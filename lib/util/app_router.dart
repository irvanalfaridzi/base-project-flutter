import 'package:base_project/ui/pages/pages.dart';
import 'package:base_project/util/config.dart';
import 'package:base_project/util/constant.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route navigateToStartUp() {
    return MaterialPageRoute(builder: (_) => const SplashPage());
  }

  Route navigateToMainPage() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return const MainPage();
    });
  }

  Route navigateToDetailJobPage() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return const DetailJobPage();
    });
  }

  Route routes(RouteSettings? settings) {
    if (Constant.showLog) debugPrint('Route = ${settings?.name}');
    switch (settings!.name) {
      case "/":
        return navigateToStartUp();
      case MainPage.routes:
        return navigateToMainPage();
      case DetailJobPage.routes:
        return navigateToDetailJobPage();
      default:
        return navigateToStartUp();
    }
  }
}