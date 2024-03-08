import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/apis/apis.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/features/auth/views/login_view.dart';
import 'package:tunefun_front/features/home/views/home_view.dart';
import 'package:tunefun_front/models/models.dart';

var logger = Logger();

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
  );
});

final currentUserAccountProvider =
    StateProvider<AccountModel?>((ref) => const AccountModel());

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  AuthController({
    required AuthAPI authAPI,
  })  : _authAPI = authAPI,
        super(false);

  Future<void> signup({
    required String email,
    required String username,
    required String password,
    required String nickname,
    required BuildContext context,
  }) async {
    state = true;

    final response = await _authAPI.signup(
      email: email,
      username: username,
      password: password,
      nickname: nickname,
    );

    state = false;

    response.fold(
      (left) {
        logger.i('Error happened');
        final errorJson = json.decode(left.message);
        final errorMessage = errorJson['message'];
        showSnackBar(context, errorMessage.toString());
        logger.e(errorMessage);
      },
      (right) async {
        final response = utf8.decode(right.bodyBytes);
        final responseJson = json.decode(response);

        if (right.statusCode == 200) {
          List<String> roles = [];
          var rolesList = responseJson['data']['roles'];
          rolesList.forEach((role) {
            roles.add(role);
          });
          final String accessToken = responseJson['data']['access_token'];
          final String refreshToken = responseJson['data']['refresh_token'];

          AccountModel account = AccountModel(
            username: username,
            password: password,
            email: email,
            nickname: nickname,
            roles: roles,
            accessToken: accessToken,
            refreshToken: refreshToken,
          );

          showSnackBar(context, '회원가입 성공');
          Navigator.push(context, LoginScreen.route());
        }

        if (right.statusCode == 400) {
          final message = responseJson['message'];
          showSnackBar(context, message);
        }

        if (right.statusCode == 500) {
          final message = responseJson['message'];
          showSnackBar(context, message);
        }
      },
    );
  }

  Future<void> login({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    state = false;

    final response =
        await _authAPI.login(username: username, password: password);

    state = true;

    response.fold(
      (left) {
        logger.i('Error happened');
        final errorJson = json.decode(left.message);
        final errorMessage = errorJson['message'];
        showSnackBar(context, errorMessage.toString());
        logger.e(errorMessage);
      },
      (right) {
        final response = utf8.decode(right.bodyBytes);
        final responseJson = json.decode(response);

        if (right.statusCode == 200) {
          List<String> roles = [];
          var rolesList = responseJson['data']['roles'];
          rolesList.forEach((role) {
            roles.add(role);
          });

          final String accessToken = responseJson['data']['access_token'];
          final String refreshToken = responseJson['data']['refresh_token'];

          AccountModel account = AccountModel(
            username: username,
            roles: roles,
            accessToken: accessToken,
            refreshToken: refreshToken,
          );

          showSnackBar(context, '로그인 성공');
          Navigator.push(context, HomeScreen.route());
        }

        if (right.statusCode == 400) {
          final message = responseJson['message'];
          showSnackBar(context, message);
        }

        if (right.statusCode == 500) {
          final message = responseJson['message'];
          showSnackBar(context, message);
        }
      },
    );
  }

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
