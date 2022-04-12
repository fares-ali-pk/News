import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_application/models/top_techCrunch.dart';
import 'package:news_application/utilities/api_utilities.dart';

class TopTechCrunchAPI{

  Future<List<TopTechCrunch>> fetchTopTechCrunch() async {
    List<TopTechCrunch> topTechCrunch = [];

    String allTopTechCrunchApi = base_api + all_top_techCrunch_api;
    var response = await http.get(Uri.parse(allTopTechCrunchApi));

    //print(response.statusCode);

    if (response.statusCode == 200) {

      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];

      for (var item in data){
        TopTechCrunch topnews = TopTechCrunch(
          author: (item["author"] == null) ? "UnKnow" : item["author"].toString(),
          title: (item["title"] == null) ? "UnKnow" : item["title"].toString(),
          description: (item["description"] == null) ? "UnKnow" : item["description"].toString(),
          url: (item["url"] == null) ? "UnKnow" : item["url"].toString(),
          urlToImage: (item["urlToImage"] == null) ? "assets/images/hs01.jpg" : item["urlToImage"].toString(),
          publishedAt: (item["publishedAt"] == null) ? "UnKnow" : item["publishedAt"].toString(),
          content: (item["content"] == null) ? "UnKnow" : item["content"].toString(),
        );
        //print("10000000");
        //print(article.author);
        topTechCrunch.add(topnews);
      }
    }
    return topTechCrunch;
  }

}