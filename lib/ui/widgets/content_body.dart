import 'package:flutter/material.dart';
import 'package:newsflux/constants/dimenstions.dart';

class ContentBody extends StatelessWidget {
  final String content;
  const ContentBody({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    // Split content per paragraph
    var contents = content.split("\n");

    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Column(
                children: [
                  Text(
                    contents[index],
                    // style: Theme.of(context).textTheme.bodyText1,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: PADDING / 2,
                  )
                ],
              ),
          childCount: contents.length),
    );
  }
}
