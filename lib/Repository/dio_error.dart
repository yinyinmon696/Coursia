import 'package:coursia/Utils/customexception.dart';
import 'package:dio/dio.dart';

class DioErrorModel {
  static dioErrorType(DioError dioError) {
    if (dioError.type == DioErrorType.cancel) {
      throw CustomException("Request to API server was cancelled");
    } else if (dioError.type == DioErrorType.receiveTimeout) {
      throw CustomException(
          "Receiving time out! Please check your network connection.");
    } else if (dioError.type == DioErrorType.sendTimeout) {
      throw CustomException(
          "Sending time out! Please check your network connection.");
    } else if (dioError.type == DioErrorType.connectionTimeout) {
      throw CustomException(
          "Connecting time out! Please check your network connection.");
    } else if (dioError.type == DioErrorType.badCertificate) {
      throw CustomException("Caused by an incorrect certificate.");
    } else if (dioError.type == DioErrorType.badResponse) {
      throw CustomException(
          "Received invalid status: ${dioError.response?.statusMessage} (${dioError.response?.statusCode})");
    } else if (dioError.type == DioErrorType.connectionError) {
      throw CustomException("Caused by SocketExceptions.");
    } else if (dioError.type == DioErrorType.unknown) {
      throw CustomException("Cannot connect to server!");
    } else {
      throw CustomException();
    }
  }
}
