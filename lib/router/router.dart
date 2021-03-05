import 'package:admin_panel_flutter/router/route_names.dart';
import 'package:admin_panel_flutter/views/home/home_view.dart';
import 'package:admin_panel_flutter/views/user/user_view.dart';
import 'package:admin_panel_flutter/widgets/layout.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView());
    case UsersRoute:
      return _getPageRoute(UserView());
    case LayoutRoute:
      return _getPageRoute(LayoutWidget());
    default:
      return _getPageRoute(LayoutWidget());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
