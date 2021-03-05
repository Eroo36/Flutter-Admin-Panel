import 'package:admin_panel_flutter/helper/navigation_helper.dart';
import 'package:admin_panel_flutter/locator.dart';
import 'package:admin_panel_flutter/router/route_names.dart';
import 'package:admin_panel_flutter/router/router.dart';
import 'package:admin_panel_flutter/widgets/header_menu.dart';
import 'package:admin_panel_flutter/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  static const routeName = '/layout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideMenuWidget(),
          Expanded(
            child: Column(
              children: [
                HeaderWidget(),
                Expanded(
                    child: Navigator(
                  key: locator<NavigationHelper>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: HomeRoute,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
