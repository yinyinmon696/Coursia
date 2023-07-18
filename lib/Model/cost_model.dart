class CostModel {
  int? id;
  String? name;
  bool? isGender;
  bool? isJobLevel;
  bool? isTopic;
  bool? isCost;
  bool? isUserLevel;

  CostModel(
      {this.id,
      this.name,
      this.isGender = false,
      this.isJobLevel = false,
      this.isTopic = false,
      this.isCost = true,
      this.isUserLevel = false});

  CostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isGender = false;
    isJobLevel = false;
    isTopic = false;
    isCost = true;
    isUserLevel = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
