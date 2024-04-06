import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/core/usecase/auth_usecase.dart';
import 'package:tunefun_front/data/repository/auth_repository_Impl.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/domain/repository/auth_repository.dart';

final authUsecaseProvider = Provider<AuthUsecaseImpl>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthUsecaseImpl(authRepository);
});

class AuthUsecaseImpl implements AuthUseCase<dynamic, dynamic> {
  final AuthRepository _authRepository;
  AuthUsecaseImpl(this._authRepository);

  @override
  Future<DataState<AccountModel>> signUp(dynamic params) {
    return _authRepository.signUp(params);
  }

  @override
  Future<DataState<AccountModel>> logIn(dynamic params) {
    return _authRepository.logIn(params);
  }

  @override
  Future<String> checkEmail(dynamic params) {
    return _authRepository.checkEmail(params);
  }

  @override
  Future<String> checkId(dynamic params) {
    return _authRepository.checkId(params);
  }
}
