import 'package:flutter/material.dart';
import 'package:newsflux/constants/dimenstions.dart';
import 'package:newsflux/models/article.model.dart';
import 'package:newsflux/ui/widgets/article_card.dart';
import 'package:newsflux/ui/widgets/category_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 0;

  List<String> categories = [
    "All",
    "How To Guides",
    "Inspiration",
    "Tech",
    "Sports",
    "Politics"
  ];

  void _updateCategorySelected(int index) {
    setState(() {
      _selectedCategory = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = categories[_selectedCategory];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: PADDING / 4),
          child: const Text(
            "Flux",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: PADDING / 2),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.share,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: PADDING, vertical: 8.0),
              height: 2.5,
              color: Theme.of(context).dividerColor,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: PADDING),
            sliver: SliverToBoxAdapter(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: PADDING),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: PADDING, vertical: 8.0),
              height: 2.5,
              color: Theme.of(context).dividerColor,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: PADDING),
          ),
          // Category horizontal scroll
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: PADDING, vertical: 8.0),
              height: 30.0,
              child: ListView.builder(
                itemBuilder: (context, index) => CategoryButton(
                  onTapCallBack: () {
                    _updateCategorySelected(index);
                  },
                  text: categories[index],
                  selected: _selectedCategory == index,
                ),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: PADDING),
          ),
          // News cards
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: PADDING, vertical: PADDING / 2),
                      child: Column(
                        children: [
                          ArticleCard(
                            article: Article.dummy(),
                          ),
                          const Divider(
                            thickness: 1.5,
                          ),
                        ],
                      ),
                    ),
                childCount: 10),
          ),

          // SliverToBoxAdapter(
          //   child: Text(
          //     title,
          //     style: Theme.of(context).textTheme.headline2,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Text(
          //     title,
          //     style: Theme.of(context).textTheme.bodyText1,
          //   ),
          // ),
        ],
      ),
    );
  }
}
