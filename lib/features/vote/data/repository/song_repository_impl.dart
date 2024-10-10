import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/data/data_source/song_data_source.dart';
import 'package:tunefun_front/features/vote/data/translator/vote_translator.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/song_repository.dart';

final songRepositoryProvider = Provider<SongRepositoryImpl>((ref) {
  return SongRepositoryImpl(ref);
});

class SongRepositoryImpl implements SongRepository {
  final Ref ref;
  const SongRepositoryImpl(this.ref);
  @override
  Future<DataState<List<SongInfo>>> searchSong(String artist) async {
    try {
      final response =
          await ref.read(songDataSourceProvider).searchSong(artist);
      return VoteTranslator().translateSongInfo(response);
    } catch (e) {
      return DataState.error(Exception(), e.toString());
    }
  }
}
