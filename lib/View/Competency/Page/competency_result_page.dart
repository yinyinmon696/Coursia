// ignore_for_file: must_be_immutable

import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_compe_result_indicator.dart';
import 'package:coursia/UIDesign/custom_courses_card.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CompetencyResultPage extends StatelessWidget {
  CompetencyResult? competencyResult;
  CompetencyResultPage({super.key, this.competencyResult});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(
        text: 'Competency Test Result', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    String? expDate = competencyResult?.expiredDate;
    DateTime? date = DateTime.parse(expDate ?? "");
    String expireDate = DateFormat('dd-MMM-yyyy').format(date);
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              CustomFunction.customSpace(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                itemCount: competencyResult?.result?.length,
                itemBuilder: (context, index) {
                  double score = double.parse(
                      competencyResult?.result?[index].score.toString() ?? "0");
                  double percent = score / 100;
                  return Column(
                    children: [
                      CustomCompeResultIndicator(
                        text: competencyResult
                                ?.result?[index].competencyType?.name ??
                            "",
                        percentText:
                            "${competencyResult?.result?[index].score}%",
                        indicatorColor: AppTheme.orange,
                        percent: percent,
                      ),
                      CustomFunction.customSpace(height: 40.h)
                    ],
                  );
                },
              ),
              CustomResultContainer(
                isIcon: true,
                postText: 'Your DiSC Test will be expired at $expireDate',
                bgColor: AppTheme.orangeLight,
                textColor: AppTheme.orange,
                borderColor: AppTheme.orange,
                iconColor: AppTheme.orange,
              ),
              CustomFunction.customSpace(height: 20.h),
              CustomButton(
                text: 'Share Result',
                onTap: () {},
                bgcolor: AppTheme.black,
              ),
              CustomFunction.customSpace(height: 20.h),
              CustomText(
                text: 'Suggested Courses',
                textColor: AppTheme.black,
                textAlign: TextAlign.left,
                size: 17.sp,
              ),
              CustomFunction.customSpace(height: 20.h),
              const CustomCourseCard(
                  isCart: false,
                  isWishlist: false,
                  isLearning: false,
                  isCertificate: false,
                  image: 'images/pana1.png',
                  title: 'Data Visualization with R Language',
                  name: 'Joni Iskandar',
                  cost: '\$450',
                  time: '1h 35m ',
                  lessons: '17 Lessons')
            ],
          )),
    );
  }
}
