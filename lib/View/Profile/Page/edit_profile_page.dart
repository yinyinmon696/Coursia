// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/Model/gender_model.dart';
import 'package:coursia/Model/job_level_model.dart';
import 'package:coursia/Model/static_data.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_date_picker.dart';
import 'package:coursia/UIDesign/custom_dropdown.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Profile/Page/change_password_page.dart';
import 'package:coursia/View/Profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../Auth/bloc/auth_bloc.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phNoController = TextEditingController();
  final educationController = TextEditingController();
  final addressController = TextEditingController();

  bool obscureText = true;
  final formKey = GlobalKey<FormState>();

  String? date;

  GenderModel? selectedGender;

  List<JobLevelModel> jobLevelList = [];
  List<GenderModel> genderList = [];
  JobLevelModel? jobLevel;

  getGenderList() {
    for (int i = 0; i < StaticData.mapGenderList.length; i++) {
      GenderModel genderModel = GenderModel(
          id: StaticData.mapGenderList[i]['id'],
          name: StaticData.mapGenderList[i]['name']);
      genderList.add(genderModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    emailController.text = StaticData.dataResponse?.userInfo?.user?.email ?? "";
    userNameController.text =
        StaticData.dataResponse?.userInfo?.user?.name ?? "";
    phNoController.text = StaticData.dataResponse?.userInfo?.phNo ?? "";
    educationController.text =
        StaticData.dataResponse?.userInfo?.education ?? "";
    addressController.text = StaticData.dataResponse?.userInfo?.address ?? "";
    if (StaticData.dataResponse?.userInfo?.dob != null) {
      date = StaticData.dataResponse?.userInfo?.dob;
      context.read<ProfileBloc>().add(GetSelectedDate(date: date!));
    } else {
      date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
    getGenderList();
    context.read<AuthBloc>().add(const GetJobLevel());
    return CusotmScaffold(text: 'Edit Profile', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is GetDropDownValueSuccess) {
          if (state.value.isGender == true) {
            selectedGender = state.value;
            // log("Gender${selectedGender?.id}");
          }
          if (state.value.isJobLevel == true) {
            jobLevel = state.value;
            log("Job Level${jobLevel?.id}");
          }
        }
        if (state is UpdateUserProfileSuccess) {
          CustomFunction.flushBar('Update Profile Success', context,
              msgColor: AppTheme.green);

          // Navigator.pop(context);
        }
        if (state is UpdateUserProfileFailed) {
          CustomFunction.flushBar(state.message, context,
              msgColor: AppTheme.red);
        }
      },
      builder: (context, state) {
        if (state is GetDateSuccess) {
          date = state.date;
          // log(date.toString());
        }

        if (state is GetDropDownValueLoading || state is GetDateLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }
        if (state is UpdateUserProfileLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }
        return Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFunction.customSpace(height: 40),
                  Center(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                            width: 120.w,
                            height: 120.h,
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Image.asset('images/boy.png',
                                  width: 100.sp, height: 100.sp),
                            )),
                        Positioned(
                            top: 70.h,
                            left: 80.w,
                            child: const CircleAvatar(
                              backgroundColor: AppTheme.orange,
                              child: Icon(
                                Icons.edit,
                                color: AppTheme.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                  CustomFunction.customSpace(height: 10),
                  Center(
                    child: CustomText(
                      text: StaticData.dataResponse?.userInfo?.user?.name ?? "",
                      textColor: AppTheme.black,
                      size: 17.sp,
                    ),
                  ),
                  CustomFunction.customSpace(height: 10),
                  Center(
                    child: CustomText(
                      text: StaticData
                              .dataResponse?.userInfo?.jobLevelModel?.name ??
                          "",
                      textColor: AppTheme.grey,
                      size: 12.sp,
                    ),
                  ),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                      readonly: true,
                      isProfile: true,
                      controller: emailController,
                      isEmail: true,
                      hintText: '    Email Address'),
                  CustomFunction.customSpace(height: 20),
                  CustomTextFormField(
                      readonly: true,
                      isProfile: true,
                      controller: userNameController,
                      isEmail: false,
                      hintText: '    Username'),
                  CustomFunction.customSpace(height: 20),
                  // CustomTextFormField(
                  //     isProfile: true,
                  //     obscureText: obscureText,
                  //     controller: passwordController,
                  //     isEmail: false,
                  //     hintText: '    Password'),
                  // CustomFunction.customSpace(height: 20),
                  CustomText(
                    text: 'Birth Date (Optional)',
                    textColor: AppTheme.greyDark,
                    size: 12.sp,
                  ),
                  // CustomFunction.customSpace(height: 20),
                  CustomDatePicker(date: date),
                  CustomDropDown(
                    items: genderList,
                    isJobLevel:
                        StaticData.dataResponse?.userInfo?.gender == null
                            ? false
                            : true,
                    hintText:
                        StaticData.dataResponse?.userInfo?.gender ?? 'Gender',
                    isCourses: false,
                    isSignUp: false,
                  ),
                  CustomFunction.customSpace(height: 30),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is GetJobLevelFailed) {
                        CustomFunction.flushBar(state.message, context,
                            msgColor: AppTheme.red);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetJobLevelLoading) {
                        return const Center(
                          child: CustomLoading(),
                        );
                      }
                      if (state is GetJobLevelSuccess) {
                        jobLevelList = state.jobLevelList!;
                      }
                      if (state is GetJobLevelFailed) {
                        return Center(
                          child: Column(
                            children: [
                              // CustomFunction.customSpace(height: 200.h),
                              CustomText(
                                text: state.message,
                                textColor: AppTheme.white,
                              ),
                              // CustomFunction.customSpace(height: 10.h),
                              // CustomButton(
                              //   width: 100.w,
                              //   text: 'Reload',
                              //   onTap: () {
                              //     context
                              //         .read<AuthBloc>()
                              //         .add(const GetJobLevel());
                              //   },
                              // ),
                            ],
                          ),
                        );
                      }
                      return CustomDropDown(
                        items: jobLevelList,
                        isJobLevel:
                            StaticData.dataResponse?.userInfo?.jobLevelModel ==
                                    null
                                ? false
                                : true,
                        hintText: StaticData
                                .dataResponse?.userInfo?.jobLevelModel?.name ??
                            "Job Level",
                        isCourses: false,
                        isSignUp: false,
                      );
                    },
                  ),
                  CustomFunction.customSpace(height: 25),
                  CustomTextFormField(
                      isProfile: true,
                      controller: phNoController,
                      isEmail: false,
                      hintText: StaticData.dataResponse?.userInfo?.phNo == null
                          ? '    Phone Number'
                          : ''),
                  CustomFunction.customSpace(height: 25),
                  CustomTextFormField(
                      isProfile: true,
                      controller: educationController,
                      isEmail: false,
                      hintText:
                          StaticData.dataResponse?.userInfo?.education == null
                              ? '    Education'
                              : ''),
                  CustomFunction.customSpace(height: 25),
                  CustomTextFormField(
                      isProfile: true,
                      controller: addressController,
                      isEmail: false,
                      hintText:
                          StaticData.dataResponse?.userInfo?.address == null
                              ? '    Address'
                              : ''),
                  CustomFunction.customSpace(height: 30),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        CustomFunction.navigatePage(
                            ChangePasswordPage(), context);
                      },
                      child: const CustomText(
                        text: 'Change Password',
                        fontWeight: FontWeight.bold,
                        textColor: AppTheme.orange,
                      ),
                    ),
                  ),
                  CustomFunction.customSpace(height: 40),
                  Center(
                    child: CustomButton(
                      text: 'Save Changes',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // Navigator.of(context).pop();
                          // if (jobLevel == null) {
                          //   context.read<ProfileBloc>().add(UpdateUserProfile(
                          //       userId: StaticData.dataResponse
                          //           ?.userInfo?.user?.id,
                          //       jobLevelId: jobLevel == null
                          //           ? StaticData.dataResponse
                          //               ?.userInfo?.jobLevelModel?.id
                          //           : jobLevel?.id,
                          //       dob: date,
                          //       phNo: phNoController.text,
                          //       education: educationController.text,
                          //       address: addressController.text,
                          //       gender: selectedGender == null
                          //           ? StaticData.dataResponse
                          //               ?.userInfo!.gender
                          //           : selectedGender?.name));
                          // }
                          if (selectedGender == null &&
                              StaticData.dataResponse?.userInfo?.gender ==
                                  null) {
                            CustomFunction.flushBar(
                                'Please select your gender!', context,
                                msgColor: AppTheme.red);
                          } else {
                            context.read<ProfileBloc>().add(UpdateUserProfile(
                                userId:
                                    StaticData.dataResponse?.userInfo?.user?.id,
                                jobLevelId: jobLevel == null
                                    ? StaticData.dataResponse?.userInfo
                                        ?.jobLevelModel?.id
                                    : jobLevel?.id,
                                dob: date,
                                phNo: phNoController.text,
                                education: educationController.text,
                                address: addressController.text,
                                gender: selectedGender == null
                                    ? StaticData.dataResponse?.userInfo!.gender
                                    : selectedGender?.name));
                          }
                        }
                        // log(date.toString());
                        // log(selectedGender.toString());
                      },
                      width: 140.w,
                      height: 35.h,
                      borderRadius: 25.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
