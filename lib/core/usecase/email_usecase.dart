abstract class EmailUseCase<T, P> {
  Future<T> checkDuplicate(P params);
  Future<T> checkVerify();
  Future<T> regist(P params);
  Future<T> send();
  Future<T> update(P params);
  Future<T> delete();
  Future<T> verify(P params);
}
