// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CompetencyTypeModel extends Equatable {
  int? id;
  String? name;

  CompetencyTypeModel({this.id, this.name});

  CompetencyTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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
