// ignore_for_file: file_names, must_be_immutable

import 'dart:developer';

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/View/Auth/Page/login_page.dart';
import 'package:coursia/View/Auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordPage extends StatelessWidget {
  String? email;
  ResetPasswordPage({super.key, required this.email});

  final formKey = GlobalKey<FormState>();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();
  bool obscuretext = true;
  bool obscuretext1 = true;

  @override
  Widget build(BuildContext context) {
    log(email.toString());
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.black),
      backgroundColor: AppTheme.black,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            // CustomFunction.navigatePage(LoginPage(), context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                ModalRoute.withName("/Login"));
          }
          if (state is ResetPasswordFailed) {
            CustomFunction.flushBar(state.message, context,
                msgColor: AppTheme.red);
          }
        },
        builder: (context, state) {
          if (state is VisibilityOnOffSuccess) {
            obscuretext = state.obscureText!;
          }
          if (state is VisibilityOnOff1Success) {
            obscuretext1 = state.obscureText1!;
          }
          if (state is ResetPasswordLoading) {
            return const Center(
              child: CustomLoading(),
            );
          }
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15).w,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: CoursiaTopImage()),
                  CustomFunction.customSpace(height: 80),
                  const CustomText(
                    textAlign: TextAlign.left,
                    text: 'Reset\nPasscode?',
                    size: 30,
                  ),
                  CustomFunction.customSpace(height: 30),
                  const CustomText(
                    text: 'Enter new passcode.',
                    size: 12,
                    textColor: AppTheme.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomFunction.customSpace(height: 30),
                  const CustomText(textAlign: TextAlign.left, text: 'Passcode'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    isProfile: false,
                    controller: pwController,
                    obscureText: obscuretext,
                    isEmail: false,
                    hintText: 'Passcode',
                    textColor: AppTheme.white,
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
                  CustomFunction.customSpace(height: 15),
                  const CustomText(
                      textAlign: TextAlign.left, text: 'Confirm Passcode'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    isProfile: false,
                    controller: confirmPwController,
                    obscureText: obscuretext1,
                    isEmail: false,
                    hintText: 'Confirm Passcode',
                    textColor: AppTheme.white,
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
                      },
                    ),
                  ),
                  CustomFunction.customSpace(height: 30),
                  CustomButton(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (formKey.currentState!.validate()) {
                          if (pwController.text == confirmPwController.text) {
                            // CustomFunction.navigatePage(
                            //     const SignUpPage(), context);
                            context.read<AuthBloc>().add(ResetPassword(
                                email: email,
                                password: pwController.text,
                                confirmPassword: confirmPwController.text));
                          } else {
                            CustomFunction.flushBar(
                                'Your password and confirm password are not match!',
                                context,
                                msgColor: AppTheme.red);
                          }
                        }
                      },
                      text: 'Confirm'),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
