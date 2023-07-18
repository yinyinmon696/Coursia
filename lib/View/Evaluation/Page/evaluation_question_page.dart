// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Evaluation/Page/evaluation_feedback_page.dart';
import 'package:coursia/View/Evaluation/bloc/evaluation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvaluationQuestionPage extends StatelessWidget {
  EvaluationQuestionPage({super.key});
  List answerList = [
    {"id": 0, "name": "Strongly Agree"},
    {"id": 1, "name": "Agree"},
    {"id": 2, "name": "Undecided"},
    {"id": 3, "name": "Disagree"},
    {"id": 4, "name": "Strongly Disagree"}
  ];
  int? onTapIndex = -1;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Training Evaluation', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<EvaluationBloc, EvaluationState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }
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
                  text: 'Aid of Teaching Supports',
                  textColor: AppTheme.black,
                  textAlign: TextAlign.left,
                  size: 17,
                ),
                CustomFunction.customSpace(height: 30.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: answerList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomAnswerContainer(
                          text: answerList[index]["name"],
                          index: index,
                          currentIndex: onTapIndex,
                          boxColor: onTapIndex == 0 || onTapIndex == 1
                              ? AppTheme.green
                              : onTapIndex == 2
                                  ? AppTheme.grey
                                  : onTapIndex == 3 || onTapIndex == 4
                                      ? AppTheme.red
                                      : AppTheme.greyLight,
                          onTap: () {
                            context
                                .read<EvaluationBloc>()
                                .add(OnTapEvent(onTapIndex: index));
                          },
                        ),
                        CustomFunction.customSpace(height: 10.h)
                      ],
                    );
                  },
                ),
                CustomFunction.customSpace(height: 20.h),
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
                      bgcolor:
                          onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                    ),
                    CustomButton(
                      width: 150.w,
                      onTap: () {
                        CustomFunction.navigatePage(
                            EvaluationFeedbackPage(), context);
                      },
                      text: 'Next',
                      textColor: AppTheme.white,
                      bgcolor:
                          onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
