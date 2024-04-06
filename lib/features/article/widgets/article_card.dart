import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/controllers/auth_controller.dart';
import 'package:tunefun_front/presentation/views/auth/login_view.dart';
import 'package:tunefun_front/models/models.dart';
import 'package:tunefun_front/theme/theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCard extends ConsumerWidget {
  final ArticleModel article;

  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUser = ref.watch(authControllerProvider);

    void onArticleClicked() {
      if (isUser == true) {
        showSnackBar(context, '이미 로그인 했습니다!');
        // 이제 투표 화면으로 이동하면 된다.
      } else {
        Navigator.push(
          context,
          LoginScreen.route(),
        );
      }
    }

    return GestureDetector(
      onTap: onArticleClicked,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Container(
          // 외곽 여백 설정
          padding: const EdgeInsets.all(1),
          // 외곽을 그라데이션으로 채우기
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Pallete.pinkColor,
                Pallete.redColor,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            // 안쪽 여백 설정
            padding: const EdgeInsets.all(10),
            // 안쪽을 흰색으로 채우고 테두리 설정
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
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
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // 내용
                Text(
                  article.content,
                  style: const TextStyle(
                    color: Pallete.textMainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                // 작성일 및 투표, 좋아요 정보
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 작성일
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Pallete.pinkColor,
                          width: 2, // border 두께 지정
                        ),
                        color: Pallete.pinkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        timeago.format(
                          // article.deletedAt.difference(article.createdAt),
                          article.createdAt,
                          locale: 'en',
                        ),
                        style: const TextStyle(
                          color: Pallete.textMainColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // 투표 정보
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            ImageConstants.pollIcon,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          article.votes.toString(),
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
                            ImageConstants.heartIcon,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          article.likes.toString(),
                          style: const TextStyle(
                            color: Pallete.textMainColor,
                          ),
                        ),
                      ],
                    ),
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
