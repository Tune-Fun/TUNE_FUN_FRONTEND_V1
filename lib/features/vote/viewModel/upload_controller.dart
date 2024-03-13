import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final songsProvider = StateNotifierProvider<UploadNotifier, List<SongEntry>>(
    (ref) => UploadNotifier());

final optionProvider = StateProvider<bool>((ref) => false);

class SongEntry {
  TextEditingController artistController;
  TextEditingController songController;

  SongEntry({String? artistName, String? songTitle})
      : artistController = TextEditingController(text: artistName),
        songController = TextEditingController(text: songTitle);
}

class UploadNotifier extends StateNotifier<List<SongEntry>> {
  UploadNotifier() : super([SongEntry(), SongEntry()]);
  void addSongEntry() {
    state = [...state, SongEntry()];
  }

  void removeSongEntry(int index) {
    state[index].artistController.dispose();
    state[index].songController.dispose();
    state = List.from(state)..removeAt(index);
  }
}
