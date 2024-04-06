import 'package:tunefun_front/data/exceptions/translate_exception.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';

class AuthTranslator {
  static final AuthTranslator _singleton = AuthTranslator._internal();

  AuthTranslator._internal();

  factory AuthTranslator() => _singleton;

  Future<DataState<AccountModel>> translateSignUp(dynamic data) async {
    try {
      AccountModel userInfo = AccountModel(
        nickname: data["nickname"],
        roles: data[0],
        accessToken: data["accessToken"],
        refreshToken: data["refreshToken"],
      );
      return DataState.success(userInfo);
    } catch (e) {
      throw TranslateException(e.toString());
    }
  }
}
