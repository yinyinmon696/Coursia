import 'package:coursia/Model/image_model.dart';

class QuizTypeModel {
  int? id;
  String? name;
  int? totalQuestion;
  ImageModel? image;
  bool? lock;

  QuizTypeModel(
      {this.id, this.name, this.totalQuestion, this.image, this.lock});

  QuizTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalQuestion = json['total_question'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    lock = json['lock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['total_question'] = totalQuestion;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['lock'] = lock;
    return data;
  }
}
