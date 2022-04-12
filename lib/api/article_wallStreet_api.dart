import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_application/models/article_wallStreet.dart';
import 'package:news_application/utilities/api_utilities.dart';

class ArticlesWallStreetAPI{

  Future<List<ArticleWallStreet>> fetchAllArticleWallStreet() async {
    List<ArticleWallStreet> articlesWallStreet = [];

    String AllArticlesWallStreetApi = base_api + all_articlesWallStreet_api;
    var response = await http.get(Uri.parse(AllArticlesWallStreetApi));

    //print(response.statusCode);

    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];

      for(var item in data){
        ArticleWallStreet article = ArticleWallStreet(
          author: (item["author"] == null) ? "UnKnow" : item["author"].toString(),
          title: (item["title"] == null) ? "UnKnow" : item["title"].toString(),
          description: (item["description"] == null) ? "UnKnow" : item["description"].toString(),
          url: (item["url"] == null) ? "UnKnow" : item["url"].toString(),
          urlToImage: (item["urlToImage"] == null) ? "assets/images/hs01.jpg" : item["urlToImage"].toString(),
          publishedAt: (item["publishedAt"] == null) ? "UnKnow" : item["publishedAt"].toString(),
          content: (item["content"] == null) ? "UnKnow" : item["content"].toString(),
        );
        articlesWallStreet.add(article);
      }
    }
    return articlesWallStreet;
}

}