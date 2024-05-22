import 'dart:convert';

import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';

class SongFromSpotifyDTO {
  final String songId;
  final String artistName;
  final String songName;
  final String songImage;

  SongFromSpotifyDTO(
      {required this.songId,
      required this.artistName,
      required this.songName,
      required this.songImage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'songId': songId,
      'artistName': artistName,
      'songName': songName,
      'songImage': songImage,
    };
  }

  factory SongFromSpotifyDTO.fromMap(Map<String, dynamic> map) {
    return SongFromSpotifyDTO(
      songId: map['songId'] as String,
      artistName: map['artistName'] as String,
      songName: map['songName'] as String,
      songImage: map['songImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongFromSpotifyDTO.fromJson(String source) =>
      SongFromSpotifyDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SongInfoDTO {
  final String id;
  final String music;
  final String artist_name;
  final String music_image;

  SongInfoDTO(
      {required this.id,
      required this.music,
      required this.artist_name,
      required this.music_image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'music': music,
      'artist_name': artist_name,
      'music_image': music_image,
    };
  }

  factory SongInfoDTO.fromMap(Map<String, dynamic> map) {
    return SongInfoDTO(
      id: map['id'] as String,
      music: map['music'] as String,
      artist_name: map['artist_name'] as String,
      music_image: map['music_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory SongInfoDTO.fromSongInfo(SongInfo song) {
    return SongInfoDTO(
      id: song.id,
      artist_name: song.artist_name,
      music: song.music,
      music_image: song.music_image,
    );
  }
  factory SongInfoDTO.fromJson(String source) =>
      SongInfoDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
