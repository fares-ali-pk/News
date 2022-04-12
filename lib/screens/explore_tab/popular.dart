import 'package:flutter/material.dart';
import 'package:news_application/models/article_tesla.dart';
import 'package:news_application/api/articles_tesla_api.dart';
import 'package:news_application/screens/single_post/tesla_post.dart';
import 'package:news_application/utilities/data_utilities.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {

  ArticlesTeslaAPI _articlesTeslaAPI = ArticlesTeslaAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _articlesTeslaAPI.fetchAllArticlesTesla(),
      builder: (context , AsyncSnapshot snapshot){
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
                List<ArticleTesla> articleTesla = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, position) {
                    return Card(
                      child: _drawSingleRow(articleTesla[position]),
                    );
                  },
                  itemCount: articleTesla.length,
                );
              } else {
                return noData();
              }
            }
        }
      },
    );
  }

  Widget _drawSingleRow(ArticleTesla articleTesla) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TeslaPost(articleTesla)),);
        },
        child: Row(
          children: [
            SizedBox(
              width: 144,
              height: 144,
              child: Image(
                image: NetworkImage(articleTesla.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleTesla.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      articleTesla.author,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
