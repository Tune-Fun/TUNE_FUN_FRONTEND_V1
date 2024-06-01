abstract class SongUseCase<T, P> {
  Future<T> searchSong(P params);
}
