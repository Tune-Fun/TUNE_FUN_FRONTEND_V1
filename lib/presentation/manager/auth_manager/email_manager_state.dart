part of 'email_manager.dart';

abstract class EmailManagerState {
  final String? code;
  final String? message;
  const EmailManagerState({this.code, this.message});
}

class EmailManagerStateInitial extends EmailManagerState {
  const EmailManagerStateInitial();
}

class EmailManagerLoading extends EmailManagerState {
  const EmailManagerLoading();
}

class EmailManagerStateSuccess extends EmailManagerState {
  final String code;
  EmailManagerStateSuccess(this.code);
}

class EmailManagerStateError extends EmailManagerState {
  final String error;

  EmailManagerStateError(this.error);
}

class EmailIsExist extends EmailManagerState {
  EmailIsExist();
}

class EmailIsNoneExist extends EmailManagerState {
  EmailIsNoneExist();
}

class EmailDuplicateError extends EmailManagerState {
  final String error;
  EmailDuplicateError(this.error);
}
