class RegisterAccountModel {
  bool? success;
  String? message;
  Data? data;

  RegisterAccountModel({this.success, this.message, this.data});

  RegisterAccountModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? name;
  String? email;
  String? userType;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
      this.email,
      this.userType,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    userType = json['user_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['user_type'] = userType;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
