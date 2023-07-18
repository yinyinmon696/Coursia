part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetSelectedDate extends ProfileEvent {
  final String date;
  const GetSelectedDate({required this.date});
}

class GetDropDownValue extends ProfileEvent {
  final dynamic value;

  const GetDropDownValue({required this.value});
}

class UpdateUserProfile extends ProfileEvent {
  final int? userId;
  final int? jobLevelId;
  final String? dob;
  final String? phNo;
  final String? education;
  final String? address;
  final String? gender;

  const UpdateUserProfile(
      {required this.userId,
      required this.jobLevelId,
      required this.dob,
      required this.phNo,
      required this.education,
      required this.address,
      required this.gender});
}

class ChangePassword extends ProfileEvent {
  final String? oldPw;
  final String? newPw;
  const ChangePassword({this.oldPw, this.newPw});
}
