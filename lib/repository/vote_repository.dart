import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/models/vote_paper_model.dart';

class DataSource {
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

  uploadvote() async {
    final response = await http.post(Uri.parse(""));
  }
}
