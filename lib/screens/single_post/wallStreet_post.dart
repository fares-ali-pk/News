import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_application/models/article_wallStreet.dart';



class WallStreetPost extends StatefulWidget {

  final ArticleWallStreet _articleWallStreet;


  WallStreetPost(this._articleWallStreet);

  @override
  _WallStreetPostState createState() => _WallStreetPostState();
}

class _WallStreetPostState extends State<WallStreetPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget._articleWallStreet.urlToImage),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return _drawDetails();
              } else if (index == 1) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 16.0, bottom: 8.0),
                    child: Text("Comments (12)"),
                  ),
                );
              } else if (index > 1 && index < 14) {
                return _drawCommentsCards();
              } else {
                return _drawMakerComment();
              }
            }, childCount: 15),
          ),
        ],
      ),
    );
  }

  Color _getRandomColor({int minBrightness = 50}) {
    final Random random = Random();
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }

  Widget _drawDetails() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(
        widget._articleWallStreet.content,
        style: TextStyle(
          fontSize: 18,
          letterSpacing: 1.2,
          height: 1.25,
        ),
      ),
    );
  }

  Widget _drawCommentsCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0 ,top: 8.0 , bottom: 16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: _getRandomColor(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Fares Ali Pk"),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text("1 hour" , style: TextStyle(color: Colors.grey),),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Text("I'm the best, you're the best, we're the best"),
        ),
      ],
    );
  }

  Widget _drawMakerComment() {
    return Container(
      color: Color.fromRGBO(241, 245, 247, 1),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write Comment here!',
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "SEND",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600 , color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }



}
