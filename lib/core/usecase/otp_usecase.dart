abstract class OtpUseCase<T, P> {
  Future<T> verifyOTP(P type, P otp);
  Future<T> resendOTP(P type);
}
