import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/url_constants.dart';
import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/features/vote/data/dto/song_dto.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/token_controller.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/models/vote_paper_model.dart';

class VoteDataSource {
  FutureEither<List<VotePaperModel>> getVotesList() async {
    final response = await http.get(Uri.parse(''));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<VotePaperModel> voteList =
          data.map((item) => VotePaperModel.fromJson(item)).toList();
      return right(voteList);
    } else {
      throw Exception('fail');
    }
  }

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
      String artistName = song['artists'] != null && song['artists'].isNotEmpty
          ? song['artists'][0]['name']
          : 'Unknown Artist';
      String songTitle = song['name'] ?? 'Unknown Title';
      return SongDto(artistName: artistName, songName: songTitle);
    }).toList();
    return songs;
  }
}
