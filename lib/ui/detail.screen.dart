import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflux/constants/dimenstions.dart';
import 'package:newsflux/models/article.model.dart';
import 'package:newsflux/ui/widgets/content_body.dart';

class DetailScreen extends StatelessWidget {
  final Article article;
  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PADDING / 2),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: PADDING / 2,
            ),
          ],
          pinned: _pinned,
          snap: _snap,
          floating: _floating,
          expandedHeight: 260.0,
          flexibleSpace: FlexibleSpaceBar(
            // title: Text('SliverAppBar'),
            background: Image.network(article.urlToImage!),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(PADDING),
          sliver: SliverToBoxAdapter(
            child: Text(
              article.title!,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(PADDING),
          sliver: SliverToBoxAdapter(
            child: Row(children: [
              Text(article.publishedAt!),
              const SizedBox(
                width: 5,
              ),
              Text(article.source!.name!)
            ]),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(PADDING),
          sliver: ContentBody(content: article.content!),
        )
      ],
    ));
  }
}
