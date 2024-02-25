// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class UserModel {
  final String email;
  final String username;
  final String password;
  final String nickname;
  final String accountType;

  const UserModel({
    required this.email,
    required this.username,
    required this.password,
    required this.nickname,
    required this.accountType,
  });

  UserModel copyWith({
    String? email,
    String? username,
    String? password,
    String? nickname,
    String? accountType,
  }) {
    return UserModel(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      nickname: nickname ?? this.nickname,
      accountType: accountType ?? this.accountType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
      'password': password,
      'nickname': nickname,
      'accountType': accountType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      nickname: map['nickname'] as String,
      accountType: map['accountType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, username: $username, password: $password, nickname: $nickname, accountType: $accountType)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.username == username &&
        other.password == password &&
        other.nickname == nickname &&
        other.accountType == accountType;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        username.hashCode ^
        password.hashCode ^
        nickname.hashCode ^
        accountType.hashCode;
  }
}
