import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/url_constants.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_model.dart';

final voteDataSourceProvider = Provider<VoteDataSource>((ref) {
  return VoteDataSource(ref);
});

class VoteDataSource {
  final Ref ref;
  VoteDataSource(this.ref);
  final voteURL = UrlConstants.voteURL;

  Future uploadvote(UploadModel uploadModel) async {
    const storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: 'access_token');
    final response = await http.post(Uri.parse(voteURL),
        headers: {
          'authorization': "Bearer $accessToken",
          'Content-Type': "application/json",
          'charset': "UTF-8"
        },
        body: uploadModel.toJson());
    final data = utf8.decode(response.bodyBytes);
    return data;
  }

  Future fetchVotePaper(int lastId, String type) async {
    // 실제 api 통신
    // const storage = FlutterSecureStorage();
    // final accessToken = await storage.read(key: 'access_token');
    // final url = "$voteURL$lastId$type";
    // final response = await http.get(
    //   Uri.parse(url),
    //   headers: {
    //     'authorization': "Bearer $accessToken",
    //     'Content-Type': "application/json",
    //     'charset': "UTF-8",
    //   },
    // );
    // final data = utf8.decode(response.bodyBytes);
    // return data;
    final String response = await rootBundle.rootBundle
        .loadString('assets/mock_data/vote_paper.json');
    final data = await json.decode(response);
    return data;
  }
}
