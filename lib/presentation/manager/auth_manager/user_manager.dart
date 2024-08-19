import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/model/account_model.dart';

class UserManager extends StateNotifier<AccountModel> {
  UserManager()
      : super(AccountModel(
            username: '',
            password: '',
            email: '',
            nickname: '',
            emailverify: null,
            voteProgressNotification: null,
            voteEndNotification: null,
            voteDeliveryNotification: null,
            roles: [],
            accessToken: '',
            refreshToken: '',
            profileImageUrl: ''));

  void setUser(AccountModel user) {
    state = user;
  }

  void updateEmailVerified(bool isVerified) {
    state = state.copyWith(emailverify: isVerified);
  }

  void clearUser() {
    state = AccountModel(
        username: '',
        password: '',
        email: '',
        nickname: '',
        emailverify: null,
        voteProgressNotification: null,
        voteEndNotification: null,
        voteDeliveryNotification: null,
        roles: [],
        accessToken: '',
        refreshToken: '',
        profileImageUrl: '');
  }
}

final userManagerProvider =
    StateNotifierProvider<UserManager, AccountModel>((ref) {
  return UserManager();
});
