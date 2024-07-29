import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';
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
    'Charset': 'UTF-8',
    'Accept-Language': 'ko_KR',
  };
  Future signUp(dynamic data) async {
    final url = Uri.parse("${UrlConstants.registerURL}?type=${data["type"]}");
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

  Future setNewPassword(String password) async {
    final url = Uri.parse(UrlConstants.userSetNewPasswordURL);
    final accessToken = ref.read(userManagerProvider)!.accessToken;
    final Map<String, String> headers = {
      "Authorization": "Bearer ${accessToken!}",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Charset': 'UTF-8',
      'Accept-Language': 'ko_KR',
    };
    final body = {
      "new_password": password,
    };
    var response =
        await http.patch(url, headers: headers, body: jsonEncode(body));
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future sendPasswordOTP() async {
    final url = Uri.parse(UrlConstants.userForgotPasswordSendOtpURL);
    final userName = ref.read(userManagerProvider)!.username;
    final body = {
      "username": userName,
    };
    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future resendPasswordOTP() async {
    final url = Uri.parse(UrlConstants.userOtpResendURL);
    var response = await http.post(url, headers: headers);
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }
}
