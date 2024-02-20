import 'dart:convert';

import 'package:tunefun_front/models/models.dart';
import 'package:http/http.dart' as http;

class DataSource {
  Future<List<VoteListModel>> getVotesList() async {
    final response = await http.get(Uri.parse(''));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<VoteListModel> voteList =
          data.map((item) => VoteListModel.fromJson(item)).toList();
      return voteList;
    } else {
      throw Exception('fail');
    }
  }
}
