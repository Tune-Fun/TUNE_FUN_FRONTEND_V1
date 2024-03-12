class VotePaperModel {
  late String votePaperId;
  late String uuid;
  late String userName;
  late DateTime voteEndAt;
  late bool option;
  late DateTime delieveryAt;
  late DateTime createdAt;
  late DateTime updatedAt;
  late DateTime deletedAt;

  VotePaperModel.fromJson(Map<String, dynamic> json) {
    votePaperId = json["votePaperId"];
    uuid = json["uuid"];
    userName = json["userName"];
    voteEndAt = json["voteEndAt"];
    option = json["option"];
    delieveryAt = json["delieveryAt"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    deletedAt = json["deletedAt"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['votePaperId'] = votePaperId;
    data['uuid'] = uuid;
    data['userName'] = userName;
    data['voteEndAt'] = voteEndAt;
    data['option'] = option;
    data['delieveryAt'] = delieveryAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
