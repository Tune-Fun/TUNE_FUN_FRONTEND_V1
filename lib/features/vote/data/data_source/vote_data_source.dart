import 'dart:convert';

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

  uploadvote(UploadModel uploadModel) async {
    const storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: 'access_token');
    final uploadURL = UrlConstants.voteUploadURL;
    final response = await http.post(Uri.parse(uploadURL),
        headers: {
          'authorization': "Bearer $accessToken",
          'Content-Type': "application/json",
          'charset': "UTF-8"
        },
        body: uploadModel.toJson());
    final data = utf8.decode(response.bodyBytes);
    return data;
  }
}
