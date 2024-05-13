abstract class VoteUseCase<T, P> {
  Future<T> searchSong(P params);
  Future<T> uploadVote(P params);
}

class NoParams {}
