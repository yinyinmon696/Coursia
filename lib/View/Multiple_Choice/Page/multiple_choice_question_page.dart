// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Multiple_Choice/Page/multiple_choice_result_page.dart';
import 'package:coursia/View/Multiple_Choice/bloc/multiple_choice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleChoiceQuestionPage extends StatelessWidget {
  MultipleChoiceQuestionPage({super.key});
  List answerList = [
    {"id": 0, "name": "Alfred Nobel"},
    {"id": 1, "name": "Albert Einstein"},
    {"id": 2, "name": "Donna Strickland"},
    {"id": 3, "name": "Isamu Akasaki"}
  ];
  int? onTapIndex = -1;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(
        text: 'Post Test (Multiple Choice)', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<MultipleChoiceBloc, MultipleChoiceState>(
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
                CustomFunction.customSpace(height: 20.h),
                const CustomText(
                  text: 'Question 1/10',
                  textColor: AppTheme.orange,
                  textAlign: TextAlign.left,
                ),

                CustomFunction.customSpace(height: 30.h),
                const CustomText(
                  text: 'Who is first discovered Dynamite?',
                  textColor: AppTheme.black,
                  textAlign: TextAlign.center,
                  size: 17,
                  fontWeight: FontWeight.bold,
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
                          boxColor: AppTheme.orange,
                          onTap: () {
                            context
                                .read<MultipleChoiceBloc>()
                                .add(OnTapEvent(onTapIndex: index));
                          },
                        ),
                        CustomFunction.customSpace(height: 10)
                      ],
                    );
                  },
                ),
                CustomFunction.customSpace(height: 100.h),
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
                            MultipleChoiceResultPage(), context);
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
