import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/model/account_model.dart';

class UserManager extends StateNotifier<AccountModel?> {
  UserManager() : super(null);

  void setUser(AccountModel user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }
}

final userManagerProvider =
    StateNotifierProvider<UserManager, AccountModel?>((ref) {
  return UserManager();
});
