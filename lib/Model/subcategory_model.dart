class SubCategoryModel {
  int? id;
  String? mainCategoryName;
  String? name;
  bool? isGender;
  bool? isJobLevel;
  bool? isTopic;
  bool? isCost;
  bool? isUserLevel;

  SubCategoryModel(
      {this.id,
      this.mainCategoryName,
      this.name,
      this.isGender = false,
      this.isJobLevel = false,
      this.isTopic = true,
      this.isCost = false,
      this.isUserLevel = false});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainCategoryName = json['main_category_name'];
    name = json['sub_category_name'];
    isGender = false;
    isJobLevel = false;
    isTopic = true;
    isCost = false;
    isUserLevel = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main_category_name'] = mainCategoryName;
    data['sub_category_name'] = name;
    return data;
  }
}
