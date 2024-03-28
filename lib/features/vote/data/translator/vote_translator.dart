import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tunefun_front/core/failure.dart';
import 'package:tunefun_front/core/type_def.dart';
import 'package:tunefun_front/features/vote/data/dto/song_dto.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';

class VoteTranslator {
  static final VoteTranslator _singleton = VoteTranslator._internal();

  VoteTranslator._internal();

  factory VoteTranslator() => _singleton;

  FutureEither<List<SongInfo>> translateSongInfo(List<SongDto> songInfo) {
    try {
      return compute((List<SongDto> songInfo) {
        var translated = songInfo
            .map((song) =>
                SongInfo(artistName: song.artistName, songName: song.songName))
            .toList();
        return right(translated);
      }, songInfo);
    } catch (e, stackTrace) {
      throw left(Failure(e.toString(), stackTrace));
    }
  }
}
