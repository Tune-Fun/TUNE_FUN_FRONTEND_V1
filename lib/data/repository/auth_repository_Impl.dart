import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/data/data_source/auth_data_source.dart';
import 'package:tunefun_front/data/translator/auth_translator.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/domain/repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl(ref);
});

class AuthRepositoryImpl implements AuthRepository {
  final Ref ref;
  AuthRepositoryImpl(this.ref);
  @override
  Future<DataState<AccountModel>> signUp(dynamic data) async {
    try {
      final response = await ref.read(authDataSourceProvider).signUp(data);
      if (response["code"] != "0000") {
        return DataState.error(Exception(), "계정을 생성하는 동안 오류가 발생했습니다.");
      }
      return AuthTranslator().translateSignUp(response['data']);
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState<AccountModel>> logIn(dynamic data) async {
    try {
      final response = await ref.read(authDataSourceProvider).logIn(data);
      if (response["code"] != "0000") {
        return DataState.error(Exception(), "계정을 찾을 수 없습니다");
      }
      return AuthTranslator().translateSignUp(response['data']);
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<String> checkId(String id) async {
    try {
      final response = await ref.read(authDataSourceProvider).checkId(id);
      String valid = response["code"];
      return valid;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<DataState<String>> sendPasswordOTP() async {
    try {
      final response = await ref.read(authDataSourceProvider).sendPasswordOTP();
      if (response["code"] == "3106") {
        return DataState.success(response["code"]);
      } else {
        return DataState.error(Exception(), "change err");
      }
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState> resendPasswordOTP() async {
    try {
      final response = await ref.read(authDataSourceProvider).sendPasswordOTP();
      if (response["code"] == "3107") {
        return DataState.success(response["code"]);
      } else {
        return DataState.error(Exception(), "change err");
      }
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState<String>> setNewPassword(String pw) async {
    try {
      final response =
          await ref.read(authDataSourceProvider).setNewPassword(pw);
      if (response["code"] == "2010") {
        return DataState.success(response["code"]);
      } else {
        return DataState.error(Exception(), "change err");
      }
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState> updateNickname(String newNickname) async {
    try {
      final response =
          await ref.read(authDataSourceProvider).updateNickname(newNickname);
      if (response["code"] != "2011") {
        return DataState.error(Exception(), "프로필 변경하는 동안 오류가 발생했습니다.");
      }
      return AuthTranslator().translateSignUp(response['message']);
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }
}
