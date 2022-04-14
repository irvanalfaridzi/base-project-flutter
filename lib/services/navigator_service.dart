import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateToBack(BuildContext context) {
    return navigatorKey.currentState!.pop(context);
  }

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateToWithArgument(String routeName, Object? data) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: data);
  }

  Future<dynamic> navigateReplaceTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  Future<dynamic> navigateToRemove(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route route) => false,
      arguments: false,
    );
  }

  Future<dynamic> navigateToRemoveWithArg(String routeName, Object? args) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route route) => false,
      arguments: args,
    );
  }
}
