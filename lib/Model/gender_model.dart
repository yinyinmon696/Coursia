class GenderModel {
  int? id;
  String? name;
  bool? isGender;
  bool? isJobLevel;
  bool? isTopic;
  bool? isCost;
  bool? isUserLevel;

  GenderModel(
      {this.id,
      this.name,
      this.isGender = true,
      this.isJobLevel = false,
      this.isTopic = false,
      this.isCost = false,
      this.isUserLevel = false});

  GenderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
