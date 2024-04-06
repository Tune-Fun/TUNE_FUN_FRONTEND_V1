// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      voteProgressNotification: json['voteProgressNotification'] as bool?,
      voteEndNotification: json['voteEndNotification'] as bool?,
      voteDeliveryNotification: json['voteDeliveryNotification'] as bool?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      lastLogoutAt: json['lastLogoutAt'] == null
          ? null
          : DateTime.parse(json['lastLogoutAt'] as String),
      profileImageUrl: json['profileImageUrl'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'] == null
          ? null
          : DateTime.parse(json['emailVerifiedAt'] as String),
      withdrawalAt: json['withdrawalAt'] == null
          ? null
          : DateTime.parse(json['withdrawalAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'nickname': instance.nickname,
      'voteProgressNotification': instance.voteProgressNotification,
      'voteEndNotification': instance.voteEndNotification,
      'voteDeliveryNotification': instance.voteDeliveryNotification,
      'roles': instance.roles,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'lastLogoutAt': instance.lastLogoutAt?.toIso8601String(),
      'profileImageUrl': instance.profileImageUrl,
      'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
      'withdrawalAt': instance.withdrawalAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
