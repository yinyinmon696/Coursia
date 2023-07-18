import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIQResultDetail extends StatelessWidget {
  final String? circleText;
  final String? titleText;
  final String? bodyText;
  final Color? leadTextColor;
  final Color? titleColor;
  const CustomIQResultDetail(
      {super.key,
      this.circleText,
      this.titleText,
      this.bodyText,
      this.leadTextColor,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppTheme.blueLight,
            child: CustomText(
              text: circleText,
              textColor: leadTextColor,
              fontWeight: FontWeight.bold,
              size: 17.sp,
            ),
          ),
          CustomFunction.customSpace(width: 20.w),
          CustomText(
            text: titleText,
            textColor: titleColor,
            textAlign: TextAlign.center,
          )
        ],
      ),
      CustomFunction.customSpace(height: 20.h),
      CustomText(
        text: bodyText,
        //  'Requires logic, together with a high degree of spatial awareness and creative thinking, and flexibility of mind in adapting to different types of questions.',
        textColor: AppTheme.black,
        textAlign: TextAlign.justify,
      )
    ]);
  }
}
