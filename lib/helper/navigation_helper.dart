import 'package:flutter/cupertino.dart';

class NavigationHelper {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  Future<dynamic> globalNavigateTo(String routeName, BuildContext context) {
    return Navigator.of(context).pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
