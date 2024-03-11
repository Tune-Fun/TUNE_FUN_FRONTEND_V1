// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class VotePaperModel {
  final int id;
  final String uuid;
  final String username;
  final DateTime voteEndAt;
  final bool option;
  final DateTime deliveryAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  const VotePaperModel({
    required this.id,
    required this.uuid,
    required this.username,
    required this.voteEndAt,
    required this.option,
    required this.deliveryAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  VotePaperModel copyWith({
    int? id,
    String? uuid,
    String? username,
    DateTime? voteEndAt,
    bool? option,
    DateTime? deliveryAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return VotePaperModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      voteEndAt: voteEndAt ?? this.voteEndAt,
      option: option ?? this.option,
      deliveryAt: deliveryAt ?? this.deliveryAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'username': username,
      'voteEndAt': voteEndAt.millisecondsSinceEpoch,
      'option': option,
      'deliveryAt': deliveryAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt.millisecondsSinceEpoch,
    };
  }

  factory VotePaperModel.fromMap(Map<String, dynamic> map) {
    return VotePaperModel(
      id: map['id'] as int,
      uuid: map['uuid'] as String,
      username: map['username'] as String,
      voteEndAt: DateTime.fromMillisecondsSinceEpoch(map['voteEndAt'] as int),
      option: map['option'] as bool,
      deliveryAt: DateTime.fromMillisecondsSinceEpoch(map['deliveryAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      deletedAt: DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory VotePaperModel.fromJson(String source) =>
      VotePaperModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VotePaperModel(id: $id, uuid: $uuid, username: $username, voteEndAt: $voteEndAt, option: $option, deliveryAt: $deliveryAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant VotePaperModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.username == username &&
        other.voteEndAt == voteEndAt &&
        other.option == option &&
        other.deliveryAt == deliveryAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        username.hashCode ^
        voteEndAt.hashCode ^
        option.hashCode ^
        deliveryAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode;
  }
}
