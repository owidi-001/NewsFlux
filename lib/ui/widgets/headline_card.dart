import 'package:flutter/material.dart';
import 'package:newsflux/constants/dimenstions.dart';
import 'package:newsflux/models/article.model.dart';

class HeadlineCard extends StatelessWidget {
  final Article article;
  final Function() onTapCallBack;

  const HeadlineCard(
      {super.key, required this.article, required this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallBack,
      child: Container(
        // height: 200,
        // width: 200,
        child: Stack(children: [
          SizedBox(
            height: 200,
            width: 250,
            child: article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.black45,
                  ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(PADDING / 4),
                height: 50,
                width: 250,
                color: Colors.white70,
                child: Text(
                  article.title!,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ))
        ]),
      ),
    );
  }
}
