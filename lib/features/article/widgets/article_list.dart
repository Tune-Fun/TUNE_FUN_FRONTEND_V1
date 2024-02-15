import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/article/widgets/article_card.dart';
import 'package:tunefun_front/models/models.dart';
import 'package:tunefun_front/theme/pallete.dart';

class ArticleList extends ConsumerWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Article> articles = [
      Article(
        id: 0,
        title: '백예린',
        uuid: '',
        content: '추운 겨울, 따뜻한 코코아 한 잔 같은 커버',
        votes: 339,
        likes: 506,
        articleType: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
      Article(
        id: 0,
        title: '로이킴',
        uuid: '',
        content: '불멍 분위기의 노래 부를까요?',
        votes: 820,
        likes: 1234,
        articleType: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
      Article(
        id: 0,
        title: '에스파',
        uuid: '',
        content: '눈이 내리는 순간의 노래',
        votes: 9341,
        likes: 34642,
        articleType: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
      Article(
        id: 0,
        title: '박효신',
        uuid: '',
        content: '오늘의 기분은 어떤가요?',
        votes: 254353,
        likes: 34626,
        articleType: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
      Article(
        id: 0,
        title: '수퍼비',
        uuid: '',
        content: '바운스 바운스',
        votes: 9543,
        likes: 43566,
        articleType: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
      Article(
        id: 0,
        title: '크러쉬',
        uuid: '',
        content: '감성 한스푼',
        votes: 45342,
        likes: 346695,
        articleType: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
      Article(
        id: 0,
        title: 'Coldplay',
        uuid: '',
        content: '따뜻한 봄 같은 노래',
        votes: 2464436,
        likes: 4566324,
        articleType: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Pallete.bgSubColor,
      ),
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, index) {
          final article = articles[index];
          return ArticleCard(article: article);
        },
      ),
    );
  }
}
