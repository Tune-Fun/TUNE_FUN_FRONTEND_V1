import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/url_constants.dart';
import 'package:tunefun_front/features/vote/data/dto/song_dto.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/token_controller.dart';

final voteDataSourceProvider = Provider<VoteDataSource>((ref) {
  return VoteDataSource(ref);
});

class VoteDataSource {
  final Ref ref;
  VoteDataSource(this.ref);
  // FutureEither<List<VotePaperModel>> getVotesList() async {
  //   final response = await http.get(Uri.parse(''));
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = jsonDecode(response.body);
  //     List<VotePaperModel> voteList =
  //         data.map((item) => VotePaperModel.fromJson(item)).toList();
  //     return right(voteList);
  //   } else {
  //     throw Exception('fail');
  //   }
  // }

  uploadvote(UploadTestModel uploadTestModel) async {
    // final jsonData = uploadTestModel.toJson();
    final response = await http.post(Uri.parse(""));
  }

  Future<List<SongDto>> searchSong(String artist) async {
    final accessTokenManager = AccessTokenManager();
    final accessToken = await accessTokenManager.getAccessToken();
    final searchUrl = "${UrlConstants.spotifyURL}/search?q=$artist&type=track";
    final response = await http.get(
      Uri.parse(searchUrl),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    final data = jsonDecode(response.body);
    final tracks = data['tracks']['items'] as List;

    List<SongDto> songs = tracks.map((song) {
      String songId = song['id'];
      String artistName = song['artists'] != null && song['artists'].isNotEmpty
          ? song['artists'][0]['name']
          : 'Unknown Artist';
      String songTitle = song['name'] ?? 'Unknown Title';
      String songImage = song['album']["images"][2]['url'];
      return SongDto(
          songId: songId,
          artistName: artistName,
          songName: songTitle,
          songImage: songImage);
    }).toList();

    return songs;
  }
}
