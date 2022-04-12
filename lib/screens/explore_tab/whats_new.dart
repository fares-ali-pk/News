import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_application/api/article_wallStreet_api.dart';
import 'package:news_application/api/top_techCrunch_api.dart';
import 'package:news_application/models/top_techCrunch.dart';
import 'package:news_application/models/article_wallStreet.dart';
import 'package:news_application/utilities/data_utilities.dart';
import 'package:news_application/screens/single_post/techCrunch_post.dart';
import 'package:news_application/screens/single_post/wallStreet_post.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  TopTechCrunchAPI _topTechCrunchAPI = TopTechCrunchAPI();
  ArticlesWallStreetAPI _articlesWallStreetAPI = ArticlesWallStreetAPI();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _drawHeader(),
            _drawTopStories(),
            _drawRecentUpdateCard(),
          ],
        ),
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _hStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
    TextStyle _dStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return FutureBuilder(
      future: _topTechCrunchAPI.fetchTopTechCrunch(),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return connectionError();
          case ConnectionState.waiting:
            return loading();
          case ConnectionState.active:
            return loading();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return error(snapshot.error);
            } else {
              if (snapshot.hasData) {
                List<TopTechCrunch> topTechCrunch = snapshot.data;
                Random random = Random();
                int randomIndex = random.nextInt(topTechCrunch.length);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TechCrunchPost(topTechCrunch[randomIndex])),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              topTechCrunch[randomIndex].urlToImage),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          topTechCrunch[randomIndex].title,
                          style: _hStyle,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Text(
                            topTechCrunch[randomIndex]
                                .description
                                .substring(0, 100),
                            style: _dStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return noData();
              }
            }
        }
      },
    );
  }

  Widget _drawTopStories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
          ),
          child: _drawSectionTitle("Top Stories"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: FutureBuilder(
              future: _topTechCrunchAPI.fetchTopTechCrunch(),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return connectionError();
                  case ConnectionState.waiting:
                    return loading();
                  case ConnectionState.active:
                    return loading();
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return error(snapshot.error);
                    } else {
                      if (snapshot.hasData) {
                        List<TopTechCrunch> topTechCrunch = snapshot.data;
                        Random random = Random();
                        int fIndex = random.nextInt(topTechCrunch.length);
                        int sIndex = random.nextInt(topTechCrunch.length);
                        int tIndex = random.nextInt(topTechCrunch.length);
                        if (topTechCrunch.length >= 3) {
                          return Column(
                            children: [
                              _drawSingleRow(topTechCrunch[fIndex]),
                              _drawDivider(),
                              _drawSingleRow(topTechCrunch[sIndex]),
                              _drawDivider(),
                              _drawSingleRow(topTechCrunch[tIndex]),
                            ],
                          );
                        } else {
                          return noEnoughData();
                        }
                      } else {
                        return noData();
                      }
                    }
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawSectionTitle(String sectionTitle) {
    return Text(
      sectionTitle,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _drawSingleRow(TopTechCrunch topTechCrunch) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TechCrunchPost(topTechCrunch)));
        },
        child: Row(
          children: [
            SizedBox(
              width: 124,
              height: 124,
              child: Image(
                image: NetworkImage(topTechCrunch.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      topTechCrunch.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Text(
                          topTechCrunch.author,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.grey.shade600,
                            ),
                            Text(
                              "15 min",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey.shade200,
    );
  }

  Widget _drawRecentUpdateCard() {
    return FutureBuilder(
      future: _articlesWallStreetAPI.fetchAllArticleWallStreet(),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return connectionError();
          case ConnectionState.waiting:
            return loading();
          case ConnectionState.active:
            return loading();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return error(snapshot.error);
            } else {
              if (snapshot.hasData) {
                List<ArticleWallStreet> articlesWallStreet = snapshot.data;
                if (articlesWallStreet.length >= 2) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 16.0, bottom: 8),
                        child: _drawSectionTitle("Recent Updates"),
                      ),
                      _drawSingleCard(Colors.deepOrange, articlesWallStreet[0]),
                      _drawSingleCard(Colors.teal, articlesWallStreet[1]),
                      SizedBox(
                        height: 48,
                      )
                    ],
                  );
                } else {
                  return noEnoughData();
                }
              } else {
                return noData();
              }
            }
        }
      },
    );
  }

  Widget _drawSingleCard(Color color, ArticleWallStreet articlesWallStreet) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WallStreetPost(articlesWallStreet)),
                  );
                },
                child: Image(
                  image: NetworkImage(articlesWallStreet.urlToImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Container(
              padding:
                  EdgeInsets.only(left: 32.0, right: 32.0, top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'SPORT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 16.0, bottom: 8, right: 16.0),
            child: Text(
              articlesWallStreet.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16),
            child: Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.grey.shade600,
                  size: 16,
                ),
                Text(
                  "15 min",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
