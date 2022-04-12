import 'package:flutter/material.dart';
import 'package:news_application/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Twitter Feeds"),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: ListView.builder(
          padding: EdgeInsets.all(12.0),
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  _cardHeader(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.shade200,
                    margin: EdgeInsets.only(top: 16.0),
                  ),
                  _cardTail(),
                ],
              ),
            );
          },
          itemCount: 20,
        ));
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage("assets/images/hs01.jpg"),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Christina Meyers",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "@ch_meyers",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Fri, 12 May 2020 . 14:30",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  Widget _cardTail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.repeat , size: 32,),
                color: Colors.orange,
              ),
            ),
            Text(
              "25",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "SHARE",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "OPEN",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
