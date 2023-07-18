// ignore_for_file: must_be_immutable

import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_iq_result_detail.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class IQResultPage extends StatelessWidget {
  IQResult? iqResult;
  IQResultPage({super.key, required this.iqResult});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'iQ Test Result', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    String? expDate = iqResult?.expiredDate;
    DateTime? date = DateTime.parse(expDate ?? "");
    String expireDate = DateFormat('dd-MMM-yyyy').format(date);
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFunction.customSpace(height: 10.h),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: iqResult?.result?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CustomResultContainer(
                        onTap: () {
                          // CustomFunction.navigatePage(
                          //     const DISCResultDetailPage(), context);
                        },
                        isIcon: false,
                        preText: iqResult?.result?[index].iqType?.shortCode,
                        postText:
                            "${iqResult?.result?[index].score.toString()} %",
                        bgColor: AppTheme.orange),
                    CustomFunction.customSpace(height: 10.h),
                  ],
                );
              },
            ),
            CustomFunction.customSpace(height: 30.h),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: iqResult?.result?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CustomIQResultDetail(
                      circleText: iqResult?.result?[index].iqType?.shortCode,
                      titleText: iqResult?.result?[index].iqType?.name,
                      bodyText:
                          //'Requires logic, together with a high degree of spatial awareness and creative thinking, and flexibility of mind in adapting to different types of questions.',
                          iqResult?.result?[index].iqType?.description,
                      leadTextColor: AppTheme.orange,
                      titleColor: AppTheme.orange,
                    ),
                    CustomFunction.customSpace(height: 20.h),
                  ],
                );
              },
            ),
            //
            CustomFunction.customSpace(height: 50.h),
            CustomResultContainer(
              isIcon: true,
              postText: 'Your iQ Test will be expired at $expireDate',
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
            )
          ],
        ),
      ),
    );
  }
}
