part of 'auth_manager.dart';

abstract class AuthMangerState {
  final AccountModel? userInfo;
  final String? error;
  const AuthMangerState({this.userInfo, this.error});
}

class AuthMangerStateInitial extends AuthMangerState {
  const AuthMangerStateInitial();
}

class AuthManagerStateLoading extends AuthMangerState {
  const AuthManagerStateLoading();
}

class AuthMangerStateSuccess extends AuthMangerState {
  final AccountModel userInfo;

  AuthMangerStateSuccess(this.userInfo);
}

class AuthMangerStateError extends AuthMangerState {
  final String message;

  AuthMangerStateError(this.message);
}
