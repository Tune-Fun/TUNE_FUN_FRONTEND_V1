// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AccountModel {
  final String? username; //
  final String? password;
  final String? email; //
  final String? nickname; //
  final bool? emailverify; //

  // 알림에 대한 변수 4개 필요
  final bool? voteProgressNotification; //
  final bool? voteEndNotification; //
  final bool? voteDeliveryNotification; //
  final String? accessToken;
  final String? refreshToken;

  final List<String>? roles; //
  final String? profileImageUrl; //

  AccountModel({
    required this.username,
    required this.password,
    required this.email,
    required this.nickname,
    required this.emailverify,
    required this.voteProgressNotification,
    required this.voteEndNotification,
    required this.voteDeliveryNotification,
    required this.roles,
    required this.accessToken,
    required this.refreshToken,
    required this.profileImageUrl,
  });

  AccountModel copyWith({
    String? username,
    String? password,
    String? email,
    String? nickname,
    bool? emailverify,
    bool? voteProgressNotification,
    bool? voteEndNotification,
    bool? voteDeliveryNotification,
    List<String>? roles,
    String? accessToken,
    String? refreshToken,
    String? profileImageUrl,
  }) {
    return AccountModel(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      emailverify: emailverify ?? this.emailverify,
      voteProgressNotification:
          voteProgressNotification ?? this.voteProgressNotification,
      voteEndNotification: voteEndNotification ?? this.voteEndNotification,
      voteDeliveryNotification:
          voteDeliveryNotification ?? this.voteDeliveryNotification,
      roles: roles ?? this.roles,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'email': email,
      'nickname': nickname,
      'emailverify': emailverify,
      'voteProgressNotification': voteProgressNotification,
      'voteEndNotification': voteEndNotification,
      'voteDeliveryNotification': voteDeliveryNotification,
      'roles': roles,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      nickname: map['nickname'] != null ? map['nickname'] as String : null,
      emailverify: map['emailverify'] as bool,
      voteProgressNotification: map['voteProgressNotification'] != null
          ? map['voteProgressNotification'] as bool
          : null,
      voteEndNotification: map['voteEndNotification'] != null
          ? map['voteEndNotification'] as bool
          : null,
      voteDeliveryNotification: map['voteDeliveryNotification'] != null
          ? map['voteDeliveryNotification'] as bool
          : null,
      roles: map['roles'] != null
          ? List<String>.from((map['roles'] as List<String>))
          : null,
      accessToken:
          map['accessToken'] != null ? map['accessToken'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      profileImageUrl: map['profileImageUrl'] != null
          ? map['profileImageUrl'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
