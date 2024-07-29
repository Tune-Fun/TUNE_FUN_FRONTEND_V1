import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/core/usecase/email_usecase.dart';
import 'package:tunefun_front/data/repository/email_repository_Impl.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/domain/repository/email_repository.dart';

final emailUsecaseProvider = Provider<EmailUsecaseImpl>((ref) {
  final emailRepository = ref.watch(emailRepositoryProvider);
  return EmailUsecaseImpl(emailRepository);
});

class EmailUsecaseImpl implements EmailUseCase<dynamic, dynamic> {
  final EmailRepository _emailRepository;
  EmailUsecaseImpl(this._emailRepository);

  @override
  Future<DataState> checkDuplicate(email) {
    return _emailRepository.checkDuplicate(email);
  }

  @override
  Future<DataState> checkVerify() {
    return _emailRepository.checkVerify();
  }

  @override
  Future<DataState> delete() {
    return _emailRepository.delete();
  }

  @override
  Future<DataState> regist(params) {
    return _emailRepository.regist(params);
  }

  @override
  Future<DataState> send() {
    return _emailRepository.send();
  }

  @override
  Future<DataState> update(params) {
    return _emailRepository.update(params);
  }

  @override
  Future<DataState> verify(params) {
    return _emailRepository.verify(params);
  }
}
