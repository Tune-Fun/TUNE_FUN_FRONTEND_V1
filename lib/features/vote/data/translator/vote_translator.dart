import 'package:flutter/foundation.dart';
import 'package:tunefun_front/data/exceptions/translate_exception.dart';
import 'package:tunefun_front/domain/model/data_state_model.dart';
import 'package:tunefun_front/features/vote/data/dto/song_dto.dart';
import 'package:tunefun_front/features/vote/data/dto/vote_paper_dto.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/domain/model/vote_paper_model.dart';

class VoteTranslator {
  static final VoteTranslator _singleton = VoteTranslator._internal();

  VoteTranslator._internal();

  factory VoteTranslator() => _singleton;

  Future<DataState<List<SongInfo>>> translateSongInfo(
      List<SongFromSpotifyDTO> songInfo) {
    try {
      return compute((List<SongFromSpotifyDTO> songInfo) {
        var translated = songInfo
            .map((song) => SongInfo(
                id: song.songId,
                artist_name: song.artistName,
                music: song.songName,
                music_image: song.songImage))
            .toList();
        return DataState.success(translated);
      }, songInfo);
    } catch (error) {
      throw TranslateException(error.toString());
    }
  }

  Future<DataState<List<VotePaperModel>>> translateVotePaper(
      List<dynamic> responseData) {
    List<VotePaperDTO> votePaperDTOs = responseData.map((data) {
      return VotePaperDTO.fromMap(data as Map<String, dynamic>);
    }).toList();
    try {
      return compute((List<VotePaperDTO> votePaperDTOs) {
        var translated = votePaperDTOs
            .map((paper) => VotePaperModel(
                id: paper.id,
                uuid: paper.uuid,
                title: paper.title,
                authorUsername: paper.authorUsername,
                authorNickname: paper.authorNickname,
                authorProfileImageUrl: paper.authorProfileImageUrl,
                remainDays: paper.remainDays,
                totalVoteCount: paper.totalVoteCount,
                totalLikeCount: paper.totalLikeCount))
            .toList();
        return DataState.success(translated);
      }, votePaperDTOs);
    } catch (error) {
      throw TranslateException(error.toString());
    }
  }
}
