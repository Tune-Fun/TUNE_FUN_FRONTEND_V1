// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tunefun_front/core/enums/sns_platform_enum.dart';

@immutable
class SocialAccountModel {
  final int id;
  final String username;
  final SNSplatformType snsPlatform;
  final DateTime createdAt;

  const SocialAccountModel({
    required this.id,
    required this.username,
    required this.snsPlatform,
    required this.createdAt,
  });

  SocialAccountModel copyWith({
    int? id,
    String? username,
    SNSplatformType? snsPlatform,
    DateTime? createdAt,
  }) {
    return SocialAccountModel(
      id: id ?? this.id,
      username: username ?? this.username,
      snsPlatform: snsPlatform ?? this.snsPlatform,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'snsPlatform': snsPlatform.type,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory SocialAccountModel.fromMap(Map<String, dynamic> map) {
    return SocialAccountModel(
      id: map['id'] as int,
      username: map['username'] as String,
      snsPlatform: (map['type'] as String).toSNSplatformTypeEnum(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialAccountModel.fromJson(String source) =>
      SocialAccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SocialAccountModel(id: $id, username: $username, snsPlatform: $snsPlatform, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant SocialAccountModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.snsPlatform == snsPlatform &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        snsPlatform.hashCode ^
        createdAt.hashCode;
  }
}
