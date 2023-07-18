// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Auth/bloc/auth_bloc.dart';
import 'package:coursia/View/Profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  final oldPwController = TextEditingController();
  final newPwController = TextEditingController();
  final newConfirmPwController = TextEditingController();
  bool obscuretext = true;
  bool obscuretext1 = true;
  bool obscuretext2 = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Change Password', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordFailed) {
            CustomFunction.flushBar(state.message, context,
                msgColor: AppTheme.red);
          }
        },
        builder: (context, state) {
          if (state is ChangePasswordLoading) {
            return const Center(
              child: CustomLoading(),
            );
          }
          if (state is ChangePasswordSuccess) {
            // Navigator.pop(context);
            CustomFunction.flushBar('Change Password Success!', context,
                msgColor: AppTheme.green);
          }
          return Padding(
            padding: const EdgeInsets.all(15.0).w,
            child: SingleChildScrollView(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is VisibilityOnOffSuccess) {
                    obscuretext = state.obscureText!;
                  }
                  if (state is VisibilityOnOff1Success) {
                    obscuretext1 = state.obscureText1!;
                  }
                  if (state is VisibilityOnOff2Success) {
                    obscuretext2 = state.obscureText2!;
                  }
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFunction.customSpace(height: 20),
                        CustomTextFormField(
                          isProfile: true,
                          controller: oldPwController,
                          isEmail: false,
                          hintText: 'Current Password',
                          obscureText: obscuretext,
                          suffixIcon: IconButton(
                            icon: obscuretext
                                ? const Icon(Icons.visibility_off,
                                    color: AppTheme.grey)
                                : const Icon(Icons.visibility,
                                    color: AppTheme.orange),
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(VisibilityOnOffEvent(!obscuretext));
                              // toggle();
                            },
                          ),
                        ),
                        CustomFunction.customSpace(height: 20),
                        CustomTextFormField(
                          isProfile: true,
                          controller: newPwController,
                          isEmail: false,
                          hintText: 'New Password',
                          obscureText: obscuretext1,
                          suffixIcon: IconButton(
                            icon: obscuretext1
                                ? const Icon(Icons.visibility_off,
                                    color: AppTheme.grey)
                                : const Icon(Icons.visibility,
                                    color: AppTheme.orange),
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(VisibilityOnOff1Event(!obscuretext1));
                              // toggle();
                            },
                          ),
                        ),
                        CustomFunction.customSpace(height: 20),
                        CustomTextFormField(
                          isProfile: true,
                          controller: newConfirmPwController,
                          isEmail: false,
                          hintText: 'New Confirm Password',
                          obscureText: obscuretext2,
                          suffixIcon: IconButton(
                            icon: obscuretext2
                                ? const Icon(Icons.visibility_off,
                                    color: AppTheme.grey)
                                : const Icon(Icons.visibility,
                                    color: AppTheme.orange),
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(VisibilityOnOff2Event(!obscuretext2));
                              // toggle();
                            },
                          ),
                        ),
                        CustomFunction.customSpace(height: 50),
                        Center(
                          child: CustomButton(
                            text: 'Submit',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (newPwController.text ==
                                    newConfirmPwController.text) {
                                  context.read<ProfileBloc>().add(
                                      ChangePassword(
                                          oldPw: oldPwController.text,
                                          newPw: newConfirmPwController.text));
                                } else {
                                  CustomFunction.flushBar(
                                      'New Password and Confirm New Password do not match!',
                                      context,
                                      msgColor: AppTheme.red);
                                }
                              }
                            },
                            width: 140.w,
                            height: 35.h,
                            borderRadius: 25.r,
                          ),
                        ),
                      ]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
