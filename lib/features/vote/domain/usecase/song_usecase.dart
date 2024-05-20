import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/core/song_usecase.dart';
import 'package:tunefun_front/features/vote/data/repository/%08song_repository_impl.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/song_repository.dart';

final songUsecaseProvider = Provider<SongUseCaseImpl>((ref) {
  final songRepository = ref.watch(songRepositoryProvider);
  return SongUseCaseImpl(songRepository);
});

class SongUseCaseImpl
    implements SongUseCase<DataState<List<SongInfo>>, dynamic> {
  final SongRepository _songRepository;
  SongUseCaseImpl(this._songRepository);
  @override
  Future<DataState<List<SongInfo>>> searchSong(dynamic artist) {
    return _songRepository.searchSong(artist);
  }
}
