// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDTO {
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

  UserDTO(
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
      'profileImageUrl': profileImageUrl,
      'emailVerified': emailVerified,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      nickname: map['nickname'] != null ? map['nickname'] as String : null,
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
      profileImageUrl: map['profileImageUrl'] != null
          ? map['profileImageUrl'] as String
          : null,
      emailVerified:
          map['emailVerified'] != null ? map['emailVerified'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) =>
      UserDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
