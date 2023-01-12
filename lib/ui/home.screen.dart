import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsflux/constants/dimenstions.dart';
import 'package:newsflux/controllers/article.controller.dart';
import 'package:newsflux/ui/widgets/article_card.dart';
import 'package:newsflux/ui/widgets/category_button.dart';
import 'package:newsflux/ui/widgets/headline_card.dart';
import 'package:newsflux/utils/string_capitalize.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedCategory = 0;

  // Default list of articles displayed
  String title = "all categories";

  // An extract of all the news sources by names for filtration
  List<String> sources = [
    "all categories",
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];

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
    final headlines = ref.watch(getHeadlinesController);
    final articles = ref.watch(getArticlesController);

    // Display headlines
    _showHeadlines() {
      return headlines.when(
          data: ((data) => SliverToBoxAdapter(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: PADDING, vertical: 8.0),
                  height: 200.0,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(right: PADDING / 2),
                      child: HeadlineCard(
                        // article: headlines[index],
                        article: data![index],
                      ),
                    ),
                    itemCount: data != null ? data.length : 0,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              )),
          error: (Object error, StackTrace stackTrace) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text("Error loading headlines: ${error.toString()}"),
              ),
            );
          },
          loading: () {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
    }

    // Show loaded articles
    _showArticles() {
      return articles.when(
          data: ((data) => SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: PADDING, vertical: PADDING / 2),
                          child: Column(
                            children: [
                              ArticleCard(
                                article: data[index],
                              ),
                              const Divider(
                                thickness: 1.5,
                              ),
                            ],
                          ),
                        ),
                    childCount: data!.length),
              )),
          error: (Object error, StackTrace stackTrace) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text("Error loading articles: ${error.toString()}"),
              ),
            );
          },
          loading: () {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset("assets/icons/logo_int.png"),
        // title: Text("NewsFlux"),
        // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: PADDING / 2),
          //   child: InkWell(
          //     onTap: () {},
          //     child: const Icon(
          //       Icons.search,
          //       color: Colors.black,
          //       size: 28,
          //     ),
          //   ),
          // ),
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
                "Headlines",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: SizedBox(height: PADDING),
          ),
          // Category horizontal scroll
          _showHeadlines(),

          const SliverToBoxAdapter(child: Divider()),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: PADDING),
            sliver: SliverToBoxAdapter(
              child: Text(
                capitalize(title),
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
                    });
                  },
                  text: capitalize(sources[index]),
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
          _showArticles(),
        ],
      ),
    );
  }
}
