import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/constants.dart';
import 'package:uuid/uuid.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource(ref);
});
var uuid = const Uuid();

class AuthDataSource {
  final Ref ref;
  AuthDataSource(this.ref);

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Charset': 'UTF-8'
  };
  Future signUp(dynamic data) async {
    final url = Uri.parse(UrlConstants.registerURL);
    final body = {
      "username": data["username"],
      "password": data["password"],
      "email": data["email"],
      "nickname": data["nickname"],
      "notification": {
        "vote_progress_notification": true,
        "vote_end_notification": true,
        "vote_delivery_notification": true
      }
    };

    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headers,
    );
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future logIn(dynamic data) async {
    final url = Uri.parse(UrlConstants.loginURL);
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final deviceToken = uuid.v4();
    final body = {
      "username": data["username"],
      "password": data["password"],
      "email": data["email"],
      "nickname": data["nickname"],
      "device": {
        "fcm_token": fcmToken,
        "device_token": deviceToken,
      }
    };

    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headers,
    );
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future checkEmail(dynamic email) async {
    try {
      final url =
          Uri.parse("${UrlConstants.userCheckEmailDuplicateURL}?email=$email");

      var response = await http.get(url, headers: headers);
      var decodeResponse = utf8.decode(response.bodyBytes);
      var jsonResponse = json.decode(decodeResponse);
      return jsonResponse;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future checkId(dynamic id) async {
    try {
      final url = Uri.parse(
          "${UrlConstants.userCheckUsernameDuplicateURL}?username=$id");

      var response = await http.get(url, headers: headers);
      var decodeResponse = utf8.decode(response.bodyBytes);
      var jsonResponse = json.decode(decodeResponse);
      return jsonResponse;
    } catch (e) {
      throw Exception(e);
    }
  }
}
