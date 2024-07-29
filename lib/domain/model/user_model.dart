// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

class UserInfo {
  final String? username; //
  final String? password;
  final String? email; //
  final String? nickname; //
  // final bool emailChecked; //

  // 알림에 대한 변수 4개 필요
  final bool? voteProgressNotification; //
  final bool? voteEndNotification; //
  final bool? voteDeliveryNotification; //

  final List<String>? roles; //
  final String? profileImageUrl; //
  final bool? emailVerified;

  UserInfo(
      {required this.username,
      required this.password,
      required this.email,
      required this.nickname,
      required this.voteProgressNotification,
      required this.voteEndNotification,
      required this.voteDeliveryNotification,
      required this.roles,
      required this.profileImageUrl,
      required this.emailVerified});

  UserInfo copyWith({
    String? username,
    String? password,
    String? email,
    String? nickname,
    bool? voteProgressNotification,
    bool? voteEndNotification,
    bool? voteDeliveryNotification,
    List<String>? roles,
    String? profileImageUrl,
    bool? emailVerified,
  }) {
    return UserInfo(
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
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }
}
