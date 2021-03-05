import 'package:admin_panel_flutter/locator.dart';
import 'package:admin_panel_flutter/models/user/user_model.dart';
import 'package:admin_panel_flutter/router/route_names.dart';
import 'package:admin_panel_flutter/router/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(
      providers: [ListenableProvider<UserModel>(create: (_) => UserModel())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
      title: 'Flutter Admin Panel',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.latoTextTheme(textTheme)),
      initialRoute: LayoutRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
