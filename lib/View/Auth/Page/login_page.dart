// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/View/Auth/Page/forget_password_page.dart';
import 'package:coursia/View//Home/Page/home_page.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/View/Auth/Page/sign_up_email_page.dart';
import 'package:coursia/View/Auth/bloc/auth_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final pwController = TextEditingController();
  bool obscuretext = true;
  final formKey = GlobalKey<FormState>();
  String? token;

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  getToken() async {
    FirebaseMessaging.instance.getToken().then((value) => token = value);

    // FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }

  @override
  Widget build(BuildContext context) {
    emailController.text = 'yinyinmon517@gmail.com';
    pwController.text = 'yinmon';
    FocusManager.instance.primaryFocus?.unfocus();
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.black),
      backgroundColor: AppTheme.black,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            if (state.loginResponseModel?.success == true) {
              // CustomFunction.navigatePage(HomePage(), context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
            if (state.loginResponseModel?.success == false) {
              CustomFunction.flushBar(
                  state.loginResponseModel?.message, context,
                  msgColor: AppTheme.red);
            }
          }
          if (state is LoginFailed) {
            CustomFunction.flushBar(state.message, context,
                msgColor: AppTheme.red);
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
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
                    text: 'Login',
                    size: 30,
                  ),
                  CustomFunction.customSpace(height: 30),
                  const CustomText(textAlign: TextAlign.left, text: 'Email'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                    textColor: AppTheme.white,
                    isEmail: true,
                    isProfile: false,
                  ),
                  CustomFunction.customSpace(height: 15),
                  const CustomText(textAlign: TextAlign.left, text: 'Passcode'),
                  CustomFunction.customSpace(height: 10),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is VisibilityOnOffSuccess) {
                        obscuretext = state.obscureText!;
                      }
                      return CustomTextFormField(
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
                      );
                    },
                  ),
                  CustomFunction.customSpace(height: 15),
                  InkWell(
                    onTap: () {
                      CustomFunction.navigatePage(
                          ForgetPasswordPage(), context);
                    },
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(text: 'Forget Passcode?', size: 12)),
                  ),
                  CustomFunction.customSpace(height: 15),
                  CustomButton(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        // CustomFunction.navigatePage(HomePage(), context);
                        if (formKey.currentState!.validate()) {
                          if (EmailValidator.validate(emailController.text)) {
                            context.read<AuthBloc>().add(Login(
                                email: emailController.text,
                                password: pwController.text));
                          } else {
                            CustomFunction.flushBar(
                                'Your email address is wrong!', context,
                                msgColor: AppTheme.red);
                          }
                        }
                      },
                      text: 'Log in'),
                  CustomFunction.customSpace(height: 15),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                            text: 'Don\'t have an account?',
                            size: 12,
                            textColor: AppTheme.grey),
                        InkWell(
                          onTap: () {
                            // CustomFunction.navigatePage(
                            //     SignUpPage(
                            //       name: 'Ym',
                            //       email: 'yinyinmon6@gmail.com',
                            //     ),
                            //     context);
                            CustomFunction.navigatePage(
                                SignUpEmailPage(), context);
                          },
                          child: const CustomText(
                              text: ' Sign Up',
                              size: 14,
                              textColor: AppTheme.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
