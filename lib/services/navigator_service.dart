import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateToBack(BuildContext context) {
    return navigatorKey.currentState!.pop(context);
  }

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateReplaceTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  Future<dynamic> navigateToRemove(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route route) => false,
        arguments: false);
  }
}
