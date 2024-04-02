import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/features/vote/core/vote_usecase.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/vote_repository.dart';

class VoteUseCaseImpl implements VoteUseCase<List<SongInfo>, dynamic> {
  final VoteRepository _songRepository;
  VoteUseCaseImpl(this._songRepository);
  @override
  FutureEither<List<SongInfo>> searchSong(dynamic artist) {
    return _songRepository.searchSong(artist);
  }

  @override
  FutureEither<List<SongInfo>> uploadVote(params) {
    // TODO: implement uploadVote
    throw UnimplementedError();
  }
}
