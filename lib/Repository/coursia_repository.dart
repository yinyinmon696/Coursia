import 'package:coursia/Model/account_register_model.dart';
import 'package:coursia/Model/blog_model.dart';
import 'package:coursia/Model/blog_type_model.dart';
import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Model/courses_model.dart';
import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/disc_type_model.dart';
import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/Model/iq_type_model.dart';
import 'package:coursia/Model/job_level_model.dart';
import 'package:coursia/Model/login_response_model.dart';
import 'package:coursia/Model/otp_verify_response_model.dart';
import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/Model/email_verify_response_model.dart';
import 'package:coursia/Model/reset_password_response_model.dart';
import 'package:coursia/Model/subcategory_model.dart';
import 'package:coursia/Repository/coursia_api_client.dart';

class CoursiaRepository {
  CoursiaApiClient coursiaApiClient = CoursiaApiClient();

  Future<List<DISCTypeModel>> getDISCTypeList() async {
    return await coursiaApiClient.getDISCTypeList();
  }

  Future<List<IQTypeModel>> getIQTypeList() async {
    return await coursiaApiClient.getIQTypeList();
  }

  Future<List<CompetencyTypeModel>> getCompetencyTypeList() async {
    return await coursiaApiClient.getCompetencyTypeList();
  }

  Future<List<QuizTypeModel>> getQuizTypeList() async {
    return await coursiaApiClient.getQuizTypeList();
  }

  Future<DISCQuestionModel> getDISCQuestionList() async {
    return await coursiaApiClient.getDISCQuestionList();
  }

  Future<IQQuestionModel> getIQQuestionList() async {
    return await coursiaApiClient.getIQQuestionList();
  }

  Future<CompetencyQuestionModel> getCompetencyQuestionList() async {
    return await coursiaApiClient.getCompetencyQuestionList();
  }

  Future<QuizQuestionModel> getQuizQuestionList(int? quizTypeId) async {
    return await coursiaApiClient.getQuizQuestionList(quizTypeId);
  }

  Future<List<JobLevelModel>> getJobLevelList() async {
    return await coursiaApiClient.getJobLevelList();
  }

  Future<EmailVerifyResponseModel> emailVerification(
      String? userName, String? email) async {
    return await coursiaApiClient.emailVerification(userName, email);
  }

  Future<OTPVerifyResponseModel> sendOTP(
      String? userName, String? email, String? otp) async {
    return await coursiaApiClient.sendOTP(userName, email, otp);
  }

  Future<RegisterAccountModel> registerAccount(String? name, String? email,
      String? password, String? confirmPassword, int? joblevel) async {
    return await coursiaApiClient.registerAccount(
        name, email, password, confirmPassword, joblevel);
  }

  Future<EmailVerifyResponseModel> emailVerificationFromForget(
      String? email) async {
    return await coursiaApiClient.emailVerificationFromForget(email);
  }

  Future<OTPVerifyResponseModel> sendOTPFromForget(
      String? email, String? otp) async {
    return await coursiaApiClient.sendOTPFromForget(email, otp);
  }

  Future<ResetPasswordResponseModel> resetPassword(
      String? email, String? password, String? confirmPassword) async {
    return await coursiaApiClient.resetPassword(
        email, password, confirmPassword);
  }

  Future<LoginResponseModel> login(String? email, String? password) async {
    return await coursiaApiClient.login(email, password);
  }

  Future<DISCResult> sendDISCAnswerList(
      DISCQuestionModel discQuestionModel) async {
    return await coursiaApiClient.sendDISCAnswerList(discQuestionModel);
  }

  Future<List<SubCategoryModel>> getSubCategoryList(String? mainSubName) async {
    return await coursiaApiClient.getSubCategoryList(mainSubName);
  }

  Future<List<CoursesModel>> getCoursesList(
      String? mainCategoryName, int? topic, int? cost, String? level) async {
    return await coursiaApiClient.getCoursesList(
        mainCategoryName, topic, cost, level);
  }

  Future<UserInfo> updateUserProfile(int? userId, int? jobLevelId, String? dob,
      String? phNo, String? education, String? address, String? gender) async {
    return await coursiaApiClient.updateUserProfile(
        userId, jobLevelId, dob, phNo, education, address, gender);
  }

  Future<void> changePassword(String? oldPw, String? newPw) async {
    return await coursiaApiClient.changePassword(oldPw, newPw);
  }

  Future<IQResult> sendIQAnswerList(IQQuestionModel iqQuestionModel) async {
    return await coursiaApiClient.sendIQAnswerList(iqQuestionModel);
  }

  Future<CompetencyResult> sendCompetencyAnswerList(
      CompetencyQuestionModel competencyQuestionModel) async {
    return await coursiaApiClient
        .sendCompetencyAnswerList(competencyQuestionModel);
  }

  Future<QuizResult> sendQuizAnswerList(
      QuizQuestionModel quizQuestionModel) async {
    return await coursiaApiClient.sendQuizAnswerList(quizQuestionModel);
  }

  Future<List<BlogTypeModel>> getBlogTypeList() async {
    return await coursiaApiClient.getBlogTypeList();
  }

  Future<List<BlogModel>> getBlogList(int? blogTypeId) async {
    return await coursiaApiClient.getBlogList(blogTypeId);
  }
}
