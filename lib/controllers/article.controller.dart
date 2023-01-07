// A provider that returns a list of articles
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsflux/models/article.model.dart';
// import 'package:newsflux/services/article.service.dart';

final articlesProvider = Provider<List<Article>>((ref) {
  List<Article> articles = List.generate(20, ((index) => Article.dummy()));

  return articles;
});
