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
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;
  final DateTime endedAt;
  final bool isVoted;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.uuid,
    required this.content,
    required this.votes,
    required this.likes,
    required this.articleType,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.endedAt,
    required this.isVoted,
  });

  ArticleModel copyWith({
    int? id,
    String? title,
    String? uuid,
    String? content,
    int? votes,
    int? likes,
    String? articleType,
    String? username,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    DateTime? endedAt,
    bool? isVoted,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      uuid: uuid ?? this.uuid,
      content: content ?? this.content,
      votes: votes ?? this.votes,
      likes: likes ?? this.likes,
      articleType: articleType ?? this.articleType,
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      endedAt: endedAt ?? this.endedAt,
      isVoted: isVoted ?? this.isVoted,
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
      'username': username,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt.millisecondsSinceEpoch,
      'endedAt': endedAt.millisecondsSinceEpoch,
      'isVoted': isVoted,
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
      username: map['username'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      deletedAt: DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int),
      endedAt: DateTime.fromMillisecondsSinceEpoch(map['endedAt'] as int),
      isVoted: map['isVoted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArticleModel(id: $id, title: $title, uuid: $uuid, content: $content, votes: $votes, likes: $likes, articleType: $articleType, username: $username, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, endedAt: $endedAt, isVoted: $isVoted)';
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
        other.username == username &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.endedAt == endedAt &&
        other.isVoted == isVoted;
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
        username.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        endedAt.hashCode ^
        isVoted.hashCode;
  }
}
