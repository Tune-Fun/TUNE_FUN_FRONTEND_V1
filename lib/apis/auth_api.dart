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
    try {
      final account = await Amplify.Auth.getCurrentUser();
      logger.i(account);
    } on AuthException catch (e) {
      safePrint('Could not retrieve current user: ${e.message}');
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
    return null;
  }
}
