// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:coursia/Model/account_register_model.dart';
import 'package:coursia/Model/blog_model.dart';
import 'package:coursia/Model/blog_type_model.dart';
import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Model/courses_model.dart';
import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/disc_type_model.dart';
import 'package:coursia/Model/email_verify_response_model.dart';
import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/Model/iq_type_model.dart';
import 'package:coursia/Model/job_level_model.dart';
import 'package:coursia/Model/login_response_model.dart';
import 'package:coursia/Model/otp_verify_response_model.dart';
import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/Model/reset_password_response_model.dart';
import 'package:coursia/Model/static_data.dart';
import 'package:coursia/Model/subcategory_model.dart';
import 'package:coursia/Repository/dio_error.dart';
import 'package:coursia/Repository/get_storage.dart';
import 'package:coursia/Utils/api_service.dart';
import 'package:coursia/Utils/customexception.dart';
import 'package:dio/dio.dart';

class CoursiaApiClient {
  final _dio = Dio();

  CoursiaApiClient() {
    _dio.options.baseUrl = APIService.API_URL;

    _dio.options.connectTimeout = const Duration(seconds: 20000);
    _dio.options.receiveTimeout = const Duration(seconds: 20000);
    _dio.options.sendTimeout = const Duration(seconds: 20000);

    // _dio.options.headers['Content-Type'] = '*/*';
    _dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    _dio.options.headers['Accept'] = 'application/json; charset=UTF-8';
    _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true, request: true));
    init();
  }

  init() async {
    var token = StaticData.dataResponse?.token;
    // log("LoginToken - $token");
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<List<DISCTypeModel>> getDISCTypeList() async {
    try {
      init();
      final response = await _dio.get('frontend/v1/disc_type');
      if (response.statusCode == 200) {
        final discTypeList = response.data['data'] as List;
        return discTypeList
            .map((item) => DISCTypeModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<List<IQTypeModel>> getIQTypeList() async {
    try {
      init();
      final response = await _dio.get('frontend/v1/iq_type');
      if (response.statusCode == 200) {
        final iqTypeList = response.data['data'] as List;
        return iqTypeList.map((item) => IQTypeModel.fromJson(item)).toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<List<CompetencyTypeModel>> getCompetencyTypeList() async {
    try {
      init();
      final response = await _dio.get('frontend/v1/competency_type');
      if (response.statusCode == 200) {
        final competencyTypeList = response.data['data'] as List;
        return competencyTypeList
            .map((item) => CompetencyTypeModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<List<QuizTypeModel>> getQuizTypeList() async {
    try {
      init();
      final response = await _dio.get(
          'frontend/v1/quiz_type?user_id=${StaticData.dataResponse?.userInfo?.userId}');
      if (response.statusCode == 200) {
        final quizTypeList = response.data['data'] as List;
        return quizTypeList
            .map((item) => QuizTypeModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<DISCQuestionModel> getDISCQuestionList() async {
    try {
      init();

      final response = await _dio.get(
          'frontend/v1/disc_question?user_id=${StaticData.dataResponse?.userInfo?.userId}');
      if (response.statusCode == 200) {
        return DISCQuestionModel.fromJson(response.data['data']);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<IQQuestionModel> getIQQuestionList() async {
    try {
      init();
      final response = await _dio.get(
          'frontend/v1/iq_test?user_id=${StaticData.dataResponse?.userInfo?.userId}');
      if (response.statusCode == 200) {
        return IQQuestionModel.fromJson(response.data['data']);
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<CompetencyQuestionModel> getCompetencyQuestionList() async {
    try {
      init();
      final response = await _dio.get(
          'frontend/v1/competency_question?user_id=${StaticData.dataResponse?.userInfo?.userId}');
      if (response.statusCode == 200) {
        return CompetencyQuestionModel.fromJson(response.data['data']);
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<QuizQuestionModel> getQuizQuestionList(int? quizTypeId) async {
    try {
      init();
      final response = await _dio.get(
          'frontend/v1/quiz_test/?user_id=${StaticData.dataResponse?.userInfo?.userId}&quiz_type_id=$quizTypeId');
      if (response.statusCode == 200) {
        return QuizQuestionModel.fromJson(response.data['data']);
      }

      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<List<JobLevelModel>> getJobLevelList() async {
    try {
      init();
      final response = await _dio.get('frontend/v1/joblevel');
      if (response.statusCode == 200) {
        final jobLevelList = response.data['data'] as List;
        return jobLevelList
            .map((item) => JobLevelModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<EmailVerifyResponseModel> emailVerification(
      String? userName, String? email) async {
    try {
      final data = FormData.fromMap({"name": userName, "email": email});
      final response =
          await _dio.post('frontend/v1/email-verification', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return EmailVerifyResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return EmailVerifyResponseModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<OTPVerifyResponseModel> sendOTP(
      String? userName, String? email, String? otp) async {
    try {
      final data =
          FormData.fromMap({"otp": otp, "name": userName, "email": email});
      final response = await _dio.post('frontend/v1/checkotp', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return OTPVerifyResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return OTPVerifyResponseModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<RegisterAccountModel> registerAccount(String? name, String? email,
      String? password, String? confirmPassword, int? joblevel) async {
    try {
      final data = FormData.fromMap({
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "job_level_id": joblevel
      });
      final response = await _dio.post('frontend/v1/register', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return RegisterAccountModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return RegisterAccountModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<EmailVerifyResponseModel> emailVerificationFromForget(
      String? email) async {
    try {
      final data = FormData.fromMap({"email": email});
      final response = await _dio
          .post('frontend/v1/forget_password_email_verificaion', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return EmailVerifyResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return EmailVerifyResponseModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<OTPVerifyResponseModel> sendOTPFromForget(
      String? email, String? otp) async {
    try {
      final data = FormData.fromMap({"email": email, "otp": otp});
      final response =
          await _dio.post('frontend/v1/forget_password_check_otp', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return OTPVerifyResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return OTPVerifyResponseModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<ResetPasswordResponseModel> resetPassword(
      String? email, String? password, String? confirmPassword) async {
    try {
      final data = FormData.fromMap({
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword
      });
      final response =
          await _dio.post('frontend/v1/reset_password', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return ResetPasswordResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return ResetPasswordResponseModel.fromJson(response.data);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<LoginResponseModel> login(String? email, String? password) async {
    try {
      final data = FormData.fromMap({"email": email, "password": password});
      final response = await _dio.post('frontend/v1/login', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        // var box = Hive.box("library_db");
        // box.put("user", response.data);
        // StaticData.loginResponseModel =
        //     LoginResponseModel.fromJson(response.data);
        // log("MyToken - ${StaticData.dataResponse?.token}");
        ///To retrieve data from box

        // final userData = await box.get('user');
        // log('Token - ${userData?['data']['token']}');
        // _dio.options.headers['Authorization'] =
        //     'Bearer ${userData?['data']['token']}';
        await GetStorages.setData(
            key: GetStorages.userToken, value: response.data['data']['token']);

        await GetStorages.getData(key: GetStorages.userToken).then(
            (value) => _dio.options.headers['Authorization'] = 'Bearer $value');

        await GetStorages.setData(
            key: GetStorages.user, value: jsonEncode(response.data['data']));
        await GetStorages.getData(key: GetStorages.user).then(
          (value) {
            if (value != 'null') {
              DataResponse dataResponse = DataResponse();
              dataResponse = DataResponse.fromJson(jsonDecode(value));
              StaticData.dataResponse = dataResponse;
            }
          },
        );
        return LoginResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return LoginResponseModel.fromJson(response.data);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<DISCResult> sendDISCAnswerList(
      DISCQuestionModel discQuestionModel) async {
    try {
      init();
      final data = jsonEncode(discQuestionModel.sendDISCResult());
      final response =
          await _dio.post('frontend/v1/send_disc_answer', data: data);
      if (response.statusCode == 200) {
        return DISCResult.fromJson(response.data['data']);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<List<SubCategoryModel>> getSubCategoryList(String? mainSubName) async {
    try {
      init();
      final data = FormData.fromMap({"main_category_name": mainSubName});
      final response =
          await _dio.post('frontend/v1/get_course_subcategory', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        final subCategoryList = response.data['data'] as List;
        return subCategoryList
            .map((item) => SubCategoryModel.fromJson(item))
            .toList();
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<List<CoursesModel>> getCoursesList(
      String? mainCategoryName, int? topic, int? cost, String? level) async {
    try {
      init();
      final data = FormData.fromMap({
        "main_category_name": mainCategoryName,
        "topic": topic,
        "cost": cost,
        "level": level
      });
      final response = await _dio.post('frontend/v1/get_courses', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        final coursesList = response.data['data'] as List;
        return coursesList.map((item) => CoursesModel.fromJson(item)).toList();
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<UserInfo> updateUserProfile(int? userId, int? jobLevelId, String? dob,
      String? phNo, String? education, String? address, String? gender) async {
    try {
      init();
      final data = FormData.fromMap({
        "user_id": userId,
        "job_level_id": jobLevelId,
        "dob": dob,
        "phone_number": phNo,
        "education": education,
        "address": address,
        "gender": gender,
      });
      final response =
          await _dio.post('frontend/v1/fill_user_information', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        StaticData.dataResponse?.userInfo =
            UserInfo.fromJson(response.data['data']);
        return UserInfo.fromJson(response.data['data']);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<void> changePassword(String? oldPw, String? newPw) async {
    try {
      init();
      final data = FormData.fromMap({
        "user_id": StaticData.dataResponse?.userInfo?.userId,
        "old_password": oldPw,
        "new_password": newPw
      });
      final response =
          await _dio.post('frontend/v1/change_password', data: data);
      if (response.data['success'] == false) {
        throw CustomException(response.data['message']);
      }
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<IQResult> sendIQAnswerList(IQQuestionModel iqQuestionModel) async {
    try {
      init();
      final data = jsonEncode(iqQuestionModel.sendIQResult());
      final response =
          await _dio.post('frontend/v1/send_iq_answer', data: data);
      if (response.statusCode == 200) {
        return IQResult.fromJson(response.data['data']);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<CompetencyResult> sendCompetencyAnswerList(
      CompetencyQuestionModel competencyQuestionModel) async {
    try {
      init();
      final data = jsonEncode(competencyQuestionModel.sendCompetencyResult());
      final response =
          await _dio.post('frontend/v1/send_competency_answer', data: data);
      if (response.statusCode == 200) {
        return CompetencyResult.fromJson(response.data['data']);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<QuizResult> sendQuizAnswerList(
      QuizQuestionModel quizQuestionModel) async {
    try {
      init();
      final data = jsonEncode(quizQuestionModel.sendQuizResult());
      final response =
          await _dio.post('frontend/v1/send_quiz_answer', data: data);
      if (response.statusCode == 200) {
        return QuizResult.fromJson(response.data['data']);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<List<BlogTypeModel>> getBlogTypeList() async {
    try {
      final response = await _dio.get('frontend/v1/blog_type');
      if (response.statusCode == 200) {
        final blogTypeList = response.data['data'] as List;
        return blogTypeList
            .map((item) => BlogTypeModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }

  Future<List<BlogModel>> getBlogList(int? blogTypeId) async {
    try {
      final response =
          await _dio.get('frontend/v1/blog?blog_type_id=$blogTypeId');
      if (response.statusCode == 200) {
        final blogList = response.data['data'] as List;
        return blogList.map((item) => BlogModel.fromJson(item)).toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (dioError) {
      throw DioErrorModel.dioErrorType(dioError);
    }
  }
}
