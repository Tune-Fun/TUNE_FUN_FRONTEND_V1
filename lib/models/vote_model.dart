class VoteListModel {
  late String votePaperId;
  late String? selectedOption;
  late String username;
  late DateTime createdAt;
  late DateTime updatedAt;
  late DateTime deletedAt;

  VoteListModel.fromJson(Map<String, dynamic> json) {
    votePaperId = json["votePaperId"];
    selectedOption = json["selectedOption"];
    username = json["username"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    deletedAt = json["deletedAt"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['votePaperId'] = votePaperId;
    data['selectedOption'] = selectedOption;
    data['username'] = username;
    data['createdAt'] = createdAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
