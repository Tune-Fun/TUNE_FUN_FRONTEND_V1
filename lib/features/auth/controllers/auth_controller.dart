import 'package:amplify_core/amplify_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger();

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController();
});

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);

  Future<void> signup({
    required String email,
    required String username,
    required String password,
    required String accountType,
    required String nickname,
  }) async {
    try {
      logger.i(email);
      logger.i(username);
      logger.i(password);
      logger.i(accountType);
      logger.i(nickname);
    } on AuthException catch (e) {
      logger.e(e);
      return;
    }
  }
}
