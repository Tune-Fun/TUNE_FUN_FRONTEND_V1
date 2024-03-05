import 'dart:convert';

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:tunefun_front/constants/constants.dart';

var logger = Logger();

final authAPIProvider = Provider((ref) {
  return AuthAPI();
});

abstract class IAuthAPI {
  FutureEither<http.Response> signup({
    required String email,
    required String username,
    required String password,
    required String nickname,
    required String accountType,
  });

  FutureEither<AccountModel> login({
    required String username,
    required String password,
  });

  Future<AccountModel?> currentUserAccount();

  FutureEither<void> verifyEmail({
    required String email,
    required String confirmationCode,
  });

  FutureEither<void> resendConfirmationCode({
    required String email,
  });
}

class AuthAPI extends IAuthAPI {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  FutureEither<http.Response> signup({
    required String email,
    required String username,
    required String password,
    required String nickname,
    required String accountType,
  }) async {
    try {
      final url = Uri.parse(UrlConstants.registerURL);
      final body = {
        "username": username,
        "password": password,
        "email": email,
        "nickname": nickname,
        "notification": {
          "vote_progress_notification": true,
          "vote_end_notification": true,
          "vote_delivery_notification": true
        }
      };
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );

      logger.d(json.decode(response.body));

      return right(response);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEither<AccountModel> login({
    required String username,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  FutureEither<void> verifyEmail(
      {required String email, required String confirmationCode}) async {
    try {
      final res = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );

      logger.d(res);
      return right(null);
    } on AuthException catch (e, stackTrace) {
      logger.e(e);
      return left(Failure(e.message, stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<void> resendConfirmationCode({
    required String email,
  }) async {
    try {
      final res = await Amplify.Auth.resendSignUpCode(username: email);

      logger.d(res);
      return right(null);
    } on AuthException catch (e, stackTrace) {
      logger.e(e);

      return left(Failure(e.message, stackTrace));
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  Future<AccountModel?> currentUserAccount() async {
    return null;
  }
}
