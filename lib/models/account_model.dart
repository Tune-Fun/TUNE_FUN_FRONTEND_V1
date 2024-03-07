// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

export './article_model.dart';
export './vote_model.dart';
export 'account_model.dart';

@immutable
class AccountModel {
  final String username;
  final String password;
  final String email;
  final String nickname;
  final bool? voteProgressNotification;
  final bool? voteEndNotification;
  final bool? voteDeliveryNotification;
  final List<String>? roles;
  final String? accessToken;
  final String? refreshToken;
  final DateTime? lastLoginAt;
  final DateTime? lastLogoutAt;
  final String? profileImageUrl;
  final DateTime? emailVerifiedAt;
  final DateTime? withdrawalAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  AccountModel({
    required this.username,
    required this.password,
    required this.email,
    required this.nickname,
    this.voteProgressNotification,
    this.voteEndNotification,
    this.voteDeliveryNotification,
    this.roles,
    this.accessToken,
    this.refreshToken,
    this.lastLoginAt,
    this.lastLogoutAt,
    this.profileImageUrl,
    this.emailVerifiedAt,
    this.withdrawalAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  AccountModel copyWith({
    String? username,
    String? password,
    String? email,
    String? nickname,
    bool? voteProgressNotification,
    bool? voteEndNotification,
    bool? voteDeliveryNotification,
    List<String>? roles,
    String? accessToken,
    String? refreshToken,
    DateTime? lastLoginAt,
    DateTime? lastLogoutAt,
    String? profileImageUrl,
    DateTime? emailVerifiedAt,
    DateTime? withdrawalAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return AccountModel(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      voteProgressNotification:
          voteProgressNotification ?? this.voteProgressNotification,
      voteEndNotification: voteEndNotification ?? this.voteEndNotification,
      voteDeliveryNotification:
          voteDeliveryNotification ?? this.voteDeliveryNotification,
      roles: roles ?? this.roles,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      lastLogoutAt: lastLogoutAt ?? this.lastLogoutAt,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      withdrawalAt: withdrawalAt ?? this.withdrawalAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'email': email,
      'nickname': nickname,
      'voteProgressNotification': voteProgressNotification,
      'voteEndNotification': voteEndNotification,
      'voteDeliveryNotification': voteDeliveryNotification,
      'roles': roles,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'lastLoginAt': lastLoginAt?.millisecondsSinceEpoch,
      'lastLogoutAt': lastLogoutAt?.millisecondsSinceEpoch,
      'profileImageUrl': profileImageUrl,
      'emailVerifiedAt': emailVerifiedAt?.millisecondsSinceEpoch,
      'withdrawalAt': withdrawalAt?.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      nickname: map['nickname'] as String,
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
      lastLoginAt: map['lastLoginAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastLoginAt'] as int)
          : null,
      lastLogoutAt: map['lastLogoutAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastLogoutAt'] as int)
          : null,
      profileImageUrl: map['profileImageUrl'] != null
          ? map['profileImageUrl'] as String
          : null,
      emailVerifiedAt: map['emailVerifiedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['emailVerifiedAt'] as int)
          : null,
      withdrawalAt: map['withdrawalAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['withdrawalAt'] as int)
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
          : null,
      deletedAt: map['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModel(username: $username, password: $password, email: $email, nickname: $nickname, voteProgressNotification: $voteProgressNotification, voteEndNotification: $voteEndNotification, voteDeliveryNotification: $voteDeliveryNotification, roles: $roles, accessToken: $accessToken, refreshToken: $refreshToken, lastLoginAt: $lastLoginAt, lastLogoutAt: $lastLogoutAt, profileImageUrl: $profileImageUrl, emailVerifiedAt: $emailVerifiedAt, withdrawalAt: $withdrawalAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant AccountModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.email == email &&
        other.nickname == nickname &&
        other.voteProgressNotification == voteProgressNotification &&
        other.voteEndNotification == voteEndNotification &&
        other.voteDeliveryNotification == voteDeliveryNotification &&
        listEquals(other.roles, roles) &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.lastLoginAt == lastLoginAt &&
        other.lastLogoutAt == lastLogoutAt &&
        other.profileImageUrl == profileImageUrl &&
        other.emailVerifiedAt == emailVerifiedAt &&
        other.withdrawalAt == withdrawalAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        nickname.hashCode ^
        voteProgressNotification.hashCode ^
        voteEndNotification.hashCode ^
        voteDeliveryNotification.hashCode ^
        roles.hashCode ^
        accessToken.hashCode ^
        refreshToken.hashCode ^
        lastLoginAt.hashCode ^
        lastLogoutAt.hashCode ^
        profileImageUrl.hashCode ^
        emailVerifiedAt.hashCode ^
        withdrawalAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode;
  }
}
