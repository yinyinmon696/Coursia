// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvaluationThanksPage extends StatelessWidget {
  const EvaluationThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Training Evaluation', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            CustomFunction.customSpace(height: 50.h),
            Image.asset(
              'images/thanks.png',
              // width: 180.w,
              height: 150.h,
              //fit: BoxFit.fill,
            ),
            CustomFunction.customSpace(height: 30.h),
            const CustomText(
              text: 'Thanks! Arkar',
              textColor: AppTheme.black,
              textAlign: TextAlign.center,
              size: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomFunction.customSpace(height: 30.h),
            const CustomText(
              text:
                  'We value your feedback and suggestion and will be used for future development.',
              textColor: AppTheme.black,
              textAlign: TextAlign.center,
            ),
            CustomFunction.customSpace(height: 160.h),
            CustomButton(
              onTap: () {},
              text: 'OK',
              textColor: AppTheme.white,
              bgcolor: AppTheme.black,
            ),
          ],
        ));
  }
}
