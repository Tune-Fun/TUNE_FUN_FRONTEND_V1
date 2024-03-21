import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tunefun_front/core/failure.dart';
import 'package:tunefun_front/features/vote/data/data_source/vote_data_source.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/test/search_mock.dart';

final uploadSongListProvider =
    StateNotifierProvider<UploadController, List<SongInfo>>(
        (ref) => UploadController());

class UploadController extends StateNotifier<List<SongInfo>> {
  UploadController()
      : super([
          SongInfo(artistName: '', songName: ''),
          SongInfo(artistName: '', songName: '')
        ]);
  final VoteDataSource voteDataSource = VoteDataSource();

  void uploadVote(String title, String content, bool option,
      List<SongInfo> songs, DateTime createdAt) async {
    final uploadModel = UploadTestModel(
      id: 'test id',
      uuid: 'test uuid',
      userName: 'test user name',
      title: title,
      content: content,
      options: option,
      songInfo: option ? songs : [],
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      deletedAt: null,
    );

    try {
      print("success data form ${uploadModel.toJson()}");
      // await voteDataSource.uploadvote(uploadModel);
    } catch (error) {
      //error
      print('err $error');
    }
  }

  Future<Either<Failure, List<SongInfo>>> searchList(String query) async {
    final result = await voteDataSource.searchSong(query);
    return result.fold(
      (failure) => Left(failure),
      (tracks) {
        final List<SongInfo> songInfos = tracks.map<SongInfo>((track) {
          final String artistName =
              track['artists'] != null && track['artists'].isNotEmpty
                  ? track['artists'][0]['name']
                  : 'Unknown Artist';
          final String songTitle = track['name'] ?? 'Unknown Title';
          return SongInfo(artistName: artistName, songName: songTitle);
        }).toList();
        return Right(songInfos);
      },
    );
  }

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
