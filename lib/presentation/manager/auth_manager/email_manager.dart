import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/usecase/email_usecase_impl.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';

part 'email_manager_state.dart';

final emailManagerProvider =
    StateNotifierProvider<EmailManager, EmailManagerState>((ref) {
  final emailUsecase = ref.watch(emailUsecaseProvider);
  final userManager = ref.read(userManagerProvider.notifier);
  return EmailManager(emailUsecase, userManager);
});

class EmailManager extends StateNotifier<EmailManagerState> {
  final EmailUsecaseImpl _emailUsecaseImpl;
  final UserManager _userManager;
  EmailManager(this._emailUsecaseImpl, this._userManager)
      : super(const EmailManagerStateInitial());

  Future checkEmailDuplicate(dynamic email) async {
    try {
      final response = await _emailUsecaseImpl.checkDuplicate(email);
      response.when(success: (data) {
        if (data == "2008") {
          state = EmailIsNoneExist();
        } else if (data == "2006") {
          state = EmailIsExist();
        }
      }, error: (error, message) {
        state = EmailIsExist();
      });
    } catch (e) {
      state = EmailDuplicateError(e.toString());
    }
  }

  Future<void> checkVerify() async {
    final response = await _emailUsecaseImpl.checkVerify();
    response.when(success: (data) {
      state = EmailManagerStateSuccess(data);
      _userManager.updateEmailVerified(true);
    }, error: (error, message) {
      state = EmailManagerStateError(message);
    });
  }

  Future regist(String email) async {
    final response = await _emailUsecaseImpl.regist(email);
    response.when(success: (data) {
      state = EmailManagerStateSuccess(data);
      print("-");
    }, error: (error, message) {
      state = EmailManagerStateError(message);
    });
  }

  Future send() async {
    final response = await _emailUsecaseImpl.send();
    response.when(success: (data) {
      state = EmailManagerStateSuccess(data);
    }, error: (error, message) {
      state = EmailManagerStateError(message);
    });
  }

  Future update(String email) async {
    final response = await _emailUsecaseImpl.update(email);
    response.when(success: (data) {
      state = EmailManagerStateSuccess(data);
    }, error: (error, message) {
      state = EmailManagerStateError(message);
    });
  }

  Future delete() async {
    final response = await _emailUsecaseImpl.delete();
    response.when(success: (data) {
      state = EmailManagerStateSuccess(data);
    }, error: (error, message) {
      state = EmailManagerStateError(message);
    });
  }

  Future verify(String otp) async {
    final response = await _emailUsecaseImpl.verify(otp);
    response.when(success: (data) {
      state = EmailManagerStateSuccess(data);
      _userManager.updateEmailVerified(true);
    }, error: (error, message) {
      state = EmailManagerStateError(message);
    });
  }

  initialEmailState() {
    state = const EmailManagerStateInitial();
  }
}
