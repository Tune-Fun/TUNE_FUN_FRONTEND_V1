// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tunefun_front/features/vote/data/dto/song_dto.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';

class UploadModel {
  final String title;
  final String content;
  final String option;
  final String vote_start_at;
  final String vote_end_at;
  final List<SongInfoDTO> offers;

  UploadModel(
      {required this.title,
      required this.content,
      required this.option,
      required this.vote_start_at,
      required this.vote_end_at,
      required this.offers});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'option': option,
      'vote_start_at': vote_start_at,
      'vote_end_at': vote_end_at,
      'offers': offers.map((x) => x.toMap()).toList(),
    };
  }

  factory UploadModel.fromMap(Map<String, dynamic> map) {
    return UploadModel(
      title: map['title'] as String,
      content: map['content'] as String,
      option: map['option'] as String,
      vote_start_at: map['vote_start_at'] as String,
      vote_end_at: map['vote_end_at'] as String,
      offers: List<SongInfoDTO>.from(
        (map['offers'] as List<int>).map<SongInfo>(
          (x) => SongInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadModel.fromJson(String source) =>
      UploadModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
