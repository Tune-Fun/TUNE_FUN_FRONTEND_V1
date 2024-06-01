import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/core/vote_usecase.dart';
import 'package:tunefun_front/features/vote/data/repository/%08vote_repository_impl.dart';
import 'package:tunefun_front/features/vote/domain/model/response_model.dart';
import 'package:tunefun_front/features/vote/domain/repository/vote_repository.dart';

final voteUsecaseProvider = Provider<VoteUseCaseImpl>((ref) {
  final voteRepository = ref.watch(voteRepositoryProvider);
  return VoteUseCaseImpl(voteRepository);
});

class VoteUseCaseImpl
    implements VoteUseCase<DataState<ResponseModel>, dynamic> {
  final VoteRepository _voteRepository;
  VoteUseCaseImpl(this._voteRepository);

  @override
  Future<DataState<ResponseModel>> uploadVote(dynamic params) {
    return _voteRepository.uploadVote(params);
  }
}
