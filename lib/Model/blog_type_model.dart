import 'package:coursia/Model/image_model.dart';

class BlogTypeModel {
  int? id;
  String? name;
  int? mediableId;
  int? activeStatus;
  ImageModel? imageModel;

  BlogTypeModel(
      {this.id,
      this.name,
      this.mediableId,
      this.activeStatus,
      this.imageModel});

  BlogTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mediableId = json['mediable_id'];
    activeStatus = json['active_status'];
    imageModel =
        json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mediable_id'] = mediableId;
    data['active_status'] = activeStatus;
    if (imageModel != null) {
      data['image'] = imageModel!.toJson();
    }
    return data;
  }
}
