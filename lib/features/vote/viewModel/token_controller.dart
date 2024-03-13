import 'dart:convert';

import 'package:http/http.dart' as http;

class AccessTokenManager {
  static final AccessTokenManager _instance = AccessTokenManager._internal();
  String? _accessToken;
  DateTime? _expiryDate;

  factory AccessTokenManager() {
    return _instance;
  }

  AccessTokenManager._internal();

  Future<String> getAccessToken() async {
    // 현재 시간
    final now = DateTime.now();
    // 엑세스 토큰이 유효한지 확인
    if (_accessToken != null &&
        _expiryDate != null &&
        _expiryDate!.isAfter(now)) {
      return _accessToken!;
    } else {
      // 새로운 엑세스 토큰을 요청
      return await _fetchAccessToken();
    }
  }

  Future<String> _fetchAccessToken() async {
    final 

    final response = await http.post(
      Uri.parse(tokenUrl),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'grant_type': 'client_credentials'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _accessToken = data['access_token'];
      // 만료 시간 설정 (현재 시간 + 만료 시간(초))
      _expiryDate = DateTime.now().add(Duration(seconds: data['expires_in']));
      return _accessToken!;
    } else {
      throw Exception('Failed to obtain access token');
    }
  }
}
