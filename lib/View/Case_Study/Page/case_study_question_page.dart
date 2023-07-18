// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Case_Study/Page/case_study_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaseStudyQuestionPage extends StatelessWidget {
  CaseStudyQuestionPage({super.key});
  TextEditingController answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(
        text: 'Post Test (Case Study)', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    // answerController.text =
    //     'How do you typically deal with stress and anxiety?How do you typically deal with stress and anxiety?How do you typically deal with stress and anxiety?How do you typically deal with stress and anxiety?';
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

            CustomFunction.customSpace(height: 20.h),
            const CustomText(
                text: 'How do you typically deal with stress and anxiety?',
                textColor: AppTheme.black,
                textAlign: TextAlign.justify),
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
                hintText: 'Type your answer...',
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
            // CustomButton(
            //   onTap: () {},
            //   text: 'Next',
            //   textColor: AppTheme.white,
            //   bgcolor:
            //       onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    width: 150.w,
                    onTap: () {},
                    text: 'Previous',
                    textColor: AppTheme.white,
                    bgcolor: AppTheme.black
                    // bgcolor:
                    //     onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                    ),
                CustomButton(
                    width: 150.w,
                    onTap: () {
                      CustomFunction.navigatePage(
                          CaseStudyResultPage(), context);
                    },
                    text: 'Next',
                    textColor: AppTheme.white,
                    bgcolor: AppTheme.black
                    // bgcolor:
                    //     onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                    ),
              ],
            ),
          ],
        ));
  }
}
