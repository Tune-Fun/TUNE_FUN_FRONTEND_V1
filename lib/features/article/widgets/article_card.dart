import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/vote/domain/model/vote_paper_model.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';
import 'package:tunefun_front/theme/theme.dart';

class ArticleCard extends ConsumerWidget {
  final VotePaperModel article;

  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int remainsDay = article.remainDays;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Container(
          // 외곽 여백 설정
          padding: const EdgeInsets.all(1),
          // 외곽을 그라데이션으로 채우기
          // 투표 여부 필요
          decoration: BoxDecoration(
            gradient: remainsDay != 0
                ? const LinearGradient(
                    colors: [
                      Pallete.pinkColor,
                      Pallete.negativeColor,
                    ],
                  )
                : null,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            // 안쪽 여백 설정
            padding: const EdgeInsets.all(10),
            // 안쪽을 흰색으로 채우고 테두리 설정
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: remainsDay != 0
                    ? const Color.fromRGBO(153, 153, 153, 1)
                    : const Color.fromRGBO(234, 234, 234, 1),
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제목과 작성자 정보
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/7036/production/_111162782__313.jpg',
                        ),
                        radius: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        article.title,
                        style: const TextStyle(
                            color: Pallete.textMainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    GradientContainer(
                        height: 30,
                        width: 66,
                        borderRadius: BorderRadius.circular(12),
                        type: remainsDay == 0 ? "voteEndBox" : "fill",
                        child: Center(
                          child: Text(
                            "$remainsDay",
                            style: TextStyle(
                              color: remainsDay == 0
                                  ? const Color.fromRGBO(102, 102, 102, 1)
                                  : Pallete.bgMainColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                // 내용
                Text(
                  article.title,
                  style: const TextStyle(
                    color: Pallete.textMainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                // 작성일 및 투표, 좋아요 정보
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 투표 정보
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            ImageConstants.homeVoteGreyIcon,
                            height: 13,
                            width: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          article.totalVoteCount.toString(),
                          style: const TextStyle(
                            color: Pallete.textMainColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    // 좋아요 정보
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            ImageConstants.homeLikeGreyIcon,
                            height: 13,
                            width: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${article.totalLikeCount}",
                          style: const TextStyle(
                            color: Pallete.textMainColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // if (article.isVoted) ...[
                    //   const GradientText(
                    //       text: "투표완료",
                    //       gradient: LinearGradient(colors: [
                    //         Color.fromRGBO(251, 92, 102, 1),
                    //         Color.fromRGBO(250, 35, 48, 1)
                    //       ])),
                    //   const SizedBox(
                    //     width: 5,
                    //   ),
                    //   SvgPicture.asset(ImageConstants.doneColorIcon)
                    // ]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
