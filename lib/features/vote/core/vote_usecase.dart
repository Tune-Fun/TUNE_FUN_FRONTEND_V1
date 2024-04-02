import 'package:tunefun_front/core/core.dart';

abstract class VoteUseCase<T, P> {
  FutureEither<T> searchSong(P params);
  FutureEither<T> uploadVote(P params);
}

class NoParams {}
