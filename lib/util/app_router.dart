import 'package:base_project/ui/pages/pages.dart';
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

  Route navigateToDetailJobPage(final args) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return DetailJobPage(data: args);
    });
  }

  Route navigateToLoginPage() {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }

  Route navigateToSignupPage() {
    return MaterialPageRoute(builder: (_) => const SignUpPage());
  }

  Route routes(RouteSettings settings) {
    if (Constant.showLog) debugPrint('Route = ${settings.name}');
    switch (settings.name) {
      case "/":
        return navigateToStartUp();
      case MainPage.routes:
        return navigateToMainPage();
      case DetailJobPage.routes:
        return navigateToDetailJobPage(settings.arguments);
      case LoginPage.routes:
        return navigateToLoginPage();
      case SignUpPage.routes:
        return navigateToSignupPage();
      default:
        return navigateToStartUp();
    }
  }
}
