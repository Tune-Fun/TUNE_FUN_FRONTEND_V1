// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SongInfo {
  final String id;
  final String artist_name;
  final String music;
  final String music_image;

  SongInfo(
      {required this.id,
      required this.artist_name,
      required this.music,
      required this.music_image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'artist_name': artist_name,
      'music': music,
      'music_image': music_image,
    };
  }

  factory SongInfo.fromMap(Map<String, dynamic> map) {
    return SongInfo(
      id: map['id'] as String,
      artist_name: map['artist_name'] as String,
      music: map['music'] as String,
      music_image: map['music_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongInfo.fromJson(String source) =>
      SongInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
