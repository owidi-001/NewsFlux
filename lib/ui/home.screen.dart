import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsflux/constants/dimenstions.dart';
import 'package:newsflux/controllers/article.controller.dart';
import 'package:newsflux/models/article.model.dart';
import 'package:newsflux/ui/widgets/article_card.dart';
import 'package:newsflux/ui/widgets/category_button.dart';
import 'package:newsflux/ui/widgets/headline_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedCategory = 0;

  // Get the articles from the provider value
  List<Article> articles = [];
  List<Article> headlines = [];

  // Default list of articles displayed
  String title = "All";

  // An extract of all the news sources by names for filtration
  List<String> sources = [
    "All",
    "How To Guides",
    "Inspiration",
    "Tech",
    "Sports",
    "Politics"
  ];

  @override
  void initState() {
    super.initState();
    articles = ref.watch(articlesProvider);
  }

  void changeCategory(int index) {
    setState(() {
      _selectedCategory = index;
      title = sources.elementAt(index);
      // Filter news list display to show the selected sources
      // articles = filterArticlesBySource(sources[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use ref.watch in the build method and ref.read outside /// Ref: https://codewithandrea.com/articles/flutter-state-management-riverpod/#1-using-a-consumerwidget
    final articles = ref.watch(articlesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset("assets/icons/logo_int.png"),
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
                Icons.search,
                color: Colors.black,
                size: 28,
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
          // Top headlines sections
          const SliverToBoxAdapter(child: Divider()),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: PADDING),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Top Headlines",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: SizedBox(height: PADDING),
          ),
          // Category horizontal scroll
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: PADDING, vertical: 8.0),
              height: 200.0,
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  color: Colors.amber,
                  margin: EdgeInsets.only(right: PADDING / 2),
                  child: HeadlineCard(
                    onTapCallBack: () {},
                    // article: headlines[index],
                    article: articles[index],
                  ),
                ),
                itemCount: articles.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: Divider()),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: PADDING),
            sliver: SliverToBoxAdapter(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: Divider()),
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
                    setState(() {
                      _selectedCategory = index;
                      title = sources[_selectedCategory];
                      // print(_selectedCategory);
                      // print(title);
                    });
                  },
                  text: sources[index],
                  selected: _selectedCategory == index,
                ),
                itemCount: sources.length,
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
        ],
      ),
    );
  }
}
