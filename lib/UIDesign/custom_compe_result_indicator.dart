// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomCompeResultIndicator extends StatelessWidget {
  final String? text;
  final String? percentText;
  final Color? indicatorColor;
  final double? percent;
  CustomCompeResultIndicator(
      {super.key,
      this.text,
      this.percentText,
      this.indicatorColor,
      this.percent});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 143.w,
          child: CustomText(
            text: text,
            textColor: AppTheme.black,
            textAlign: TextAlign.left,
          ),
        ),
        LinearPercentIndicator(
          animationDuration: 2500,
          barRadius: Radius.circular(5.r),
          // animation: true,
          width: 150.w,
          lineHeight: 10.h,
          percent: percent ?? 0.0,
          progressColor: indicatorColor,
        ),
        CustomText(
          text: percentText,
          size: 13.sp,
          textColor: AppTheme.blackLight,
        ),
      ],
    );
  }
}
