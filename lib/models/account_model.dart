// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

export './article_model.dart';
export './vote_model.dart';
export 'account_model.dart';

@immutable
class AccountModel {
  final int id;
  final String uuid;
  final String username;
  final String password;
  final String email;
  final String nickname;
  final String roles;
  final DateTime lastLoginAt;
  final DateTime lastLogOutAt;
  final DateTime emailVerifiedAt;
  final DateTime withDrawlAt;
  final DateTime deletedAt;
  final bool isAccountNonExpired;
  final bool isAccountNonLocked;
  final bool isCredentialsNonExpired;
  final bool isEnabled;
  final bool voteProgressNotification;
  final bool voteEndNotification;
  final bool voteDeliveryNotification;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AccountModel({
    required this.id,
    required this.uuid,
    required this.username,
    required this.password,
    required this.email,
    required this.nickname,
    required this.roles,
    required this.lastLoginAt,
    required this.lastLogOutAt,
    required this.emailVerifiedAt,
    required this.withDrawlAt,
    required this.deletedAt,
    required this.isAccountNonExpired,
    required this.isAccountNonLocked,
    required this.isCredentialsNonExpired,
    required this.isEnabled,
    required this.voteProgressNotification,
    required this.voteEndNotification,
    required this.voteDeliveryNotification,
    required this.createdAt,
    required this.updatedAt,
  });

  AccountModel copyWith({
    int? id,
    String? uuid,
    String? username,
    String? password,
    String? email,
    String? nickname,
    String? roles,
    DateTime? lastLoginAt,
    DateTime? lastLogOutAt,
    DateTime? emailVerifiedAt,
    DateTime? withDrawlAt,
    DateTime? deletedAt,
    bool? isAccountNonExpired,
    bool? isAccountNonLocked,
    bool? isCredentialsNonExpired,
    bool? isEnabled,
    bool? voteProgressNotification,
    bool? voteEndNotification,
    bool? voteDeliveryNotification,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AccountModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      roles: roles ?? this.roles,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      lastLogOutAt: lastLogOutAt ?? this.lastLogOutAt,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      withDrawlAt: withDrawlAt ?? this.withDrawlAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isAccountNonExpired: isAccountNonExpired ?? this.isAccountNonExpired,
      isAccountNonLocked: isAccountNonLocked ?? this.isAccountNonLocked,
      isCredentialsNonExpired:
          isCredentialsNonExpired ?? this.isCredentialsNonExpired,
      isEnabled: isEnabled ?? this.isEnabled,
      voteProgressNotification:
          voteProgressNotification ?? this.voteProgressNotification,
      voteEndNotification: voteEndNotification ?? this.voteEndNotification,
      voteDeliveryNotification:
          voteDeliveryNotification ?? this.voteDeliveryNotification,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'username': username,
      'password': password,
      'email': email,
      'nickname': nickname,
      'roles': roles,
      'lastLoginAt': lastLoginAt.millisecondsSinceEpoch,
      'lastLogOutAt': lastLogOutAt.millisecondsSinceEpoch,
      'emailVerifiedAt': emailVerifiedAt.millisecondsSinceEpoch,
      'withDrawlAt': withDrawlAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt.millisecondsSinceEpoch,
      'isAccountNonExpired': isAccountNonExpired,
      'isAccountNonLocked': isAccountNonLocked,
      'isCredentialsNonExpired': isCredentialsNonExpired,
      'isEnabled': isEnabled,
      'voteProgressNotification': voteProgressNotification,
      'voteEndNotification': voteEndNotification,
      'voteDeliveryNotification': voteDeliveryNotification,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as int,
      uuid: map['uuid'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      nickname: map['nickname'] as String,
      roles: map['roles'] as String,
      lastLoginAt:
          DateTime.fromMillisecondsSinceEpoch(map['lastLoginAt'] as int),
      lastLogOutAt:
          DateTime.fromMillisecondsSinceEpoch(map['lastLogOutAt'] as int),
      emailVerifiedAt:
          DateTime.fromMillisecondsSinceEpoch(map['emailVerifiedAt'] as int),
      withDrawlAt:
          DateTime.fromMillisecondsSinceEpoch(map['withDrawlAt'] as int),
      deletedAt: DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int),
      isAccountNonExpired: map['isAccountNonExpired'] as bool,
      isAccountNonLocked: map['isAccountNonLocked'] as bool,
      isCredentialsNonExpired: map['isCredentialsNonExpired'] as bool,
      isEnabled: map['isEnabled'] as bool,
      voteProgressNotification: map['voteProgressNotification'] as bool,
      voteEndNotification: map['voteEndNotification'] as bool,
      voteDeliveryNotification: map['voteDeliveryNotification'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModel(id: $id, uuid: $uuid, username: $username, password: $password, email: $email, nickname: $nickname, roles: $roles, lastLoginAt: $lastLoginAt, lastLogOutAt: $lastLogOutAt, emailVerifiedAt: $emailVerifiedAt, withDrawlAt: $withDrawlAt, deletedAt: $deletedAt, isAccountNonExpired: $isAccountNonExpired, isAccountNonLocked: $isAccountNonLocked, isCredentialsNonExpired: $isCredentialsNonExpired, isEnabled: $isEnabled, voteProgressNotification: $voteProgressNotification, voteEndNotification: $voteEndNotification, voteDeliveryNotification: $voteDeliveryNotification, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant AccountModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.username == username &&
        other.password == password &&
        other.email == email &&
        other.nickname == nickname &&
        other.roles == roles &&
        other.lastLoginAt == lastLoginAt &&
        other.lastLogOutAt == lastLogOutAt &&
        other.emailVerifiedAt == emailVerifiedAt &&
        other.withDrawlAt == withDrawlAt &&
        other.deletedAt == deletedAt &&
        other.isAccountNonExpired == isAccountNonExpired &&
        other.isAccountNonLocked == isAccountNonLocked &&
        other.isCredentialsNonExpired == isCredentialsNonExpired &&
        other.isEnabled == isEnabled &&
        other.voteProgressNotification == voteProgressNotification &&
        other.voteEndNotification == voteEndNotification &&
        other.voteDeliveryNotification == voteDeliveryNotification &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        nickname.hashCode ^
        roles.hashCode ^
        lastLoginAt.hashCode ^
        lastLogOutAt.hashCode ^
        emailVerifiedAt.hashCode ^
        withDrawlAt.hashCode ^
        deletedAt.hashCode ^
        isAccountNonExpired.hashCode ^
        isAccountNonLocked.hashCode ^
        isCredentialsNonExpired.hashCode ^
        isEnabled.hashCode ^
        voteProgressNotification.hashCode ^
        voteEndNotification.hashCode ^
        voteDeliveryNotification.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
