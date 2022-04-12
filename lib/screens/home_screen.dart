import 'package:flutter/material.dart';
import 'package:news_application/screens/pages/about.dart';
import 'package:news_application/screens/pages/contact.dart';
import 'package:news_application/screens/pages/help.dart';
import 'package:news_application/screens/pages/setting.dart';
import 'package:news_application/shared_ui/navigation_drawer.dart';
import 'explore_tab/whats_new.dart';
import 'explore_tab/popular.dart';
import 'explore_tab/favourites.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu {
  HELP,
  ABOUT,
  CONTACT,
  SETTINGS,
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Explore"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          _PopOutMenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "WHAT'S NEW",
            ),
            Tab(
              text: "POPULAR",
            ),
            Tab(
              text: "FAVOURITES",
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: TabBarView(
        children: [
          WhatsNew(),
          Popular(),
          Favourites(),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget _PopOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            child: Text("ABOUT"),
            value: PopOutMenu.ABOUT,
          ),
          PopupMenuItem<PopOutMenu>(
            child: Text("HELP"),
            value: PopOutMenu.HELP,
          ),
          PopupMenuItem<PopOutMenu>(
            child: Text("CONTACT"),
            value: PopOutMenu.CONTACT,
          ),
          PopupMenuItem<PopOutMenu>(
            child: Text("SETTINGS"),
            value: PopOutMenu.SETTINGS,
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch (menu) {
          case PopOutMenu.ABOUT:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            );
            break;
          case PopOutMenu.CONTACT:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Contact()),
            );
            break;
          case PopOutMenu.HELP:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Help()),
            );
            break;
          case PopOutMenu.SETTINGS:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Setting()),
            );
            break;
        }
      },
    );
  }
}
