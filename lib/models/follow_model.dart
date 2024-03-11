// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class FollowModel {
  final int id;
  final String follower;
  final String target;
  final DateTime createdAt;

  const FollowModel({
    required this.id,
    required this.follower,
    required this.target,
    required this.createdAt,
  });

  FollowModel copyWith({
    int? id,
    String? follower,
    String? target,
    DateTime? createdAt,
  }) {
    return FollowModel(
      id: id ?? this.id,
      follower: follower ?? this.follower,
      target: target ?? this.target,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'follower': follower,
      'target': target,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory FollowModel.fromMap(Map<String, dynamic> map) {
    return FollowModel(
      id: map['id'] as int,
      follower: map['follower'] as String,
      target: map['target'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowModel.fromJson(String source) =>
      FollowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FollowModel(id: $id, follower: $follower, target: $target, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant FollowModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.follower == follower &&
        other.target == target &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        follower.hashCode ^
        target.hashCode ^
        createdAt.hashCode;
  }
}
