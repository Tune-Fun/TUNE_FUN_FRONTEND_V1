abstract class AuthUseCase<T, P> {
  Future<T> signUp(P params);
  Future<T> checkEmail(P params);
  Future<T> checkId(P params);
  Future<T> logIn(P params);
}
