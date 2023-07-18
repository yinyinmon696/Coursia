// ignore_for_file: must_be_immutable

class UserLevelModel {
  int? id;
  String? name;
  bool? isGender;
  bool? isJobLevel;
  bool? isTopic;
  bool? isCost;
  bool? isUserLevel;

  UserLevelModel(
      {this.id,
      this.name,
      this.isGender = false,
      this.isJobLevel = false,
      this.isTopic = false,
      this.isCost = false,
      this.isUserLevel = true});

  UserLevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isGender = false;
    isJobLevel = false;
    isTopic = false;
    isCost = false;
    isUserLevel = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
