abstract class VoteUseCase<T, P> {
  Future<T> uploadVote(P params);
  Future<T> fetchVotePaper(P params, P params2);
}
