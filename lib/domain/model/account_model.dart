import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final String? username;
  final String? password;
  final String? email;
  final String? nickname;
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

  const AccountModel({
    this.username,
    this.password,
    this.email,
    this.nickname,
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
  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
