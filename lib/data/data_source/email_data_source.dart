import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  Future<Map<String, String>> headerSet() async {
    const storage = FlutterSecureStorage();
    final key = await storage.read(key: 'access_token');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $key',
      'Charset': 'UTF-8',
      'Accept-Language': 'ko_KR',
    };
    return headers;
  }

  Future checkDuplicate(dynamic email) async {
    Map<String, String> headers = await headerSet();
    final url =
        Uri.parse("${UrlConstants.userCheckEmailDuplicateURL}?email=$email");

    var response = await http.get(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future checkVerify() async {
    Map<String, String> headers = await headerSet();
    final url = Uri.parse(UrlConstants.userCheckEmailVerifiedURL);
    var response = await http.get(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future regist(String email) async {
    Map<String, String> headers = await headerSet();
    // final url = Uri.parse(UrlConstants.userEmailURL);
    final url = Uri.parse('https://api.tunefun.net/v1/accounts/email/verify');
    var response = await http.post(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future delete() async {
    Map<String, String> headers = await headerSet();
    final url = Uri.parse(UrlConstants.userEmailURL);
    var response = await http.delete(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future send() async {
    Map<String, String> headers = await headerSet();
    final url = Uri.parse(UrlConstants.accountVerifyURL);
    var response = await http.post(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future update() async {
    Map<String, String> headers = await headerSet();
    final url = Uri.parse(UrlConstants.userEmailURL);
    var response = await http.patch(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future verify(String otp) async {
    final userProvider = ref.read(userManagerProvider);
    String? userName = userProvider!.username;
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Charset': 'UTF-8',
      'Accept-Language': 'ko_KR',
    };
    final body = {
      "username": userName,
      "otp_type": "verify-email",
      "otp": otp,
    };
    final url = Uri.parse(UrlConstants.userOtpVerifyURL);
    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }
}
