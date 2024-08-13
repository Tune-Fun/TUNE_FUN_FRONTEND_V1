abstract class AuthUseCase<T, P> {
  Future<T> signUp(P params);
  Future<T> checkId(P params);
  Future<T> logIn(P params);
  Future<T> setNewPassword(P params);
  Future<T> sendPasswordOTP();
  Future<T> resendPasswordOTP();
  Future<T> updateNickname(P newNickname);
}
