// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class FavoriteModel {
  final int id;
  final String votePaper;
  final String username;
  final DateTime createdAt;

  const FavoriteModel({
    required this.id,
    required this.votePaper,
    required this.username,
    required this.createdAt,
  });

  FavoriteModel copyWith({
    int? id,
    String? votePaper,
    String? username,
    DateTime? createdAt,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
      votePaper: votePaper ?? this.votePaper,
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'votePaper': votePaper,
      'username': username,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'] as int,
      votePaper: map['votePaper'] as String,
      username: map['username'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FavoriteModel(id: $id, votePaper: $votePaper, username: $username, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant FavoriteModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.votePaper == votePaper &&
        other.username == username &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        votePaper.hashCode ^
        username.hashCode ^
        createdAt.hashCode;
  }
}
