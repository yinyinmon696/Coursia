// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleChoiceResultPage extends StatelessWidget {
  MultipleChoiceResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(
        text: 'Post Test (Multiple Choice)', data: bodyData(context));
  }

  bool? isSuccess = true;
  bodyData(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            CustomFunction.customSpace(height: 50.h),
            isSuccess!
                ? Image.asset(
                    'images/goal.png',
                    // width: 180.w,
                    height: 150.h,
                    //fit: BoxFit.fill,
                  )
                : Image.asset(
                    'images/fail.png',
                    // width: 180.w,
                    height: 150.h,
                    //fit: BoxFit.fill,
                  ),
            CustomFunction.customSpace(height: 30.h),
            CustomText(
              text: isSuccess! ? 'Congratulation! Arkar' : 'Oh No! Arkar',
              textColor: AppTheme.black,
              textAlign: TextAlign.center,
              size: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomFunction.customSpace(height: 30.h),
            CustomText(
              text: isSuccess!
                  ? 'You have passed multiple choice test with 70% score.'
                  : 'Your score does not meet the passpoint.Please Try Again!',
              textColor: AppTheme.black,
              textAlign: TextAlign.center,
            ),
            CustomFunction.customSpace(height: 110.h),
            isSuccess!
                ? Container()
                : const CustomResultContainer(
                    isIcon: true,
                    postText:
                        'Your Post Test will take at 24-Nov-2022, 23:00:00 Left',
                    bgColor: AppTheme.orangeLight,
                    textColor: AppTheme.orange,
                    borderColor: AppTheme.orange,
                    iconColor: AppTheme.orange,
                  ),
            isSuccess!
                ? CustomFunction.customSpace(height: 50.h)
                : CustomFunction.customSpace(height: 20.h),
            CustomButton(
              onTap: () {},
              text: 'Review Answers',
              textColor: AppTheme.white,
              bgcolor: AppTheme.black,
            ),
          ],
        ));
  }
}
