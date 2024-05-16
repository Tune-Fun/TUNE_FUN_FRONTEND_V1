import 'dart:convert';

class SongDto {
  final String songId;
  final String artistName;
  final String songName;
  final String songImage;

  SongDto(
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

  factory SongDto.fromMap(Map<String, dynamic> map) {
    return SongDto(
      songId: map['songId'] as String,
      artistName: map['artistName'] as String,
      songName: map['songName'] as String,
      songImage: map['songImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongDto.fromJson(String source) =>
      SongDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
