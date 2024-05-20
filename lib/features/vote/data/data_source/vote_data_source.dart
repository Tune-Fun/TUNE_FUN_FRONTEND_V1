import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final uploadURL = UrlConstants.voteUploadURL;
    final response =
        await http.post(Uri.parse(uploadURL), body: uploadModel.toJson());
    final data = jsonDecode(response.body);
    return data;
  }
}
