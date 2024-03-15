import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/url_constants.dart';
import 'package:tunefun_front/features/vote/%08controller/token_controller.dart';
import 'package:tunefun_front/features/vote/test/upload_test_model.dart';
import 'package:tunefun_front/models/vote_paper_model.dart';

class VoteDataSource {
  Future<List<VotePaperModel>> getVotesList() async {
    final response = await http.get(Uri.parse(''));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<VotePaperModel> voteList =
          data.map((item) => VotePaperModel.fromJson(item)).toList();
      return voteList;
    } else {
      throw Exception('fail');
    }
  }

  uploadvote(UploadTestModel uploadTestModel) async {
    // final jsonData = uploadTestModel.toJson();
    final response = await http.post(Uri.parse(""));
  }

  searchSong(String artist) async {
    final accessTokenManager = AccessTokenManager();
    final accessToken = await accessTokenManager.getAccessToken();
    final searchUrl = "${UrlConstants.spotifyURL}/search?q=$artist&type=track";
    final response = await http.get(
      Uri.parse(searchUrl),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final tracks = data['tracks']['items'];
      return tracks;
    } else {
      throw Exception('Failed to search songs');
    }
  }
}
