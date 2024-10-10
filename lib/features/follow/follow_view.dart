import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/dummy_data.dart';
import 'package:tunefun_front/features/article/widgets/article_card.dart';
import 'package:tunefun_front/features/vote/domain/model/vote_paper_model.dart';
import 'package:tunefun_front/models/article_model.dart';

class FollowView extends StatelessWidget {
  const FollowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                        ),
                        SizedBox(height: 4),
                        Text('닉네임'),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 2, right: 2),
                color: const Color.fromRGBO(249, 249, 249, 1),
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    VotePaperModel articles = VotePaperModel(
                        id: 30,
                        uuid: 'uuid',
                        title: 'title',
                        authorUsername: 'authorUsername',
                        authorNickname: 'authorNickname',
                        remainDays: 1,
                        totalVoteCount: 'totalVoteCount');
                    return ArticleCard(article: articles);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
