import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/usecase/auth_usecase_impl.dart';

part 'auth_manger_state.dart';

final authManagerProvider =
    StateNotifierProvider<AuthManager, AuthMangerState>((ref) {
  final authUsecase = ref.watch(authUsecaseProvider);
  return AuthManager(authUsecase);
});

class AuthManager extends StateNotifier<AuthMangerState> {
  final AuthUsecaseImpl _authUsecaseImpl;
  AuthManager(this._authUsecaseImpl) : super(const AuthMangerStateInitial());

  Future<void> signUp(dynamic params) async {
    final response = await _authUsecaseImpl.signUp(params);
    response.when(success: (userInfo) {
      state = AuthMangerStateSuccess(userInfo);
    }, error: (error, message) {
      state = AuthMangerStateError(message);
    });
  }

  Future<void> logIn(dynamic params) async {
    final response = await _authUsecaseImpl.logIn(params);
    print(response);
    response.when(success: (userInfo) {
      state = AuthMangerStateSuccess(userInfo);
    }, error: (error, message) {
      state = AuthMangerStateError(message);
    });
  }

  Future checkEmail(dynamic email) async {
    try {
      final response = await _authUsecaseImpl.checkEmail(email);
      return response;
    } catch (e) {
      return "이메일 검증 중 오류가 발생했습니다.";
    }
  }

  Future checkId(dynamic id) async {
    try {
      final response = await _authUsecaseImpl.checkId(id);
      return response;
    } catch (e) {
      return "아이디 검증 중 오류가 발생했습니다.";
    }
  }
}
