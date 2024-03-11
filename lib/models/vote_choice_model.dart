// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class VoteChoiceModel {
  final int id;
  final String votePaper;
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;

  const VoteChoiceModel({
    required this.id,
    required this.votePaper,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
  });

  VoteChoiceModel copyWith({
    int? id,
    String? votePaper,
    String? username,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VoteChoiceModel(
      id: id ?? this.id,
      votePaper: votePaper ?? this.votePaper,
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'votePaper': votePaper,
      'username': username,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory VoteChoiceModel.fromMap(Map<String, dynamic> map) {
    return VoteChoiceModel(
      id: map['id'] as int,
      votePaper: map['votePaper'] as String,
      username: map['username'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory VoteChoiceModel.fromJson(String source) =>
      VoteChoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VoteChoiceModel(id: $id, votePaper: $votePaper, username: $username, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant VoteChoiceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.votePaper == votePaper &&
        other.username == username &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        votePaper.hashCode ^
        username.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
