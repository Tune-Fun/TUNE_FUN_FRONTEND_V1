abstract class EmailUseCase<T, P> {
  Future<T> check();
  Future<T> regist(P params);
  Future<T> send();
  Future<T> update(P params);
  Future<T> delete();
}
