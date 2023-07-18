// ignore_for_file: file_names

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/View/Auth/Page/verify_OTP_page.dart';
import 'package:coursia/View/Auth/bloc/auth_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpEmailPage extends StatelessWidget {
  SignUpEmailPage({super.key});
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.black),
      backgroundColor: AppTheme.black,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is EmailVerificationSuccess) {
            if (state.emailVerifyResponseModel!.success == true) {
              CustomFunction.navigatePage(
                  VerifyOTPPage(
                    isFromForget: false,
                    userName: usernameController.text,
                    email: emailController.text,
                  ),
                  context);
            }
            if (state.emailVerifyResponseModel!.success == false) {
              CustomFunction.flushBar(
                  state.emailVerifyResponseModel!.message, context,
                  msgColor: AppTheme.red);
            }
          }
          if (state is EmailVerificationFailed) {
            CustomFunction.flushBar(state.message, context,
                msgColor: AppTheme.red);
          }
        },
        builder: (context, state) {
          if (state is EmailVerificationLoading) {
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
                    text: 'Sign Up\nwith your email\naddress',
                    size: 30,
                  ),
                  CustomFunction.customSpace(height: 30),
                  const CustomText(
                    text: 'Enter email to register your account.',
                    size: 12,
                    textColor: AppTheme.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomFunction.customSpace(height: 30),
                  const CustomText(
                      textAlign: TextAlign.left, text: 'User Name'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    isProfile: false,
                    controller: usernameController,
                    hintText: 'User Name',
                    textColor: AppTheme.white,
                    isEmail: false,
                  ),
                  CustomFunction.customSpace(height: 15),
                  const CustomText(textAlign: TextAlign.left, text: 'Email'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    isProfile: false,
                    controller: emailController,
                    hintText: 'Email',
                    textColor: AppTheme.white,
                    isEmail: true,
                  ),
                  CustomFunction.customSpace(height: 30),
                  CustomButton(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        // CustomFunction.navigatePage(VerifyOTPPage(), context);
                        if (formKey.currentState!.validate()) {
                          if (EmailValidator.validate(emailController.text)) {
                            context.read<AuthBloc>().add(EmailVerification(
                                name: usernameController.text,
                                email: emailController.text));
                          } else {
                            CustomFunction.flushBar(
                                'Your email address is wrong!', context,
                                msgColor: AppTheme.red);
                          }
                        }
                      },
                      text: 'Request OTP'),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
