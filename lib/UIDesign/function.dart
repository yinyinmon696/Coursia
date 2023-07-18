import 'package:another_flushbar/flushbar.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFunction {
  static navigatePage(Widget? page, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
  }

  static customSpace({double? width, double? height}) {
    return SizedBox(height: height?.h ?? 0, width: width?.w ?? 0);
  }

  static flushBar(String? message, BuildContext context,
      {Color? msgColor = AppTheme.black, Color? bgColor = AppTheme.white}) {
    Future.delayed(Duration.zero, () {
      return Flushbar(
        messageColor: msgColor ?? AppTheme.black,
        backgroundColor: bgColor ?? AppTheme.white,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        //title: title,
        message: message,
      )..show(context);
    });
  }

  static customBody(BuildContext context,
      {bool? isProfile, Widget? columnData}) {
    return Stack(
      children: [
        Container(height: 1000.h, color: AppTheme.black),
        Positioned(
          top: isProfile! ? 35.h : 10.h,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.r))),
            child: columnData,
          ),
        ),
        isProfile
            ? Positioned.fill(
                top: 10.h,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/boy.png',
                      width: 60.sp, height: 60.sp),
                ))
            : Container(),
      ],
    );
  }

  static assetImage({String? image, double? height, double? width}) {
    return Image.asset(
      image!,
      width: width ?? 150.w,
      height: height ?? 30.h,
      fit: BoxFit.fill,
    );
  }
}
