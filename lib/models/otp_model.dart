// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class OtpModel {
  final String username;
  final String token;

  const OtpModel({
    required this.username,
    required this.token,
  });

  OtpModel copyWith({
    String? username,
    String? token,
  }) {
    return OtpModel(
      username: username ?? this.username,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'token': token,
    };
  }

  factory OtpModel.fromMap(Map<String, dynamic> map) {
    return OtpModel(
      username: map['username'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtpModel.fromJson(String source) =>
      OtpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OtpModel(username: $username, token: $token)';

  @override
  bool operator ==(covariant OtpModel other) {
    if (identical(this, other)) return true;

    return other.username == username && other.token == token;
  }

  @override
  int get hashCode => username.hashCode ^ token.hashCode;
}
