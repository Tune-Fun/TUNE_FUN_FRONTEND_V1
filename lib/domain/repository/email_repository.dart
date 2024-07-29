import 'package:tunefun_front/domain/model/data_state_model.dart';

abstract class EmailRepository {
  Future<DataState> checkDuplicate(String email);
  Future<DataState> checkVerify();
  Future<DataState> regist(String email);
  Future<DataState> send();
  Future<DataState> update(String email);
  Future<DataState> delete();
  Future<DataState> verify(String otp);
}
