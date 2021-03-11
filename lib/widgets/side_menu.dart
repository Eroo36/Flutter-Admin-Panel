import 'package:admin_panel_flutter/helper/sizes.dart';
import 'package:admin_panel_flutter/locator.dart';
import 'package:admin_panel_flutter/router/route_names.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:admin_panel_flutter/helper/navigation_helper.dart';

class SideMenuWidget extends StatelessWidget {
  SideMenuWidget({
    Key? key,
    menuItems,
  }) : super(key: key);

  static const routeName = '/side';

  final List menuItems = [
    // this list is just a test for having dynamic buttons
    {'icon': FontAwesomeIcons.home, 'title': 'Home', 'route': HomeRoute},
    {'icon': FontAwesomeIcons.users, 'title': 'Users', 'route': UsersRoute},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      constraints: const BoxConstraints(minWidth: 150, minHeight: 200),
      key: key,
      width: displayWidth(context) / 8,
      height: displayHeight(context),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.orange, Colors.red[300]!])),
      child: Wrap(children: [
        Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(minHeight: 30, minWidth: 50),
            margin: const EdgeInsets.only(top: 15),
            child: Image.asset(
              '../assets/images/Spotify.png',
              width: displayWidth(context) / 6,
            )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 0,
              color: Colors.red[200],
            )),
        Scrollbar(
          child: ListView.separated(
              separatorBuilder: (context, i) => Divider(),
              itemCount: menuItems.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return LayoutBuilder(builder: (context, constraint) {
                  return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                      dense: true,
                      onTap: () {
                        locator<NavigationHelper>()
                            .navigateTo(menuItems[index]['route']);
                      },
                      leading: FaIcon(
                        menuItems[index]['icon'],
                        size: 15,
                      ),
                      title: Transform.translate(
                          offset: Offset(-26, 0),
                          child: AutoSizeText(
                            menuItems[index]['title'],
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyle(fontSize: 17),
                          )));
                });
              }),
        ),
      ]),
    );
  }
}
