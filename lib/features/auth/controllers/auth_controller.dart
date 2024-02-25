import 'package:amplify_core/amplify_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/models/models.dart';

var logger = Logger();

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController();
});

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);

  Future<void> signup({required UserModel userModel}) async {
    try {
      final userAttributes = {AuthUserAttributeKey.name: userModel.username};

      await Amplify.Auth.signUp(
        username: userModel.email,
        password: userModel.password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
    } on AuthException catch (e) {
      logger.e(e);
      return;
    }
  }
}
