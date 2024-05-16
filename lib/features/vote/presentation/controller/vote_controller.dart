import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/usecase/vote_usecase.dart';
import 'package:tunefun_front/features/vote/presentation/views/vote_detail_view.dart';

part 'song_search_state.dart';
part 'vote_upload_state.dart';

final uploadProvider =
    StateNotifierProvider<UploadController, VoteUploadState>((ref) {
  final voteUsecase = ref.watch(voteUsecaseProvider);
  return UploadController(voteUsecase);
});

class UploadController extends StateNotifier<VoteUploadState> {
  final VoteUseCaseImpl _voteUseCase;
  UploadController(this._voteUseCase) : super(const VoteUploadInitial());

  void uploadVote(String title, String content, bool option,
      List<SongInfo> songs, DateTime createdAt) async {
    final cleanedSongs = cleanEmptySongs(songs);
    final uploadModel = UploadTestModel(
      id: 'test id',
      uuid: 'test uuid',
      userName: 'test user name',
      title: title,
      content: content,
      options: option,
      songInfo: option ? cleanedSongs : [],
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      deletedAt: null,
    );

    try {
      final result = await _voteUseCase.uploadVote(uploadModel);
      result.when(success: (data) {}, error: (error, message) {});
      print("success data form ${uploadModel.toJson()}");
    } catch (error) {
      //error
      print('err $error');
    }
  }

  List<SongInfo> cleanEmptySongs(List<SongInfo> songs) {
    return songs
        .where((song) => song.artistName.isNotEmpty && song.songName.isNotEmpty)
        .toList();
  }
}

final songListProvider =
    StateNotifierProvider<SongListController, List<SongInfo>>(
        (ref) => SongListController());

class SongListController extends StateNotifier<List<SongInfo>> {
  SongListController()
      : super([
          SongInfo(songId: '', artistName: '', songName: '', songImage: ''),
          SongInfo(songId: '', artistName: '', songName: '', songImage: ''),
        ]);

  void addSongEntry(SongInfo song) {
    state = [...state, song];
  }

  void updateArtistName(int index, String name) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          SongInfo(
              songId: '',
              artistName: name,
              songName: state[i].songName,
              songImage: '')
        else
          state[i],
    ];
  }

  void updateSongTitle(int index, String title) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          SongInfo(
              songId: '',
              artistName: state[i].artistName,
              songName: title,
              songImage: '')
        else
          state[i],
    ];
  }

  void removeSongEntry(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  void updateSongEntry(int index, SongInfo song) {
    if (checkDuplicate(song)) {
      if (index < state.length) {
        List<SongInfo> updatedList = List.from(state);
        updatedList[index] = SongInfo(
            songId: song.songId,
            artistName: song.artistName,
            songName: song.songName,
            songImage: song.songImage);
        state = updatedList;
      }
    }
  }

  bool checkDuplicate(SongInfo song) {
    if (state.any((s) =>
        s.artistName == song.artistName && s.songName == song.songName)) {
      Fluttertoast.showToast(msg: '이미 추가된 노래입니다.');
      return false;
    }
    return true;
  }
}

final songSearchProvider =
    StateNotifierProvider<SongSearchController, SongSearchState>((ref) {
  final voteUsecase = ref.watch(voteUsecaseProvider);
  return SongSearchController(voteUsecase);
});

class SongSearchController extends StateNotifier<SongSearchState> {
  final VoteUseCaseImpl _voteUseCase;

  SongSearchController(this._voteUseCase) : super(const SongSearchInitial());

  Future<void> searchSongs(String query) async {
    state = const SongSearchLoading();
    final result = await _voteUseCase.searchSong(query);
    result.when(success: (data) {
      state = SongSearchSuccess(data);
    }, error: (error, message) {
      state = SongSearchError(message);
    });
  }
}

final voteViewModelProvider = ChangeNotifierProvider((ref) {
  final voteUsecase = ref.watch(voteUsecaseProvider);
  return VoteViewModel(voteUsecase);
});

class VoteViewModel extends ChangeNotifier {
  final VoteUseCaseImpl _voteUseCase;
  VoteViewModel(this._voteUseCase);

  List<SongInfo> _filteredSongs = dummy;
  List<SongInfo> get filteredSongs => _filteredSongs;
  int filteredSongIndex = 0;
  SongInfo searchedSong =
      SongInfo(songId: '', artistName: '', songName: '', songImage: '');
  void searchSong(String query) {
    _filteredSongs = dummy
        .where((song) =>
            song.artistName.toLowerCase().contains(query.toLowerCase()) ||
            song.songName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void addVoteSong(SongInfo song) {
    searchedSong = song;
    notifyListeners();
  }
}
