import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/data/data_source/auth_data_source.dart';
import 'package:tunefun_front/data/translator/auth_translator.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/domain/repository/email_repository.dart';

final emailRepositoryProvider = Provider<EmailRepositoryImpl>((ref) {
  return EmailRepositoryImpl(ref);
});

class EmailRepositoryImpl implements EmailRepository {
  final Ref ref;
  EmailRepositoryImpl(this.ref);

  @override
  Future<DataState> check() {
    // TODO: implement check
    throw UnimplementedError();
  }

  @override
  Future<DataState> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<DataState> regist(String email) {
    // TODO: implement regist
    throw UnimplementedError();
  }

  @override
  Future<DataState> send() {
    // TODO: implement send
    throw UnimplementedError();
  }

  @override
  Future<DataState> update(String email) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
