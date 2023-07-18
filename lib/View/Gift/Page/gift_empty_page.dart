// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftEmptyPage extends StatelessWidget {
  const GiftEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(15.0).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
              text: 'Empty Promo Code!', textColor: AppTheme.black),
          CustomFunction.customSpace(height: 50.h),
          Center(
            child: Image.asset(
              'images/emptygift.png',
              // width: 150.w,
              height: 200.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    )));
  }
}
