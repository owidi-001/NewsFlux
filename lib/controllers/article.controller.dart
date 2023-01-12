// A provider that returns a list of articles
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsflux/models/article_model.dart';
import 'package:newsflux/services/article.service.dart';
// import 'package:newsflux/services/article.service.dart';

final articleController = Provider(((ref) => ArticleController()));

final getArticlesController = FutureProvider<List<Article>?>((ref) {
  final articles = ref.read(articleController).getArticles();
  return articles;
});

final getHeadlinesController = FutureProvider<List<Article>?>((ref) {
  final articles = ref.read(articleController).getHeadlines();
  return articles;
});

class ArticleController {
  List<Article> _articles = <Article>[];
  List<Article> _headlines = <Article>[];

  List<Article> get articles => _articles;
  List<Article> get headlines => _headlines;

  Future<List<Article>?> getArticles() async {
    try {
      List<Article> results =
          await ArticleService().fetchArticles("everything", {"q": "science"});
      if (results.isNotEmpty) {
        _articles = results;
        return results;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<List<Article>?> getHeadlines() async {
    try {
      List<Article> results = await ArticleService()
          .fetchArticles("top-headlines", {"country": "us"});
      if (results.isNotEmpty) {
        _headlines = results;
        return results;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
