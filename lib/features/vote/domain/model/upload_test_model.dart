// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UploadTestModel {
  final String id;
  final String uuid;
  final String userName;
  final String title;
  final String content;
  final bool options;
  final List<SongInfo>? songInfo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  UploadTestModel({
    required this.id,
    required this.uuid,
    required this.userName,
    required this.title,
    required this.content,
    required this.options,
    this.songInfo,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  UploadTestModel copyWith({
    String? id,
    String? uuid,
    String? userName,
    String? title,
    String? content,
    bool? options,
    List<SongInfo>? songInfo,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return UploadTestModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      userName: userName ?? this.userName,
      title: title ?? this.title,
      content: content ?? this.content,
      options: options ?? this.options,
      songInfo: songInfo ?? this.songInfo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'userName': userName,
      'title': title,
      'content': content,
      'options': options,
      'songInfo': songInfo!.map((x) => x.toMap()).toList(),
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
    };
  }

  factory UploadTestModel.fromMap(Map<String, dynamic> map) {
    return UploadTestModel(
      id: map['id'] as String,
      uuid: map['uuid'] as String,
      userName: map['userName'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      options: map['options'] as bool,
      songInfo: map['songInfo'] != null
          ? List<SongInfo>.from(
              (map['songInfo'] as List<int>).map<SongInfo?>(
                (x) => SongInfo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      deletedAt: map['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadTestModel.fromJson(String source) =>
      UploadTestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UploadTestModel(id: $id, uuid: $uuid, userName: $userName, title: $title, content: $content, options: $options, songInfo: $songInfo, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant UploadTestModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.userName == userName &&
        other.title == title &&
        other.content == content &&
        other.options == options &&
        listEquals(other.songInfo, songInfo) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        userName.hashCode ^
        title.hashCode ^
        content.hashCode ^
        options.hashCode ^
        songInfo.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode;
  }
}

class SongInfo {
  final String artistName;
  final String songName;
  final String songImage;
  SongInfo({
    required this.artistName,
    required this.songName,
    required this.songImage,
  });

  SongInfo copyWith({
    String? artistName,
    String? songName,
    String? songImage,
  }) {
    return SongInfo(
      artistName: artistName ?? this.artistName,
      songName: songName ?? this.songName,
      songImage: songImage ?? this.songImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'artistName': artistName,
      'songName': songName,
      'songImage': songImage,
    };
  }

  factory SongInfo.fromMap(Map<String, dynamic> map) {
    return SongInfo(
      artistName: map['artistName'] as String,
      songName: map['songName'] as String,
      songImage: map['songImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongInfo.fromJson(String source) =>
      SongInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SongInfo(artistName: $artistName, songName: $songName)';

  @override
  bool operator ==(covariant SongInfo other) {
    if (identical(this, other)) return true;

    return other.artistName == artistName && other.songName == songName;
  }

  @override
  int get hashCode => artistName.hashCode ^ songName.hashCode;
}
