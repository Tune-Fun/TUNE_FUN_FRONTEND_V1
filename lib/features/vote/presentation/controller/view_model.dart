import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/data/data_source/vote_data_source.dart';
import 'package:tunefun_front/features/vote/presentation/views/vote_detail_view.dart';

final voteViewModelProvider = ChangeNotifierProvider((ref) => VoteViewModel());

class VoteViewModel extends ChangeNotifier {
  final VoteDataSource voteDataSource = VoteDataSource();
  List<Map<String, dynamic>> _filteredSongs = [];
  List<Map<String, dynamic>> get filteredSongs => _filteredSongs;
  int filteredSongIndex = 0;

  void searchByArtist(String artistName) {
    _filteredSongs = dummy
        .where((song) =>
            song['artist'].toLowerCase().contains(artistName.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void showNextSong() {
    filteredSongIndex = (filteredSongIndex + 1) % filteredSongs.length;
    notifyListeners();
  }

  void showPreviousSong() {
    filteredSongIndex =
        (filteredSongIndex - 1 + filteredSongs.length) % filteredSongs.length;
    notifyListeners();
  }
}
