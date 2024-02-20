class VoteListModel {
  late String title;
  late String uid;
  late String profile;
  late String content;
  late String profileImage;
  late int likeCnt;
  late int votesCnt;
  late DateTime createdAt;
  late DateTime updatedAt;
  late DateTime expiredAt;

  VoteListModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    profile = json["profile"];
    uid = json["uid"];
    content = json["content"];
    profileImage = json["profileImage"];
    likeCnt = json["likeCnt"];
    votesCnt = json["votesCnt"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    expiredAt = json["expiredAt"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['profile'] = profile;
    data['uid'] = uid;
    data['content'] = content;
    data['profileImage'] = profileImage;
    data['likeCnt'] = likeCnt;
    data['votesCnt'] = votesCnt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['expiredAt'] = expiredAt;
    return data;
  }
}
