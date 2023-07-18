import 'package:coursia/View//Auth/Page/login_page.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/View/Auth/bloc/auth_bloc.dart';
import 'package:coursia/View/Home/Page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const CheckLogin());

    return Scaffold(
      backgroundColor: AppTheme.black,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is CheckLoginSuccess) {
            if (state.isLogin == true) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset(
                'images/CoursiaLogo.png',
                height: 50.h,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          color: AppTheme.black,
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: CustomButton(
                    text: 'Get Started',
                    onTap: () {
                      // CustomFunction.navigatePage(LoginPage(), context);
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
