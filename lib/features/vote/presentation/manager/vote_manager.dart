import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/domain/model/vote_paper_model.dart';
import 'package:tunefun_front/features/vote/domain/usecase/vote_usecase.dart';

part 'vote_manager_state.dart';

final voteManagerProvider =
    StateNotifierProvider<VoteManager, VoteManagerState>((ref) {
  final voteUsecase = ref.watch(voteUsecaseProvider);
  return VoteManager(voteUsecase);
});

class VoteManager extends StateNotifier<VoteManagerState> {
  final VoteUseCaseImpl _voteUseCase;
  VoteManager(this._voteUseCase) : super(const VoteManagerInitial());

  Future<void> fetchVotePaper() async {
    final response = await _voteUseCase.fetchVotePaper('params', "params2");
    response.when(success: (data) {
      state = FetchVotePaperSuccess(data);
    }, error: (error, message) {
      state = FetchVotePaperError(message);
    });
  }
}
