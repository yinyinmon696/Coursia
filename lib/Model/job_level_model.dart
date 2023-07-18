// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class JobLevelModel extends Equatable {
  int? id;
  String? name;
  bool? isGender;
  bool? isJobLevel;
  bool? isTopic;
  bool? isCost;
  bool? isUserLevel;

  JobLevelModel(
      {this.id,
      this.name,
      this.isGender = false,
      this.isJobLevel = true,
      this.isTopic = false,
      this.isCost = false,
      this.isUserLevel = false});

  JobLevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isGender = false;
    isJobLevel = true;
    isTopic = false;
    isCost = false;
    isUserLevel = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [id, name];
}
