import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/data/data_source/auth_data_source.dart';
import 'package:tunefun_front/data/data_source/email_data_source.dart';
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
  Future<DataState> checkDuplicate(String email) async {
    try {
      final response =
          await ref.read(emailDataSourceProvider).checkDuplicate(email);

      return DataState.success(response["code"]);
    } catch (e) {
      return DataState.error(Exception(e), e.toString());
    }
  }

  @override
  Future<DataState> checkVerify() async {
    try {
      final response = await ref.read(emailDataSourceProvider).checkVerify();
      return DataState.success(response["code"]);
    } catch (e) {
      return DataState.error(Exception(e), e.toString());
    }
  }

  @override
  Future<DataState> delete() async {
    try {
      final response = await ref.read(emailDataSourceProvider).delete();
      return DataState.success(response["code"]);
    } catch (e) {
      return DataState.error(Exception(e), e.toString());
    }
  }

  @override
  Future<DataState> regist(String email) async {
    try {
      final response = await ref.read(emailDataSourceProvider).regist(email);
      return DataState.success(response["code"]);
    } catch (e) {
      return DataState.error(Exception(e), e.toString());
    }
  }

  @override
  Future<DataState> send() async {
    try {
      final response = await ref.read(emailDataSourceProvider).send();
      return DataState.success(response["code"]);
    } catch (e) {
      return DataState.error(Exception(e), e.toString());
    }
  }

  @override
  Future<DataState> update(String email) async {
    try {
      final response = await ref.read(emailDataSourceProvider).update();
      return DataState.success(response["code"]);
    } catch (e) {
      return DataState.error(Exception(e), e.toString());
    }
  }

  @override
  Future<DataState> verify(String otp) async {
    try {
      final response = await ref.read(emailDataSourceProvider).verify(otp);
      return DataState.success(response["code"]);
    } catch (e) {
      return DataState.error(Exception(e), e.toString());
    }
  }
}
