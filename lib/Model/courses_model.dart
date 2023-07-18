class CoursesModel {
  int? id;
  String? mainCategoryName;
  int? subcategoryId;
  String? title;
  String? level;
  int? paidType;
  int? price;
  String? learningObjective;
  String? learningOutcome;
  String? description;
  int? mediableId;
  int? postTestStatus;
  String? postTestType;
  int? status;

  CoursesModel(
      {this.id,
      this.mainCategoryName,
      this.subcategoryId,
      this.title,
      this.level,
      this.paidType,
      this.price,
      this.learningObjective,
      this.learningOutcome,
      this.description,
      this.mediableId,
      this.postTestStatus,
      this.postTestType,
      this.status});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainCategoryName = json['main_category_name'];
    subcategoryId = json['subcategory_id'];
    title = json['title'];
    level = json['level'];
    paidType = json['paid_type'];
    price = json['price'];
    learningObjective = json['learning_objective'];
    learningOutcome = json['learning_outcome'];
    description = json['description'];
    mediableId = json['mediable_id'];
    postTestStatus = json['post_test_status'];
    postTestType = json['post_test_type'] ?? "";
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main_category_name'] = mainCategoryName;
    data['subcategory_id'] = subcategoryId;
    data['title'] = title;
    data['level'] = level;
    data['paid_type'] = paidType;
    data['price'] = price;
    data['learning_objective'] = learningObjective;
    data['learning_outcome'] = learningOutcome;
    data['description'] = description;
    data['mediable_id'] = mediableId;
    data['post_test_status'] = postTestStatus;
    data['post_test_type'] = postTestType;
    data['status'] = status;

    return data;
  }
}
