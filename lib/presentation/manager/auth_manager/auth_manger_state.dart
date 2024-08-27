part of 'auth_manager.dart';

abstract class AuthManagerState {
  final AccountModel? userInfo;
  final String? error;
  const AuthManagerState({this.userInfo, this.error});
}

class AuthManagerStateInitial extends AuthManagerState {
  const AuthManagerStateInitial();
}

class AuthManagerStateLoading extends AuthManagerState {
  const AuthManagerStateLoading();
}

class LoginSuccess extends AuthManagerState {
  final AccountModel userInfo;

  LoginSuccess(this.userInfo);
}

class SignupSuccess extends AuthManagerState {
  SignupSuccess();
}

class LoginError extends AuthManagerState {
  final String message;

  LoginError(this.message);
}

class SignupError extends AuthManagerState {
  final String message;

  SignupError(this.message);
}

// 아이디 중복 검색
class IdIsExist extends AuthManagerState {
  const IdIsExist();
}

class IdIsNoExist extends AuthManagerState {
  const IdIsNoExist();
}

class CheckIdError extends AuthManagerState {
  const CheckIdError();
}

// 비밀번호 변경에 대한 상태
class SetNewPasswordSuccess extends AuthManagerState {
  SetNewPasswordSuccess();
}

class SetNewPasswordError extends AuthManagerState {
  final String message;
  SetNewPasswordError(this.message);
}

class VerifyPasswordOTPSuccess extends AuthManagerState {
  VerifyPasswordOTPSuccess();
}

class VerifyPasswordOTPError extends AuthManagerState {
  final String message;
  VerifyPasswordOTPError(this.message);
}

class SendPasswordOTPSuccess extends AuthManagerState {
  SendPasswordOTPSuccess();
}

class SendPasswordOTPError extends AuthManagerState {
  final String message;
  SendPasswordOTPError(this.message);
}

class UpdateNicknameLoading extends AuthManagerState {
  UpdateNicknameLoading();
}

class UpdateNicknameSuccess extends AuthManagerState {
  UpdateNicknameSuccess();
}

class UpdateNicknameError extends AuthManagerState {
  final String message;
  UpdateNicknameError(this.message);
}
