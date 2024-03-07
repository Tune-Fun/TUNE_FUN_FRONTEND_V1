import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/apis/apis.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/models/models.dart';

var logger = Logger();

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUserAccount();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  Future<void> signup({
    required String email,
    required String username,
    required String password,
    required String nickname,
    required BuildContext context,
  }) async {
    // state = true;

    final response = await _authAPI.signup(
      email: email,
      username: username,
      password: password,
      nickname: nickname,
    );

    // state = false;

    response.fold(
      (left) {
        logger.i('Error happened');
        final errorJson = json.decode(left.message);
        final errorMessage = errorJson['message'];
        final errorCode = errorJson['code'];
        showSnackBar(context, errorMessage.toString());
        logger.e(errorMessage);
      },
      (right) async {
        final response = utf8.decode(right.bodyBytes);
        final responseJson = json.decode(response);

        // success 200
        // 처음 가입하는 회원
        if (right.statusCode == 200) {
          final List<String> roles = responseJson['data']['roles'];
          final String accessToken = responseJson['data']['access_token'];
          final String refreshToken = responseJson['data']['refresh_token'];

          AccountModel accountModel = AccountModel(
            username: username,
            password: password,
            email: email,
            nickname: nickname,
            roles: roles,
            accessToken: accessToken,
            refreshToken: refreshToken,
          );

          logger.i(accountModel);
        }

        // failure 400
        // 이미 가입한 회원
        if (right.statusCode == 400) {
          final message = responseJson['message'];
          showSnackBar(context, message);
        }

        // repository에 전달해주고
        // 사용자 데이터를 DB에 저장해주는 코드를 추가해준다.
      },
    );
  }

  Future<void> login({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    final response =
        await _authAPI.login(username: username, password: password);

    response.fold(
      (left) {
        logger.i('Error happened');
        final errorJson = json.decode(left.message);
        final errorMessage = errorJson['message'];
        final errorCode = errorJson['code'];
        showSnackBar(context, errorMessage.toString());
        logger.e(errorMessage);
      },
      (right) {
        final response = utf8.decode(right.bodyBytes);
        final responseJson = json.decode(response);

        logger.d(responseJson);
      },
    );
  }

  Future<AccountModel?> currentUserAccount() => _authAPI.currentUserAccount();

  Future<void> verifyEmail(
      {required String email,
      required String confirmationCode,
      required BuildContext context}) async {
    state = true;

    final res = await _authAPI.verifyEmail(
        email: email, confirmationCode: confirmationCode);

    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {},
    );
  }

  Future<void> resendConfirmationCode(
      {required String email, required BuildContext context}) async {
    state = true;

    final res = await _authAPI.resendConfirmationCode(email: email);

    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {},
    );
  }
}
