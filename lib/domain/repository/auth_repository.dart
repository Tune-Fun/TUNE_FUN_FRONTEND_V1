import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';

abstract class AuthRepository {
  Future<DataState<AccountModel>> signUp(dynamic data);
  Future<DataState<AccountModel>> logIn(dynamic data);
  Future<String> checkEmail(String email);
  Future<String> checkId(String id);
}
