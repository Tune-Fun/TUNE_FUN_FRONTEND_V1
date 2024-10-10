import 'dart:convert';

class VotePaperDTO {
  final int id;
  final String uuid;
  final String title;
  final String authorNickname;
  final String authorUsername;
  final String? authorProfileImageUrl;
  final int remainDays;
  final String totalVoteCount;
  final String? totalLikeCount;

  VotePaperDTO({
    required this.id,
    required this.uuid,
    required this.title,
    required this.authorNickname,
    required this.authorUsername,
    this.authorProfileImageUrl,
    required this.remainDays,
    required this.totalVoteCount,
    this.totalLikeCount,
  });

  factory VotePaperDTO.fromMap(Map<String, dynamic> map) {
    return VotePaperDTO(
      id: map['id'] as int,
      uuid: map['uuid'] as String,
      title: map['title'] as String,
      authorNickname: map['author_nickname'] as String,
      authorUsername: map['author_username'] as String,
      authorProfileImageUrl: map['author_profile_image_url'] as String?,
      remainDays: map['remain_days'] as int,
      totalVoteCount: map['total_vote_count'] as String,
      totalLikeCount: map['total_like_count'] as String?,
    );
  }

  factory VotePaperDTO.fromJson(String source) =>
      VotePaperDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
