import 'package:flutter/foundation.dart';
import 'package:tunefun_front/data/exceptions/translate_exception.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/data/dto/song_dto.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';

class VoteTranslator {
  static final VoteTranslator _singleton = VoteTranslator._internal();

  VoteTranslator._internal();

  factory VoteTranslator() => _singleton;

  Future<DataState<List<SongInfo>>> translateSongInfo(List<SongDto> songInfo) {
    try {
      return compute((List<SongDto> songInfo) {
        var translated = songInfo
            .map((song) => SongInfo(
                songId: song.songId,
                artistName: song.artistName,
                songName: song.songName,
                songImage: song.songImage))
            .toList();
        return DataState.success(translated);
      }, songInfo);
    } catch (error) {
      throw TranslateException(error.toString());
    }
  }
}
