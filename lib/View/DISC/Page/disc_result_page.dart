import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DISCResultPage extends StatelessWidget {
  final DISCResult? result;
  const DISCResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'DISC Test Result', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    String? expDate = result?.expiredDate;
    DateTime? date = DateTime.parse(expDate ?? "");
    String expireDate = DateFormat('dd-MMM-yyyy').format(date);
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFunction.customSpace(height: 10.h),
            CustomFunction.assetImage(
                image: 'images/disc.png', width: 150.w, height: 130.h),
            CustomFunction.customSpace(height: 20.h),
            const CustomText(
              text: 'Result Analysis',
              textColor: AppTheme.black,
            ),
            CustomFunction.customSpace(height: 20.h),
            CustomResultContainer(
                onTap: () {
                  // CustomFunction.navigatePage(
                  //     const DISCResultDetailPage(), context);
                },
                isIcon: false,
                preText: '${result?.result1?[0].discType}',
                postText: '${result?.result1?[0].score}%',
                bgColor: AppTheme.green),
            CustomFunction.customSpace(height: 10.h),
            CustomResultContainer(
                isIcon: false,
                preText: result?.result1?[1].discType ?? "",
                postText: '${result?.result1?[1].score}%',
                bgColor: AppTheme.red),
            CustomFunction.customSpace(height: 10.h),
            CustomResultContainer(
                isIcon: false,
                preText: result?.result1?[2].discType ?? "",
                postText: '${result?.result1?[2].score}%',
                bgColor: AppTheme.purpleLight),
            CustomFunction.customSpace(height: 10.h),
            CustomResultContainer(
                isIcon: false,
                preText: result?.result1?[3].discType ?? "",
                postText: '${result?.result1?[3].score}%',
                bgColor: AppTheme.yellow),
            CustomFunction.customSpace(height: 40.h),
            // CustomFunction.assetImage(
            //     image: 'images/di.png', width: 150.w, height: 130.h),
            result?.discType == null
                ? const CustomText(
                    text: 'There is no DISC Type.',
                    textColor: AppTheme.greyDark,
                  )
                : Column(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        child: CustomText(
                          text: result?.discType?.name ?? "",
                          textColor: AppTheme.black,
                          size: 40,
                        ),
                      ),
                      CustomFunction.customSpace(height: 20.h),
                      CustomText(
                        text: 'The ${result?.discType?.name} Style ',
                        size: 20.sp,
                        textColor: AppTheme.black,
                      ),
                      CustomFunction.customSpace(height: 20.h),
                      CustomText(
                        text: result?.discType?.description ?? "",
                        size: 13.sp,
                        textAlign: TextAlign.left,
                        textColor: AppTheme.black,
                      ),
                    ],
                  ),
            // CustomFunction.customSpace(height: 20.h),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: CustomText(
            //     size: 12.sp,
            //     text: 'See more...',
            //     textColor: AppTheme.orange,
            //   ),
            // ),
            CustomFunction.customSpace(height: 50.h),
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
              onTap: () {
                // CustomFunction.navigatePage(
                //     HomePage(
                //       currentIndex: 0,
                //     ),
                //     context);
              },
              bgcolor: AppTheme.black,
            )
          ],
        ),
      ),
    );
  }
}
