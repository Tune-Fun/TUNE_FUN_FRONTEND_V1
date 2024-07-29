import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/core/usecase/otp_usecase.dart';
import 'package:tunefun_front/data/repository/otp_repository_Impl.dart';
import 'package:tunefun_front/domain/repository/otp_repository.dart';

final otpUsecaseProvider = Provider<OtpUsecaseImpl>((ref) {
  final otpRepository = ref.watch(otpRepositoryProvider);
  return OtpUsecaseImpl(otpRepository);
});

class OtpUsecaseImpl implements OtpUseCase<dynamic, dynamic> {
  final OtpRepository _otpRepository;
  OtpUsecaseImpl(this._otpRepository);

  @override
  Future resendOTP(dynamic type) {
    return _otpRepository.resendOTP(type);
  }

  @override
  Future verifyOTP(dynamic type, dynamic otp) {
    return _otpRepository.verifyOTP(type, otp);
  }
}
