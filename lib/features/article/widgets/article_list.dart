import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/article/widgets/article_card.dart';
import 'package:tunefun_front/features/home/widgets/search_text_field.dart';
import 'package:tunefun_front/models/models.dart';
import 'package:tunefun_front/theme/theme.dart';

class ArticleList extends ConsumerStatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArticleListState();
}

class _ArticleListState extends ConsumerState<ArticleList> {
  List<ArticleModel> articles = DummyData.articles;
  String iconState = '';

  @override
  void initState() {
    super.initState();
    articles.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  void onIconStateChanged(String state) {
    setState(() {
      iconState = state;
    });
  }

  void onSortButtonClicked() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text('정렬 기준 선택'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    articles.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  '최신순',
                  style: TextStyle(
                    color: Pallete.textMainColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    articles.sort((a, b) => b.votes.compareTo(a.votes));
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  '투표순',
                  style: TextStyle(
                    color: Pallete.textMainColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: Container(
        decoration: const BoxDecoration(color: Pallete.bgSubColor),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      onIconStateChanged('alarm');
                    },
                    icon: SvgPicture.asset(
                      ImageConstants.notificationIcon,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onIconStateChanged('search');
                    },
                    icon: SvgPicture.asset(
                      ImageConstants.searchIcon,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onIconStateChanged('sort');
                      onSortButtonClicked();
                    },
                    icon: SvgPicture.asset(
                      ImageConstants.sortIcon,
                      height: 18,
                      width: 12,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: iconState == 'search'
                  ? SearchTextField(
                      iconState: iconState,
                      onIconStateChanged: onIconStateChanged,
                      articles: articles,
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final article = articles[index];
                              return ArticleCard(article: article);
                            },
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
