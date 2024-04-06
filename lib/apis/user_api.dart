import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/models/Laccount_model.dart';
import 'package:tunefun_front/utils/utils.dart';

final userAPIProvider = Provider((ref) {});

abstract class IUserAPI {
  FutureEitherVoid saveUserDate(AccountModel accountModel);
  Future<AccountModel> getUserData(String uuid);
}

class UserAPI extends IUserAPI {
  final _endPoint;

  UserAPI({required String endPoint}) : _endPoint = endPoint;

  @override
  Future<AccountModel> getUserData(String uuid) {
    throw UnimplementedError();
  }

  @override
  FutureEitherVoid saveUserDate(AccountModel accountModel) {
    throw UnimplementedError();
  }
}
