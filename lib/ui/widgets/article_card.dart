import 'package:flutter/material.dart';
import 'package:newsflux/constants/dimenstions.dart';
import 'package:newsflux/models/article.model.dart';
import 'package:newsflux/ui/detail.screen.dart';
import 'package:newsflux/utils/string_capitalize.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => DetailScreen(
                  article: article,
                )),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 150,
            child: Image.network(
              article.urlToImage!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: PADDING,
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalize(article.title!),
                        style: Theme.of(context).textTheme.headline5,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: PADDING / 2,
                      ),
                      Text(
                        capitalize(article.description!),
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.fade,
                        maxLines: 5,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Learn more",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      InkWell(
                          onTap: (() => {
                                // Open news in detail view
                              }),
                          child: Icon(Icons.arrow_circle_right_rounded))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
