import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/data/dto/song_dto.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_model.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/usecase/song_usecase.dart';
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

  void uploadVote(String title, String content, String option,
      List<SongInfo> songs, String createdAt, String endedAt) async {
    List<SongInfo> cleanedSongs = cleanEmptySongs(songs);
    final List<SongInfoDTO> songDTOs =
        cleanedSongs.map((song) => SongInfoDTO.fromSongInfo(song)).toList();

    final uploadModel = UploadModel(
        title: title,
        content: content,
        option: "deny-add-choices",
        vote_start_at: createdAt,
        vote_end_at: endedAt,
        offers: songDTOs);

    try {
      final result = await _voteUseCase.uploadVote(uploadModel);
      result.when(success: (data) {
        DataState.success(data);
      }, error: (error, message) {
        DataState.error(error, message);
      });
      print("success data form ${uploadModel.toJson()}");
    } catch (error) {
      //error
      print('err $error');
    }
  }

  List<SongInfo> cleanEmptySongs(List<SongInfo> songs) {
    return songs
        .where((song) => song.artist_name.isNotEmpty && song.music.isNotEmpty)
        .toList();
  }
}

final songListProvider =
    StateNotifierProvider<SongListController, List<SongInfo>>(
        (ref) => SongListController());

class SongListController extends StateNotifier<List<SongInfo>> {
  SongListController()
      : super([
          SongInfo(id: '', artist_name: '', music: '', music_image: ''),
          SongInfo(id: '', artist_name: '', music: '', music_image: ''),
        ]);

  void addSongEntry(SongInfo song) {
    state = [...state, song];
  }

  void updateArtistName(int index, String name) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          SongInfo(id: '', artist_name: '', music: '', music_image: '')
        else
          state[i],
    ];
  }

  void updateSongTitle(int index, String title) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          SongInfo(id: '', artist_name: '', music: '', music_image: '')
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
            id: song.id,
            artist_name: song.artist_name,
            music: song.music,
            music_image: song.music_image);
        state = updatedList;
      }
    }
  }

  bool checkDuplicate(SongInfo song) {
    if (state.any(
        (s) => s.artist_name == song.artist_name && s.music == song.music)) {
      Fluttertoast.showToast(msg: '이미 추가된 노래입니다.');
      return false;
    }
    return true;
  }
}

final songSearchProvider =
    StateNotifierProvider<SongSearchController, SongSearchState>((ref) {
  final songUsecase = ref.watch(songUsecaseProvider);
  return SongSearchController(songUsecase);
});

class SongSearchController extends StateNotifier<SongSearchState> {
  final SongUseCaseImpl _songUseCase;

  SongSearchController(this._songUseCase) : super(const SongSearchInitial());

  Future<void> searchSongs(String query) async {
    state = const SongSearchLoading();
    final result = await _songUseCase.searchSong(query);
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
      SongInfo(id: '', artist_name: '', music: '', music_image: '');
  void searchSong(String query) {
    _filteredSongs = dummy
        .where((song) =>
            song.artist_name.toLowerCase().contains(query.toLowerCase()) ||
            song.music.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void addVoteSong(SongInfo song) {
    searchedSong = song;
    notifyListeners();
  }
}
