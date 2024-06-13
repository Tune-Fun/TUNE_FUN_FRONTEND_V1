import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlConstants {
  static String baseURL = dotenv.get('PUBLIC_BASE_URL');
  static String registerURL = dotenv.get('PUBLIC_USER_REGISTER_URL');
  static String loginURL = dotenv.get('PUBLIC_USER_LOGIN_URL');
  static String logoutURL = dotenv.get('PUBLIC_USER_LOGOUT_URL');
  static String findUsernameURL = dotenv.get('PUBLIC_USER_FIND_USERNAME');
  static String userAccessTokenURL = dotenv.get('PUBLIC_USER_ACCESS_TOKEN');
  static String userSetNewPasswordURL =
      dotenv.get('PUBLIC_USER_SET_NEW_PASSWORD');
  static String userUpdateNicknameURL =
      dotenv.get('PUBLIC_USER_UPDATE_NICKNAME');
  static String userForgotPasswordSendOtpURL =
      dotenv.get('PUBLIC_USER_FORGOT_PASSWORD_SEND_OTP');
  static String userOtpResendURL = dotenv.get('PUBLIC_USER_OTP_RESEND');
  static String userOtpVerifyURL = dotenv.get('PUBLIC_USER_OTP_VERIFY');
  static String userCheckEmailDuplicateURL =
      dotenv.get('PUBLIC_USER_CHECK_EMAIL_DUPLICATE');
  static String userCheckEmailVerifiedURL =
      dotenv.get('PUBLIC_USER_CHECK_EMAIL_VERIFIED');
  static String userCheckUsernameDuplicateURL =
      dotenv.get('PUBLIC_USER_CHECK_USERNAME_DUPLICATE');
  static String userEmailURL = dotenv.get('PUBLIC_USER_EMAIL_URL');
  static String accountVerifyURL = dotenv.get('PUBLIC_USER_ACCOUNT_VERIFY_URL');
  static String spotifyAccessTokenURL = dotenv.get('SPOTIFY_ACCESS_TOKEN_URL');
  static String spotifyURL = dotenv.get('SPOTIFY_URL');
  static String voteUploadURL = dotenv.get('PUBLIC_VOTE_UPLOAD_URL');
}
