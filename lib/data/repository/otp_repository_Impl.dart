import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/data/data_source/otp_data_source.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/domain/repository/otp_repository.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';

final otpRepositoryProvider = Provider<OtpRepositoryImpl>((ref) {
  return OtpRepositoryImpl(ref);
});

class OtpRepositoryImpl implements OtpRepository {
  final Ref ref;
  OtpRepositoryImpl(this.ref);

  @override
  Future<DataState> resendOTP(String type) async {
    try {
      final response = await ref.read(otpDataSourceProvider).resendOTP(type);
      if (response["code"] == "3107") {
        return DataState.success(response["message"]);
      } else {
        return DataState.error(Exception(), "change err");
      }
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState> verifyOTP(String type, String otp) async {
    try {
      final response =
          await ref.read(otpDataSourceProvider).verifyOTP(type, otp);
      if (response["code"] == "3104") {
        final userVM = ref.read(userManagerProvider);
        userVM!.copyWith(accessToken: response["data"]["access_token"]);
        userVM!.copyWith(refreshToken: response["data"]["refresh_token"]);
        return DataState.success(response["message"]);
      } else {
        return DataState.error(Exception(), "change err");
      }
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }
}
