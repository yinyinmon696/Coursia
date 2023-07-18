import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Checkout/Page/checkout_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutDetailPage extends StatelessWidget {
  const CheckoutDetailPage({super.key});

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
                          child: CustomText(
                            text: '1',
                            textColor: AppTheme.white,
                            fontWeight: FontWeight.bold,
                            size: 11.sp,
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
                          child: CustomText(
                            text: '2',
                            textColor: AppTheme.white,
                            fontWeight: FontWeight.bold,
                            size: 11.sp,
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
            CustomText(
                text: 'Course Detail', textColor: AppTheme.black, size: 20.sp),
            CustomFunction.customSpace(height: 20.h),
            Center(
              child: Image.asset(
                'images/pana.png',
                // width: 180.w,
                height: 150.h,
                //fit: BoxFit.fill,
              ),
            ),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
                text: 'By Daniel Walter Scott',
                textColor: AppTheme.orange,
                size: 13.sp),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
                text: 'Online Marketing Course',
                textColor: AppTheme.black,
                size: 17.sp),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
                text: '5h 30min * 10 Lessons',
                textColor: AppTheme.greyDark,
                size: 11.sp),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
                text: 'About this course',
                textColor: AppTheme.black,
                size: 13.sp),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
              text:
                  r"Online marketing is the practice of leveraging web-based channels to spread a message about a company's brand, products, or services to its potential customers.",
              textColor: AppTheme.greyDark,
              size: 11.sp,
              textAlign: TextAlign.justify,
            ),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
                text: 'MMK-10000', textColor: AppTheme.black, size: 20.sp),
            CustomFunction.customSpace(height: 30.h),
            CustomButton(
              onTap: () {
                CustomFunction.navigatePage(CheckoutPaymentPage(), context);
              },
              text: 'Confirm and Continue',
              textColor: AppTheme.white,
              bgcolor: AppTheme.black,
            ),
          ],
        ),
      ),
    );
  }
}
