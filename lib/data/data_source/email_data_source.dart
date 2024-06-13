import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';
import 'package:uuid/uuid.dart';

final emailDataSourceProvider = Provider<EmailDataSource>((ref) {
  return EmailDataSource(ref);
});
var uuid = const Uuid();

class EmailDataSource {
  final Ref ref;
  EmailDataSource(this.ref);
  Map<String, String> headerSet() {
    final userManager = ref.read(userManagerProvider);
    final accessToken = userManager?.accessToken;
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'Accept': 'application/json',
      'Charset': 'UTF-8',
      'Accept-Language': 'ko_KR',
    };
    return headers;
  }

  Future check() async {
    Map<String, String> headers = headerSet();
    final url = Uri.parse(UrlConstants.userCheckEmailVerifiedURL);
    var response = await http.get(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future regist(String email) async {
    Map<String, String> headers = headerSet();
    final url = Uri.parse(UrlConstants.userEmailURL);
    var response = await http.post(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future delete() async {
    Map<String, String> headers = headerSet();
    final url = Uri.parse(UrlConstants.userEmailURL);
    var response = await http.delete(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future send() async {
    Map<String, String> headers = headerSet();
    final url = Uri.parse(UrlConstants.accountVerifyURL);
    var response = await http.post(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future update() async {
    Map<String, String> headers = headerSet();
    final url = Uri.parse(UrlConstants.userEmailURL);
    var response = await http.patch(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }
}
