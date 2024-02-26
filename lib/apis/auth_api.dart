import 'package:amplify_core/amplify_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/models/models.dart';

var logger = Logger();

final authAPIProvider = Provider((ref) {
  return AuthAPI();
});

abstract class IAuthAPI {
  FutureEither<void> signup({
    required String email,
    required String username,
    required String password,
    required String nickname,
    required String accountType,
  });

  FutureEither<UserModel> login({
    required String username,
    required String password,
  });
}

class AuthAPI extends IAuthAPI {
  @override
  FutureEither<void> signup({
    required String email,
    required String username,
    required String password,
    required String nickname,
    required String accountType,
  }) async {
    try {
      final userAttributes = {AuthUserAttributeKey.name: username};

      final account = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );

      logger.d(account);
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
  FutureEither<UserModel> login({
    required String username,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
