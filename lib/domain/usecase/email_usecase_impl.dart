import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/core/usecase/email_usecase.dart';
import 'package:tunefun_front/data/repository/email_repository_Impl.dart';
import 'package:tunefun_front/domain/repository/email_repository.dart';

final authUsecaseProvider = Provider<EmailUsecaseImpl>((ref) {
  final emailRepository = ref.watch(emailRepositoryProvider);
  return EmailUsecaseImpl(emailRepository);
});

class EmailUsecaseImpl implements EmailUseCase<dynamic, dynamic> {
  final EmailRepository _emailRepository;
  EmailUsecaseImpl(this._emailRepository);

  @override
  Future check() {
    return _emailRepository.check();
  }

  @override
  Future delete() {
    return _emailRepository.delete();
  }

  @override
  Future regist(params) {
    return _emailRepository.regist(params);
  }

  @override
  Future send() {
    return _emailRepository.send();
  }

  @override
  Future update(params) {
    return _emailRepository.update(params);
  }
}
