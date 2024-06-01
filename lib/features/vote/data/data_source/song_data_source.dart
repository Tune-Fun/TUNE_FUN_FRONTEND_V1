import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/url_constants.dart';
import 'package:tunefun_front/features/vote/data/dto/song_dto.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/token_controller.dart';

final songDataSourceProvider = Provider<SongDataSource>((ref) {
  return SongDataSource(ref);
});

class SongDataSource {
  final Ref ref;
  SongDataSource(this.ref);

  Future<List<SongFromSpotifyDTO>> searchSong(String artist) async {
    final accessTokenManager = AccessTokenManager();
    final accessToken = await accessTokenManager.getAccessToken();
    final searchUrl = "${UrlConstants.spotifyURL}/search?q=$artist&type=track";
    final response = await http.get(
      Uri.parse(searchUrl),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    final data = jsonDecode(response.body);
    final tracks = data['tracks']['items'] as List;

    List<SongFromSpotifyDTO> songs = tracks.map((song) {
      String songId = song['id'];
      String artistName = song['artists'] != null && song['artists'].isNotEmpty
          ? song['artists'][0]['name']
          : 'Unknown Artist';
      String songTitle = song['name'] ?? 'Unknown Title';
      String songImage = song['album']["images"][2]['url'];
      return SongFromSpotifyDTO(
          songId: songId,
          artistName: artistName,
          songName: songTitle,
          songImage: songImage);
    }).toList();

    return songs;
  }
}
