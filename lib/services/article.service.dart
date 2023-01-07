import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:newsflux/models/article.model.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  // fetch articles
  Future<List<Article>> fetchArticles(String url) async {
    List<Article> articles = [];

    // var url =
    //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    var url = Uri.https(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=880a2688d3d9431b80669084b3fb4ffc");

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          jsonDecode(response.body) as List<Map<String, dynamic>>;
      articles = jsonResponse.map((e) => Article.fromJson(e)).toList();

      if (kDebugMode) {
        print(articles);
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }

    return articles;
  }
}
