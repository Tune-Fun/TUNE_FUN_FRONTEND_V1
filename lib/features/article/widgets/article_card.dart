import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/models/models.dart';
import 'package:tunefun_front/theme/pallete.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCard extends ConsumerWidget {
  final Article article;

  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Pallete.pointColor, // border 색상 지정
              width: 2, // border 두께 지정
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                article.content,
                style: const TextStyle(
                  color: Pallete.textMainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Pallete.pointColor,
                        width: 2, // border 두께 지정
                      ),
                      color: Pallete.pointColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      timeago.format(
                        article.createdAt,
                        locale: 'en_short',
                      ),
                      style: const TextStyle(
                        color: Pallete.textMainColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          ImageConstants.voteIcon,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          ImageConstants.likeFilledIcon,
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
    );
  }
}
