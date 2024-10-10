part of 'vote_manager.dart';

abstract class VoteManagerState {
  final List<VotePaperModel>? data;
  final String? message;
  const VoteManagerState({this.data, this.message});
}

class VoteManagerInitial extends VoteManagerState {
  const VoteManagerInitial();
}

class FetchVotePaperLoading extends VoteManagerState {
  const FetchVotePaperLoading();
}

class FetchVotePaperSuccess extends VoteManagerState {
  final List<VotePaperModel> votePapers;
  FetchVotePaperSuccess(this.votePapers);
}

class FetchVotePaperError extends VoteManagerState {
  final String error;

  FetchVotePaperError(this.error);
}
