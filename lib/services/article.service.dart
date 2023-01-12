import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:newsflux/constants/keys.dart';
import 'package:newsflux/models/article_model.dart';
import 'package:http/http.dart' as http;

class ArticleService with ChangeNotifier {
  // fetch articles
  Future<List<Article>> fetchArticles(
      String toUrl, Map<String, String> params) async {
    List<Article> articles = [];

    params.addAll({'apiKey': NEWS_KEY});

    var url = Uri.https("newsapi.org", '/v2/$toUrl', params);

    if (kDebugMode) {
      print("Init fetch");
    }
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["articles"] as List;

      articles = data.map((e) => Article.fromJson(e)).toList();
      if (kDebugMode) {
        print(articles.length);
        for (var element in articles) {
          print(element.title);
        }
        print("DONE");
      }
    } else {
      if (kDebugMode) {
        print("An error occured");
        print(response.statusCode);
        print(response.body);
      }
    }
    if (kDebugMode) {
      print("Returning values");
    }
    return articles;
  }
}
