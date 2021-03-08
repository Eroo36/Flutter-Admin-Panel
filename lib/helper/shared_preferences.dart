import 'package:shared_preferences/shared_preferences.dart';

Future setToken(String value) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setString('token', value);
}

Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.get('token');
}
