import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/article/widgets/article_card.dart';
import 'package:tunefun_front/features/home/widgets/search_text_field.dart';
import 'package:tunefun_front/features/vote/presentation/manager/vote_manager.dart';
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
  String selectedSortOption = '최신순'; // 기본 정렬 값

  @override
  void initState() {
    super.initState();
    articles.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    fetchVotePaper();
  }

  Future<void> fetchVotePaper() async {
    await ref.read(voteManagerProvider.notifier).fetchVotePaper();
  }

  void onIconStateChanged(String state) {
    setState(() {
      iconState = state;
    });
  }

  void onSortOptionChanged(String? newValue) {
    setState(() {
      selectedSortOption = newValue!;
      if (newValue == '최신순') {
        articles.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      } else if (newValue == '투표순') {
        articles.sort((a, b) => b.votes.compareTo(a.votes));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.homeAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
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
                    onIconStateChanged('search');
                  },
                  icon: SvgPicture.asset(
                    ImageConstants.searchIcon,
                    height: 25,
                    width: 25,
                  ),
                ),
                PopupMenuButton<String>(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Pallete.bgMainColor,
                  icon: const Icon(Icons.sort),
                  onSelected: (String value) {
                    setState(() {
                      onSortOptionChanged(value);
                      selectedSortOption = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: '최신순',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '최신순',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: selectedSortOption == "최신순"
                                      ? Pallete.textMainColor
                                      : Pallete.textSubColor),
                            ),
                            selectedSortOption == "최신순"
                                ? const Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Pallete.textMainColor,
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: '투표순',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '투표순',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: selectedSortOption == "투표순"
                                      ? Pallete.textMainColor
                                      : Pallete.textSubColor),
                            ),
                            selectedSortOption == "투표순"
                                ? const Icon(
                                    Icons.check,
                                    size: 20,
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child:
                  // iconState == 'search'
                  //     ? SearchTextField(
                  //         iconState: iconState,
                  //         onIconStateChanged: onIconStateChanged,
                  //         articles: articles,
                  //       )
                  //     :
                  SingleChildScrollView(
            child: Column(
              children: [
                articleList(),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget articleList() {
    final votePaperState = ref.watch(voteManagerProvider);
    if (votePaperState is FetchVotePaperLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (votePaperState is FetchVotePaperSuccess) {
      return ListView.builder(
        itemCount: votePaperState.votePapers.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final article = votePaperState.votePapers[index];
          return ArticleCard(article: article);
        },
      );
    }
    return const SizedBox();
  }
}
