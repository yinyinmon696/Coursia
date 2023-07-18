import 'package:coursia/Model/blog_type_model.dart';
import 'package:coursia/Model/image_model.dart';

class BlogModel {
  int? id;
  int? blogTypeId;
  String? title;
  String? authorName;
  int? mediableId;
  String? content;
  int? activeStatus;
  String? createdAt;
  BlogTypeModel? blogType;
  ImageModel? imageModel;

  BlogModel(
      {this.id,
      this.blogTypeId,
      this.title,
      this.authorName,
      this.mediableId,
      this.content,
      this.activeStatus,
      this.createdAt,
      this.blogType,
      this.imageModel});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    blogTypeId = json['blog_type_id'];
    title = json['title'];
    authorName = json['author_name'];
    mediableId = json['mediable_id'];
    content = json['content'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    blogType = json['blog_type'] != null
        ? BlogTypeModel.fromJson(json['blog_type'])
        : null;
    imageModel =
        json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['blog_type_id'] = blogTypeId;
    data['title'] = title;
    data['author_name'] = authorName;
    data['mediable_id'] = mediableId;
    data['content'] = content;
    data['active_status'] = activeStatus;
    data['created_at'] = createdAt;
    if (blogType != null) {
      data['blog_type'] = blogType!.toJson();
    }
    if (imageModel != null) {
      data['image'] = imageModel!.toJson();
    }
    return data;
  }
}
