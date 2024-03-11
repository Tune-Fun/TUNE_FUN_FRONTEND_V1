import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/models/article_model.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SearchTextField extends StatefulWidget {
  final String iconState;
  final Function(String) onIconStateChanged;
  final List<ArticleModel> articles;

  const SearchTextField({
    Key? key,
    required this.iconState,
    required this.onIconStateChanged,
    required this.articles,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchController = TextEditingController();
  List<ArticleModel> filteredArticles = [];

  @override
  void initState() {
    super.initState();
    filteredArticles = widget.articles;
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _clearState() {
    _searchController.clear();
    widget.onIconStateChanged('');
    setState(() {
      filteredArticles = widget.articles;
    });
  }

  void searchArticles(String searchText) {
    List<ArticleModel> matchedArticles = [];
    if (searchText.isNotEmpty) {
      matchedArticles = widget.articles.where((article) {
        return article.title.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    } else {
      matchedArticles = widget.articles;
    }

    setState(() {
      filteredArticles = matchedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Add a floating search bar to the app
        SliverAppBar(
          floating: true,
          // Use a Material design search bar
          title: TextField(
            controller: _searchController,
            onChanged: searchArticles,
            decoration: InputDecoration(
              hintText: 'Search...',
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () {
                  _clearState();
                },
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final article = filteredArticles[index];

              return GestureDetector(
                onTap: () {
                  // 사용자가 클릭시 투표 상세 페이지로 이동
                  logger.i(article.title);
                  logger.i(article.content);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/7036/production/_111162782__313.jpg',
                        ),
                        radius: 25,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.title,
                              style: const TextStyle(
                                color: Pallete.textMainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'By ${article.username}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: filteredArticles.length,
          ),
        ),
      ],
    );
  }
}
