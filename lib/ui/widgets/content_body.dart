import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                  Text(contents[index]),
                  SizedBox(
                    height: PADDING / 2,
                  )
                ],
              ),
          childCount: contents.length),
    );
  }
}
