// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Evaluation/Page/evaluation_rate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvaluationFeedbackPage extends StatelessWidget {
  EvaluationFeedbackPage({super.key});
  TextEditingController answerController = TextEditingController();
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
            CustomFunction.customSpace(height: 10.h),
            const CustomText(
              text: 'Question 1/10',
              textColor: AppTheme.orange,
              textAlign: TextAlign.left,
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomText(
              text: 'Your Feedback & Suggestion',
              textColor: AppTheme.black,
              textAlign: TextAlign.left,
              size: 17,
            ),
            CustomFunction.customSpace(height: 20.h),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 20,
              controller: answerController,
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
                hintText: 'Type your feedback...',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required.";
                }
                return null;
              },
              textInputAction: TextInputAction.done,
            ),
            CustomFunction.customSpace(height: 80.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 150.w,
                  onTap: () {},
                  text: 'Previous',
                  textColor: AppTheme.white,
                  bgcolor: AppTheme.black,
                ),
                CustomButton(
                  width: 150.w,
                  onTap: () {
                    CustomFunction.navigatePage(EvaluationRatePage(), context);
                  },
                  text: 'Next',
                  textColor: AppTheme.white,
                  bgcolor: AppTheme.black,
                ),
              ],
            ),
          ],
        ));
  }
}
