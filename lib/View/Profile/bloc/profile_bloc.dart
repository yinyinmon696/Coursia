import 'package:coursia/Model/login_response_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  ProfileBloc() : super(ProfileInitial()) {
    on<GetSelectedDate>(_getSelectedDate);
    on<GetDropDownValue>(_getDropDownValue);
    on<UpdateUserProfile>(_updateUserProfile);
    on<ChangePassword>(_changePassword);
  }

  _getSelectedDate(GetSelectedDate event, Emitter<ProfileState> emit) async {
    emit(GetDateLoading());
    emit(GetDateSuccess(date: event.date));
  }

  _getDropDownValue(GetDropDownValue event, Emitter<ProfileState> emit) async {
    emit(GetDropDownValueLoading());
    emit(GetDropDownValueSuccess(value: event.value));
  }

  _updateUserProfile(
      UpdateUserProfile event, Emitter<ProfileState> emit) async {
    emit(UpdateUserProfileLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const UpdateUserProfileFailed("No Network Connection!"));
    } else {
      try {
        UserInfo userProfileModel;
        userProfileModel = await coursiaRepository.updateUserProfile(
            event.userId,
            event.jobLevelId,
            event.dob,
            event.phNo,
            event.education,
            event.address,
            event.gender);
        emit(UpdateUserProfileSuccess(userProfileModel: userProfileModel));
      } catch (e) {
        emit(UpdateUserProfileFailed(e.toString()));
      }
    }
  }

  _changePassword(ChangePassword event, Emitter<ProfileState> emit) async {
    emit(ChangePasswordLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const ChangePasswordFailed("No Network Connection!"));
    } else {
      try {
        await coursiaRepository.changePassword(event.oldPw, event.newPw);
        emit(const ChangePasswordSuccess());
      } catch (e) {
        emit(ChangePasswordFailed(e.toString()));
      }
    }
  }
}
