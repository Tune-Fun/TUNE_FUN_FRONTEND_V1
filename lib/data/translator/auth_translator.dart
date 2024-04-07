import 'package:tunefun_front/data/exceptions/translate_exception.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';

class AuthTranslator {
  static final AuthTranslator _singleton = AuthTranslator._internal();

  AuthTranslator._internal();

  factory AuthTranslator() => _singleton;

  Future<DataState<AccountModel>> translateSignUp(dynamic data) async {
    try {
      print(data['roles']);
      List<dynamic> res = data['roles'];
      List<String> roles = res.map((item) => item.toString()).toList();

      AccountModel userInfo = AccountModel(
        username: data["username"].toString(),
        roles: roles,
        accessToken: data["access_token"].toString(),
        refreshToken: data["refresh_token"].toString(),
      );
      return DataState.success(userInfo);
    } catch (e) {
      throw TranslateException(e.toString());
    }
  }
}
