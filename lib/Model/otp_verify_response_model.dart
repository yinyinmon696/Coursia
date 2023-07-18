class OTPVerifyResponseModel {
  bool? success;
  String? message;
  Data? data;

  OTPVerifyResponseModel({this.success, this.message, this.data});

  OTPVerifyResponseModel.fromJson(Map<String, dynamic> json) {
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
  bool? success;

  Data({this.name, this.email, this.success});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['success'] = success;
    return data;
  }
}
