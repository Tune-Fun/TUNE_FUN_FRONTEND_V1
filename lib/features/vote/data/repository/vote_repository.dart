import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/url_constants.dart';
import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/features/vote/%08controller/token_controller.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/vote_repository.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  FutureEither<List<SongInfo>> searchSong(String artist) async {
    try {
      final accessTokenManager = AccessTokenManager();
      final accessToken = await accessTokenManager.getAccessToken();
      final searchUrl =
          "${UrlConstants.spotifyURL}/search?q=$artist&type=track";
      final response = await http.get(
        Uri.parse(searchUrl),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      final data = jsonDecode(response.body);
      final tracks = data['tracks']['items'];
      List<SongInfo> resultList = tracks.map<SongInfo>((song) {
        String artistName =
            song['artists'] != null && song['artists'].isNotEmpty
                ? song['artists'][0]['name']
                : 'Unknown Artist';
        String songTitle = song['name'] ?? 'Unknown Title';
        return SongInfo(artistName: artistName, songName: songTitle);
      }).toList();
      return right(resultList);
    } catch (e, trace) {
      return left(Failure(e.toString(), trace));
    }
  }
  /*
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
  */
}
