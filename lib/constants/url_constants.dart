import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlConstants {
  static String baseUrl = dotenv.get('PUBLIC_BASE_URL');
  static String loginUrl = dotenv.get('PUBLIC_USER_LOGIN_URL');
  static String signupURL = dotenv.get('PUBLIC_USER_SIGNUP_URL');
  static String firebaseUrl = dotenv.get('PUBLIC_FIREBASE_ID');
}
