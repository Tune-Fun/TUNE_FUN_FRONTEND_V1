import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:tunefun_front/core/core.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/usecase/vote_usecase.dart';

part 'vote_upload_state.dart';

final VoteUseCaseImpl _voteUseCase = GetIt.I<VoteUseCaseImpl>();
final uploadProvider = StateNotifierProvider<UploadController, VoteUploadState>(
    (ref) => UploadController(_voteUseCase));

class UploadController extends StateNotifier<VoteUploadState> {
  final VoteUseCaseImpl _songUseCase;
  UploadController(this._songUseCase) : super(const VoteUploadInitial());

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

  Future<void> searchList(String query) async {
    final result = await _songUseCase.searchSong(query);
    result.fold((l) {
      state = VoteUploadError(l.toString());
    }, (r) {
      state = VoteUploadSuccess(r);
    });
  }
}

final songListProvider =
    StateNotifierProvider<SongListController, List<SongInfo>>(
        (ref) => SongListController());

class SongListController extends StateNotifier<List<SongInfo>> {
  SongListController()
      : super([
          SongInfo(artistName: '', songName: ''),
          SongInfo(artistName: '', songName: '')
        ]);

  void addSongEntry() {
    state = [...state, SongInfo(artistName: '', songName: '')];
  }

  void updateArtistName(int index, String name) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          SongInfo(artistName: name, songName: state[i].songName)
        else
          state[i],
    ];
  }

  void updateSongTitle(int index, String title) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          SongInfo(artistName: state[i].artistName, songName: title)
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

  void updateSongEntry(int index, String artistName, String songTitle) {
    if (index < state.length) {
      List<SongInfo> updatedList = List.from(state);
      updatedList[index] =
          SongInfo(artistName: artistName, songName: songTitle);
      state = updatedList;
    }
  }
}
