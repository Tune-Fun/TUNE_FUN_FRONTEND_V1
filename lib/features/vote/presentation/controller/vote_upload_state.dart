part of 'vote_controller.dart';

abstract class VoteUploadState {
  final List<SongInfo>? songs;
  final String? error;
  const VoteUploadState({this.songs, this.error});
}

class VoteUploadInitial extends VoteUploadState {
  const VoteUploadInitial();
}

class VoteUploadLoading extends VoteUploadState {
  const VoteUploadLoading();
}

class VoteUploadSuccess extends VoteUploadState {
  final List<SongInfo> songs;

  VoteUploadSuccess(this.songs);
}

class VoteUploadError extends VoteUploadState {
  final String message;

  VoteUploadError(this.message);
}
