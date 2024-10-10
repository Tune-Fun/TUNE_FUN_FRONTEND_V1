import 'dart:convert';

class VotePaperModel {
  final int id;
  final String uuid;
  final String title;
  final String authorUsername;
  final String? authorProfileImageUrl;
  final String authorNickname;
  final int remainDays;
  final String totalVoteCount;
  final String? totalLikeCount;

  VotePaperModel({
    required this.id,
    required this.uuid,
    required this.title,
    required this.authorUsername,
    this.authorProfileImageUrl,
    required this.authorNickname,
    required this.remainDays,
    required this.totalVoteCount,
    this.totalLikeCount,
  });

  // Map to Model 변환
  factory VotePaperModel.fromMap(Map<String, dynamic> map) {
    return VotePaperModel(
      id: map['id'] as int,
      uuid: map['uuid'] as String,
      title: map['title'] as String,
      authorUsername: map['author_username'] as String,
      authorProfileImageUrl: map['author_profile_image_url'] as String?,
      authorNickname: map['author_nickname'] as String,
      remainDays: map['remain_days'] as int,
      totalVoteCount: map['total_vote_count'] as String,
      totalLikeCount: map['total_like_count'] as String?,
    );
  }

  // Model to Map 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uuid': uuid,
      'title': title,
      'author_username': authorUsername,
      'author_profile_image_url': authorProfileImageUrl,
      'author_nickname': authorNickname,
      'remain_days': remainDays,
      'total_vote_count': totalVoteCount,
      'total_like_count': totalLikeCount,
    };
  }

  // JSON to Model 변환
  factory VotePaperModel.fromJson(String source) =>
      VotePaperModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // Model to JSON 변환
  String toJson() => json.encode(toMap());
}
