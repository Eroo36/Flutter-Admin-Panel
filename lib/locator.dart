import 'package:get_it/get_it.dart';
import 'package:admin_panel_flutter/helper/navigation_helper.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationHelper());
}
