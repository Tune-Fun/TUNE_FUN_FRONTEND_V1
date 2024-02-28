import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/apis/apis.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/models/models.dart';

var logger = Logger();

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUserAccount();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  Future<void> signup({
    required String email,
    required String username,
    required String password,
    required String nickname,
    required String accountType,
    required BuildContext context,
  }) async {
    state = true;

    final res = await _authAPI.signup(
      email: email,
      username: username,
      password: password,
      nickname: nickname,
      accountType: accountType,
    );

    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        // AccountModel accountModel = AccountModel(
        //     id: ,
        //     uuid: uuid,
        //     username: username,
        //     password: password,
        //     email: email,
        //     nickname: nickname,
        //     roles: roles,
        //     lastLoginAt: lastLoginAt,
        //     lastLogOutAt: lastLogOutAt,
        //     emailVerifiedAt: emailVerifiedAt,
        //     withDrawlAt: withDrawlAt,
        //     deletedAt: deletedAt,
        //     isAccountNonExpired: isAccountNonExpired,
        //     isAccountNonLocked: isAccountNonLocked,
        //     isCredentialsNonExpired: isCredentialsNonExpired,
        //     isEnabled: isEnabled,
        //     voteProgressNotification: voteProgressNotification,
        //     voteEndNotification: voteEndNotification,
        //     voteDeliveryNotification: voteDeliveryNotification,
        //     createdAt: createdAt,
        //     updatedAt: updatedAt,
        // );

        // repository에 전달해주고
        // 사용자 데이터를 DB에 저장해주는 코드를 추가해준다.
      },
    );
  }

  Future<AccountModel?> currentUserAccount() => _authAPI.currentUserAccount();

  Future<void> verifyEmail(
      {required String email,
      required String confirmationCode,
      required BuildContext context}) async {
    state = true;

    final res = await _authAPI.verifyEmail(
        email: email, confirmationCode: confirmationCode);

    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {},
    );
  }

  Future<void> resendConfirmationCode(
      {required String email, required BuildContext context}) async {
    state = true;

    final res = await _authAPI.resendConfirmationCode(email: email);

    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {},
    );
  }
}
