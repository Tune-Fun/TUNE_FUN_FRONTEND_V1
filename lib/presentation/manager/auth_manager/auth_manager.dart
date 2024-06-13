import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/usecase/auth_usecase_impl.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';

part 'auth_manger_state.dart';

final authManagerProvider =
    StateNotifierProvider<AuthManager, AuthMangerState>((ref) {
  final authUsecase = ref.watch(authUsecaseProvider);
  final userManager = ref.watch(userManagerProvider.notifier);
  return AuthManager(authUsecase, userManager);
});

class AuthManager extends StateNotifier<AuthMangerState> {
  final AuthUsecaseImpl _authUsecaseImpl;
  final UserManager _userManager;
  AuthManager(this._authUsecaseImpl, this._userManager)
      : super(const AuthMangerStateInitial());

  Future<void> signUp(Map<String, dynamic> params) async {
    final response = await _authUsecaseImpl.signUp(params);
    response.when(success: (userInfo) {
      state = AuthMangerStateSuccess(userInfo);
      _userManager.setUser(userInfo);
    }, error: (error, message) {
      state = AuthMangerStateError(message);
    });
  }

  Future<void> logIn(dynamic params) async {
    state = const AuthManagerStateLoading();
    final response = await _authUsecaseImpl.logIn(params);
    response.when(success: (userInfo) async {
      state = AuthMangerStateSuccess(userInfo);
      _userManager.setUser(userInfo);
      const storage = FlutterSecureStorage();
      await storage.write(key: 'access_token', value: userInfo.accessToken);
      await storage.write(key: 'refresh_token', value: userInfo.refreshToken);
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
