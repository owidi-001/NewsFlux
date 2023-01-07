import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflux/constants/dimenstions.dart';
import 'package:newsflux/models/article.model.dart';
import 'package:newsflux/ui/widgets/content_body.dart';
import 'package:newsflux/utils/date_converter.dart';

class DetailScreen extends StatelessWidget {
  final Article article;
  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          leading: InkWell(
            onTap: (() => {Navigator.pop(context)}),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PADDING / 2),
              child: InkWell(
                onTap: () {
                  article.isFavourite = !article.isFavourite;
                },
                child: Icon(
                  article.isFavourite
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  size: 24,
                ),
              ),
            ),
            SizedBox(
              width: PADDING / 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PADDING / 2),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.hearing_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: PADDING / 2,
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(PADDING),
              sliver: SliverToBoxAdapter(
                child: Text(
                  article.title!,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ),
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 260.0,
              leading: Container(),
              flexibleSpace: FlexibleSpaceBar(
                // title: Text('SliverAppBar'),
                background: Image.network(article.urlToImage!),
              ),
            ),
            // SliverPadding(
            //   padding: EdgeInsets.all(PADDING),
            //   sliver: SliverToBoxAdapter(
            //     child: Text(
            //       article.title!,
            //       style: Theme.of(context).textTheme.headline5,
            //     ),
            //   ),
            // ),
            SliverPadding(
              padding: EdgeInsets.all(PADDING),
              sliver: SliverToBoxAdapter(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    dateConverter(article.publishedAt!),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
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
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverPadding(
              padding: EdgeInsets.all(PADDING),
              sliver: SliverToBoxAdapter(
                child: Text(article.author!,
                    style: const TextStyle(
                        fontFamily: "monospace",
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: PADDING,
              ),
            )
          ],
        ));
  }
}
