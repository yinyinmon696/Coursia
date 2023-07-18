part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class GetDateLoading extends ProfileState {}

class GetDateSuccess extends ProfileState {
  final String date;
  const GetDateSuccess({required this.date});

  @override
  List<Object> get props => [date];
}

class GetDropDownValueLoading extends ProfileState {}

class GetDropDownValueSuccess extends ProfileState {
  final dynamic value;

  const GetDropDownValueSuccess({required this.value});

  @override
  List<Object> get props => [value];
}

class UpdateUserProfileLoading extends ProfileState {}

class UpdateUserProfileSuccess extends ProfileState {
  final UserInfo userProfileModel;
  const UpdateUserProfileSuccess({required this.userProfileModel});

  @override
  List<Object> get props => [userProfileModel];
}

class UpdateUserProfileFailed extends ProfileState {
  final String? message;
  const UpdateUserProfileFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class ChangePasswordLoading extends ProfileState {}

class ChangePasswordSuccess extends ProfileState {
  const ChangePasswordSuccess();

  @override
  List<Object> get props => [];
}

class ChangePasswordFailed extends ProfileState {
  final String? message;
  const ChangePasswordFailed(this.message);

  @override
  List<Object> get props => [message!];
}
