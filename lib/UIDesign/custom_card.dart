import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String? text;

  const CustomCard({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25.h,
      decoration: const BoxDecoration(color: AppTheme.greyLight),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: CustomText(
          text: text!,
          size: 12,
          textAlign: TextAlign.left,
          textColor: AppTheme.greyDark,
        ),
      ),
    );
  }
}
