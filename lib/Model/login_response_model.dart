import 'package:coursia/Model/job_level_model.dart';

class LoginResponseModel {
  bool? success;
  String? message;
  DataResponse? data;

  LoginResponseModel({this.success, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? DataResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataResponse {
  String? token;
  UserInfo? userInfo;
  bool? success;

  DataResponse({this.token, this.userInfo, this.success});

  DataResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    data['success'] = success;
    return data;
  }
}

class UserInfo {
  int? id;
  int? userId;
  int? jobLevelId;
  String? dob;
  String? gender;
  String? phNo;
  String? education;
  String? address;
  int? activeStatus;
  User? user;
  JobLevelModel? jobLevelModel;

  UserInfo(
      {this.id,
      this.userId,
      this.jobLevelId,
      this.dob,
      this.gender,
      this.phNo,
      this.education,
      this.address,
      this.activeStatus,
      this.user,
      this.jobLevelModel});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    jobLevelId = json['job_level_id'];
    dob = json['dob'];
    gender = json['gender'];
    phNo = json['ph_no'];
    education = json['education'];
    address = json['address'];
    activeStatus = json['active_status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    jobLevelModel = json['job_level'] != null
        ? JobLevelModel.fromJson(json['job_level'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['job_level_id'] = jobLevelId;
    data['dob'] = dob;
    data['gender'] = gender;
    data['ph_no'] = phNo;
    data['education'] = education;
    data['address'] = address;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['active_status'] = activeStatus;
    if (jobLevelModel != null) {
      data['job_level'] = jobLevelModel!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? userType;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.userType,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['user_type'] = userType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
