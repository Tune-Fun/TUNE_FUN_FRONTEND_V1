import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tunefun_front/constants/url_constants.dart';
import 'package:http/http.dart' as http;

class TokenRefreshApi {
  final _secureStorage = const FlutterSecureStorage();
  Future refresh() async {
    try {
      final url = Uri.parse(UrlConstants.userAccessTokenURL);
      final refreshToken = _secureStorage.read(key: "refresh_token");
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Charset': 'UTF-8',
        'Accept-Language': 'ko_KR',
      };
      final body = {
        "refresh_token": "$refreshToken",
      };

      var response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var decodeResponse = utf8.decode(response.bodyBytes);
        var jsonResponse = json.decode(decodeResponse);

        await _secureStorage.write(
            key: "access_token", value: jsonResponse["data"]["access_token"]);
      } else {
        throw Exception("토큰 재발급 실패");
      }
    } catch (e) {
      throw Exception("토큰 재발급 실패");
    }
  }
}
