import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsflux/models/source_model.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@unfreezed
class Article with _$Article {
  factory Article({
    required final SourceModel? source,
    required final String? author,
    required final String? title,
    required final String? description,
    required final String? url,
    required final String? urlToImage,
    required final String? publishedAt,
    required final String? content,
    @Default(false) bool isFavourite,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
