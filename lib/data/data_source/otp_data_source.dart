import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';

final otpDataSourceProvider = Provider<OtpDataSource>((ref) {
  return OtpDataSource(ref);
});

class OtpDataSource {
  final Ref ref;
  OtpDataSource(this.ref);

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Charset': 'UTF-8',
    'Accept-Language': 'ko_KR',
  };

  Future verifyOTP(String type, String otp) async {
    final url = Uri.parse(UrlConstants.userOtpVerifyURL);
    final body = {
      "username": ref.read(userManagerProvider).username,
      "otp_type": type,
      "otp": otp,
    };

    var response =
        await http.put(url, headers: headers, body: jsonEncode(body));
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }

  Future resendOTP(String type) async {
    final url = Uri.parse(UrlConstants.userOtpResendURL);
    final body = {
      "username": ref.read(userManagerProvider).username,
      "otp_type": type,
    };

    var response =
        await http.put(url, headers: headers, body: jsonEncode(body));
    var decodeResponse = utf8.decode(response.bodyBytes);
    var jsonResponse = json.decode(decodeResponse);
    return jsonResponse;
  }
}
