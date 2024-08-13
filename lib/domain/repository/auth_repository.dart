import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';

abstract class AuthRepository {
  Future<DataState<AccountModel>> signUp(dynamic data);
  Future<DataState<AccountModel>> logIn(dynamic data);
  Future<String> checkId(String id);
  Future<DataState> sendPasswordOTP();
  Future<DataState> resendPasswordOTP();
  Future<DataState> setNewPassword(String pw);
  Future<DataState> updateNickname(String newNickname);
}
