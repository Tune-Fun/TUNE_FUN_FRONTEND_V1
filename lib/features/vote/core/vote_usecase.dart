abstract class VoteUseCase<T, P> {
  Future<T> uploadVote(P params);
}
