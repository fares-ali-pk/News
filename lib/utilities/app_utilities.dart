import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLoggedIn() async {
  SharedPreferences sharedPreferences_IsLoggedIn = await SharedPreferences.getInstance();
  bool isLoggedIn = sharedPreferences_IsLoggedIn.getBool("isLoggedIn") ?? false;
  return (isLoggedIn) ? true :  false;
}