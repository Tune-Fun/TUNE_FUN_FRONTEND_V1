import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/models/models.dart';

abstract class IAuthAPI {
  FutureEither<UserModel> signup({
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
  FutureEither<UserModel> signup({
    required String email,
    required String username,
    required String password,
    required String nickname,
    required String accountType,
  }) {
    throw UnimplementedError();
  }

  @override
  FutureEither<UserModel> login({
    required String username,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
