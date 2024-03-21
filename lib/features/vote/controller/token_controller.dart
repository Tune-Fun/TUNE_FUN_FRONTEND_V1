import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/constants.dart';

class AccessTokenManager {
  static final AccessTokenManager _instance = AccessTokenManager._internal();
  String? _accessToken;
  DateTime? _expiryDate;

  factory AccessTokenManager() {
    return _instance;
  }

  AccessTokenManager._internal();

  Future<String> getAccessToken() async {
    final now = DateTime.now();
    if (_accessToken != null &&
        _expiryDate != null &&
        _expiryDate!.isAfter(now)) {
      return _accessToken!;
    } else {
      return await _fetchAccessToken();
    }
  }

  Future<String> _fetchAccessToken() async {
    final clientId = dotenv.env["SPOTIFY_CLIENT_ID"];
    final clientSecret = dotenv.env["SPOTIFY_CLIENT_SECRET"];
    String tokenUrl = UrlConstants.spotifyAccessTokenURL;
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
      _expiryDate = DateTime.now().add(Duration(seconds: data['expires_in']));
      return _accessToken!;
    } else {
      throw Exception('Failed to obtain access token');
    }
  }
}
