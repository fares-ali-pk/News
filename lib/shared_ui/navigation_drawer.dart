import 'package:flutter/material.dart';
import 'package:news_application/models/nav_menu.dart';
import 'package:news_application/screens/facebook_feed.dart';
import 'package:news_application/screens/home_screen.dart';
import 'package:news_application/screens/headline_news.dart';
import 'package:news_application/screens/instagram_feed.dart';
import 'package:news_application/screens/twitter_feed.dart';
import 'package:news_application/utilities/app_utilities.dart';
import 'package:news_application/screens/pages/log_in.dart';
import 'package:news_application/screens/pages/log_out.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}



class _NavigationDrawerState extends State<NavigationDrawer> {

  late List<NavMenuItems> _navigationMenu = [
  NavMenuItems("Explore", () => HomeScreen()),
  NavMenuItems("Headline News", () {return HeadLineNews();}),
  NavMenuItems("Twitter Feeds", () => TwitterFeed()),
  NavMenuItems("Inestagram Feeds",() => InstagramFeed()),
  NavMenuItems("FaceBook Feeds", () => FaceBookFeed()),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isLoggedIn(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == true) {
            _navigationMenu.removeLast();
            _navigationMenu.add(NavMenuItems("LogOut", () => LogOut()));

          } else {
            _navigationMenu.add(NavMenuItems("LogIn/Register", () => LogIn()));
          }
          return Drawer(
            child: Padding(
              padding: const EdgeInsets.only(top: 72, left: 24),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        _navigationMenu[index].title,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 22,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey.shade400,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                _navigationMenu[index].destination(),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: _navigationMenu.length,
              ),
            ),
          );
        });
  }
}
