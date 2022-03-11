import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamedAndRemoveUntil(
      {String? routeName, Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName!,
      (r) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamed({String? routeName, Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      routeName!,
      arguments: arguments,
    );
  }

  BuildContext getContext() {
    return navigatorKey.currentContext!;
  }

  Future<dynamic> push(dynamic route) {
    return navigatorKey.currentState!.push(
      route,
    );
  }

  void removeRoute(dynamic route) {
    return navigatorKey.currentState!.removeRoute(route);
  }

  void pop() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }
}
