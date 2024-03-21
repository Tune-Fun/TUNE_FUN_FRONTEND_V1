import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/features/vote/core/usecase.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/vote_repository.dart';

class SongUseCase implements UseCase<List<SongInfo>, String> {
  final SongRepository _songRepository;
  SongUseCase(this._songRepository);
  @override
  FutureEither<List<SongInfo>> call(String artist) {
    return _songRepository.searchSong(artist);
  }
}
