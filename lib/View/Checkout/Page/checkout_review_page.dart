import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutReviewPage extends StatelessWidget {
  const CheckoutReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Checkout', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFunction.customSpace(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: AppTheme.black,
                          child: Icon(
                            Icons.check,
                            color: AppTheme.white,
                            size: 15.r,
                          ),
                        ),
                        CustomText(
                            text: 'Detail',
                            textColor: AppTheme.black,
                            size: 13.sp),
                      ]),
                ),
                SizedBox(
                  width: 100.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: AppTheme.black,
                          child: Icon(
                            Icons.check,
                            color: AppTheme.white,
                            size: 15.r,
                          ),
                        ),
                        CustomText(
                            text: 'Payment',
                            textColor: AppTheme.black,
                            size: 13.sp),
                      ]),
                ),
                SizedBox(
                  width: 100.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: AppTheme.black,
                          child: CustomText(
                            text: '3',
                            textColor: AppTheme.white,
                            fontWeight: FontWeight.bold,
                            size: 11.sp,
                          ),
                        ),
                        CustomText(
                            text: 'Review',
                            textColor: AppTheme.black,
                            size: 13.sp),
                      ]),
                )
              ],
            ),
            CustomFunction.customSpace(height: 40.h),
            CustomText(text: 'Summary', textColor: AppTheme.black, size: 20.sp),
            CustomFunction.customSpace(height: 430.h),
            CustomButton(
              onTap: () {
                // CustomFunction.navigatePage(
                //     const CheckoutPaymentPage(), context);
              },
              text: 'Proceed',
              textColor: AppTheme.white,
              bgcolor: AppTheme.black,
            ),
          ],
        ),
      ),
    );
  }
}
