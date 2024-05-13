import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/core/vote_usecase.dart';
import 'package:tunefun_front/features/vote/data/repository/%08vote_repository_impl.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/vote_repository.dart';

final voteUsecaseProvider = Provider<VoteUseCaseImpl>((ref) {
  final voteRepository = ref.watch(voteRepositoryProvider);
  return VoteUseCaseImpl(voteRepository);
});

class VoteUseCaseImpl
    implements VoteUseCase<DataState<List<SongInfo>>, dynamic> {
  final VoteRepository _songRepository;
  VoteUseCaseImpl(this._songRepository);
  @override
  Future<DataState<List<SongInfo>>> searchSong(dynamic artist) {
    return _songRepository.searchSong(artist);
  }

  @override
  Future<DataState<List<SongInfo>>> uploadVote(params) {
    // TODO: implement uploadVote
    throw UnimplementedError();
  }
}
