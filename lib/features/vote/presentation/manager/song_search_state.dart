part of 'vote_upload_manager.dart';

abstract class SongSearchState {
  final List<SongInfo>? songs;
  final String? error;
  const SongSearchState({this.songs, this.error});
}

class SongSearchInitial extends SongSearchState {
  const SongSearchInitial();
}

class SongSearchLoading extends SongSearchState {
  const SongSearchLoading();
}

class SongSearchSuccess extends SongSearchState {
  final List<SongInfo> songs;

  SongSearchSuccess(this.songs);
}

class SongSearchError extends SongSearchState {
  final String message;

  SongSearchError(this.message);
}
