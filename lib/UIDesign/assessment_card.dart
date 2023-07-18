import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssessmentCard extends StatelessWidget {
  final String? titleText;
  final String? bodyText;
  final Color? bgColor;
  final Color? btnColor;
  final void Function()? onTap;
  final bool? isDISC;
  const AssessmentCard(
      {super.key,
      this.titleText,
      this.bodyText,
      this.bgColor,
      this.btnColor,
      required this.onTap,
      this.isDISC = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      height: 130.h,
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                  text: titleText, size: 15.sp, textColor: AppTheme.black),
              CustomFunction.customSpace(height: 10),
              CustomText(
                  textAlign: TextAlign.left,
                  text: bodyText,
                  size: 12.sp,
                  textColor: AppTheme.black),
              isDISC == true
                  ? CustomFunction.customSpace(height: 20)
                  : CustomFunction.customSpace(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomButton(
                    bgcolor: btnColor,
                    text: 'Test Now ->',
                    fontSize: 12.sp,
                    onTap: onTap,
                    width: 90.w,
                    height: 25.h,
                    borderRadius: 20.r),
              )
            ]),
      ),
    );
  }
}
