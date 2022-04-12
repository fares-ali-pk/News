import 'package:flutter/material.dart';
import 'package:news_application/screens/pages/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboardding.dart';
import 'utilities/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen') ?? false;
  Widget screen;
  if (seen == false) {
    screen = OnBoardding();
  } else {
    screen = LogIn();
  }

  runApp(NewsApp(screen));
}

class NewsApp extends StatelessWidget {
  final Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: this._screen,
    );
  }
}
