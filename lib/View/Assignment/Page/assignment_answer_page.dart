// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssignmentAnswerPage extends StatelessWidget {
  AssignmentAnswerPage({super.key});
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(
        text: 'Post Test (Assignment)', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            const CustomText(
              text: 'Question 1/10',
              textColor: AppTheme.orange,
              textAlign: TextAlign.left,
            ),
            CustomFunction.customSpace(height: 10.h),
            const CustomText(
              text:
                  'Identify The Different Leadership Styles And Their Characteristics ',
              textColor: AppTheme.black,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.justify,
            ),
            CustomFunction.customSpace(height: 10.h),
            const CustomText(
              text:
                  'There are many different leadership styles, but the most common ones can be classified as follows:',
              textColor: AppTheme.blackLight,
              textAlign: TextAlign.justify,
            ),
            CustomFunction.customSpace(height: 10.h),
            const CustomText(
              text:
                  '1.Authoritative Leadership Style – This type of leader is demanding and expects their employees to follow their orders.',
              textColor: AppTheme.blackLight,
              textAlign: TextAlign.justify,
            ),
            CustomFunction.customSpace(height: 40.h),
            Container(
              width: double.infinity,
              height: 70.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  // color: AppTheme.greyLight,
                  border: Border.all(color: AppTheme.greyDark)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/assign.png',
                      // width: 50.w,
                      height: 30.h,
                      fit: BoxFit.contain,
                    ),
                    CustomFunction.customSpace(width: 10.w),
                    const CustomText(
                      text: 'amm_assignment.pdf',
                      textAlign: TextAlign.left,
                      textColor: AppTheme.black,
                    ),
                  ],
                ),
              ),
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomText(
              text: 'Trainer Feedback',
              textColor: AppTheme.greyDark,
              textAlign: TextAlign.left,
            ),
            CustomFunction.customSpace(height: 20.h),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              controller: feedbackController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.greyLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 12,
                ),
                hintText: 'Feedback',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required.";
                }
                return null;
              },
              textInputAction: TextInputAction.done,
            ),
          ],
        ));
  }
}
