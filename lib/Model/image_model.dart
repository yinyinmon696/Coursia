// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  int? id;
  String? fileName;
  String? filePath;

  ImageModel({this.id, this.fileName, this.filePath});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['file_name'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['file_name'] = fileName;
    data['file_path'] = filePath;
    return data;
  }

  @override
  List<Object?> get props => [id, fileName, filePath];
}
