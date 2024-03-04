import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final voteViewModelProvider = ChangeNotifierProvider((ref) => VoteViewModel());

class VoteViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> dummy = [
    {"artist": "정승환", "song": "눈사람"},
    {"artist": "10cm", "song": "스토커"},
    {"artist": "이소정", "song": "우린 이제 남이니까"},
    {"artist": "10cm", "song": "폰서트"},
    {"artist": "노라조", "song": "형"},
    {"artist": "노라조", "song": "카레"}
  ];
  List<dynamic> _currentSongs = [];
  int _searchSongIndex = -1;
  String get currentSong =>
      _currentSongs.isNotEmpty ? _currentSongs[_searchSongIndex] : '';
  bool _isExist = false;
  bool get isExist => _isExist;
  set isExist(bool value) {
    _isExist = value;
    notifyListeners();
  }

  int get resultSongIndex {
    if (currentSong.isEmpty) {
      return -1;
    }
    return dummy.indexWhere((song) => song["song"] == currentSong);
  }

  void searchSongsByArtist(String artist) {
    _currentSongs = dummy
        .where((song) => song["artist"]?.toLowerCase() == artist.toLowerCase())
        .map((song) => song["song"]!)
        .toList();
    _searchSongIndex = _currentSongs.isNotEmpty ? 0 : -1;
    _isExist = _currentSongs.isNotEmpty;
    notifyListeners();
  }

  String get nextSong {
    if (_currentSongs.isEmpty) return '';
    _searchSongIndex = (_searchSongIndex + 1) % _currentSongs.length;
    notifyListeners();
    return _currentSongs[_searchSongIndex];
  }
}
