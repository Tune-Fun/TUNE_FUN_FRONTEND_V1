import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tunefun_front/core/usecase/otp_usecase.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/usecase/auth_usecase_impl.dart';
import 'package:tunefun_front/domain/usecase/otp_usecase_impl.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';

part 'auth_manger_state.dart';

final authManagerProvider =
    StateNotifierProvider<AuthManager, AuthManagerState>((ref) {
  final authUsecase = ref.read(authUsecaseProvider);
  final userManager = ref.read(userManagerProvider.notifier);
  final accountModel = ref.watch(userManagerProvider);
  final otpUseCase = ref.read(otpUsecaseProvider);
  return AuthManager(authUsecase, userManager, otpUseCase, accountModel);
});

class AuthManager extends StateNotifier<AuthManagerState> {
  final AuthUsecaseImpl _authUsecaseImpl;
  final UserManager _userManager;
  final OtpUseCase _otpUseCase;
  final AccountModel accountModel;
  AuthManager(this._authUsecaseImpl, this._userManager, this._otpUseCase,
      this.accountModel)
      : super(const AuthManagerStateInitial());

  Future<void> signUp(Map<String, dynamic> params) async {
    final response = await _authUsecaseImpl.signUp(params);
    response.when(success: (data) {
      state = SignupSuccess();
    }, error: (error, message) {
      state = SignupError(message);
    });
  }

  Future<void> logIn(dynamic params) async {
    state = const AuthManagerStateLoading();
    final response = await _authUsecaseImpl.logIn(params);
    response.when(success: (userInfo) async {
      state = LoginSuccess(userInfo);
      _userManager.setUser(userInfo);
      const storage = FlutterSecureStorage();
      storage.write(key: 'access_token', value: userInfo.accessToken);
      storage.write(key: 'refresh_token', value: userInfo.refreshToken);
    }, error: (error, message) {
      state = LoginError(message);
    });
  }

  Future checkId(dynamic id) async {
    state = const AuthManagerStateLoading();
    final response = await _authUsecaseImpl.checkId(id);
    response.when(success: (data) {
      if (data == "2007") {
        state = const IdIsNoExist();
      } else if (data == "2005") {
        state = const IdIsExist();
      } else {
        state = const CheckIdError();
      }
    }, error: (error, message) {
      state = const CheckIdError();
    });
  }

  Future sendPasswordOTP() async {
    final response = await _authUsecaseImpl.sendPasswordOTP();
    response.when(success: (data) {
      state = SendPasswordOTPSuccess();
    }, error: (error, message) {
      state = SendPasswordOTPError(message);
    });
  }

  Future resendPasswordOTP() async {
    final response = await _otpUseCase.resendOTP("forgot-password");
    response.when(success: (data) {
      state = SendPasswordOTPSuccess();
    }, error: (error, message) {
      state = SendPasswordOTPError(message);
    });
  }

  Future verifyPasswordOTP(String otp) async {
    final response = await _otpUseCase.verifyOTP("forgot-password", otp);
    response.when(success: (data) {
      state = VerifyPasswordOTPSuccess();
    }, error: (error, message) {
      state = VerifyPasswordOTPError(message);
    });
  }

  Future setNewPassword(String password) async {
    final response = await _authUsecaseImpl.setNewPassword(password);
    response.when(success: (data) {
      state = SetNewPasswordSuccess();
    }, error: (error, message) {
      state = SetNewPasswordError(message);
    });
  }

  Future updateNickname(String newNickname) async {
    state = UpdateNicknameLoading();
    final response = await _authUsecaseImpl.updateNickname(newNickname);
    response.when(success: (message) async {
      state = UpdateNicknameSuccess();
      final updateModel = accountModel.copyWith(nickname: newNickname);
      _userManager.setUser(updateModel);
    }, error: (error, message) {
      state = UpdateNicknameError(message);
    });
  }

  initAuthState() {
    _userManager.clearUser();
    state = const AuthManagerStateInitial();
  }
}
