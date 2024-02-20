// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class ArticleModel {
  final int id;
  final String title;
  final String uuid;
  final String content;
  final int votes;
  final int likes;
  final String articleType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.uuid,
    required this.content,
    required this.votes,
    required this.likes,
    required this.articleType,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  ArticleModel copyWith({
    int? id,
    String? title,
    String? uuid,
    String? content,
    int? votes,
    int? likes,
    String? articleType,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      uuid: uuid ?? this.uuid,
      content: content ?? this.content,
      votes: votes ?? this.votes,
      likes: likes ?? this.likes,
      articleType: articleType ?? this.articleType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'uuid': uuid,
      'content': content,
      'votes': votes,
      'likes': likes,
      'articleType': articleType,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt.millisecondsSinceEpoch,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] as int,
      title: map['title'] as String,
      uuid: map['uuid'] as String,
      content: map['content'] as String,
      votes: map['votes'] as int,
      likes: map['likes'] as int,
      articleType: map['articleType'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      deletedAt: DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(id: $id, title: $title, uuid: $uuid, content: $content, votes: $votes, likes: $likes, articleType: $articleType, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant ArticleModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.uuid == uuid &&
        other.content == content &&
        other.votes == votes &&
        other.likes == likes &&
        other.articleType == articleType &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        uuid.hashCode ^
        content.hashCode ^
        votes.hashCode ^
        likes.hashCode ^
        articleType.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode;
  }
}
