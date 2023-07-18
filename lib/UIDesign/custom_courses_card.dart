import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Checkout/Page/checkout_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomCourseCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? name;
  final String? date;
  final String? cost;
  final String? time;
  final String? lessons;
  final bool? isCart;
  final bool? isWishlist;
  final bool? isLearning;
  final bool? isCertificate;
  final Icon? icon;
  final void Function()? iconTap;
  final void Function()? onTap;

  const CustomCourseCard(
      {super.key,
      this.image,
      this.title,
      this.date,
      this.name,
      this.cost,
      this.time,
      this.lessons,
      this.isCart,
      this.isWishlist,
      this.isLearning,
      this.isCertificate,
      this.icon,
      this.iconTap,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 95.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5).r,
                color: AppTheme.greyLight),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SizedBox(width: 80.w, height: 80.h, child: Image.asset(image!)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        textColor: AppTheme.black,
                        size: 12.sp,
                        textAlign: TextAlign.left,
                      ),
                      Expanded(
                        child: isCertificate!
                            ? Row(
                                children: [
                                  CustomFunction.customSpace(width: 120.w),
                                  CustomText(
                                      text: name,
                                      textColor: AppTheme.blackLight,
                                      size: 11.sp),
                                ],
                              )
                            : Row(
                                children: [
                                  CustomText(
                                    text: name,
                                    textColor: AppTheme.blackLight,
                                    size: 11.sp,
                                  ),
                                  CustomFunction.customSpace(width: 30.w),
                                  CustomText(
                                    text: cost,
                                    textColor: AppTheme.orange,
                                    size: 13.sp,
                                  ),
                                  CustomFunction.customSpace(width: 50.w),
                                  InkWell(
                                      onTap: iconTap,
                                      child: isCart! || isWishlist!
                                          ? const Icon(
                                              Icons.remove_circle_outline,
                                              color: AppTheme.red,
                                            )
                                          : isLearning!
                                              ? const Icon(Icons.play_circle)
                                              : Container())
                                ],
                              ),
                      ),
                      isCart!
                          ? CustomButton(
                              bgcolor: AppTheme.orange,
                              text: 'Check Out',
                              fontSize: 12.sp,
                              onTap: () {
                                CustomFunction.navigatePage(
                                    const CheckoutDetailPage(), context);
                              },
                              width: 90.w,
                              height: 25.h,
                              borderRadius: 20.r)
                          : isWishlist!
                              ? CustomButton(
                                  bgcolor: AppTheme.orange,
                                  text: 'Add To Cart',
                                  fontSize: 12.sp,
                                  onTap: () {
                                    // CustomFunction.navigatePage(EditProfilePage(), context);
                                  },
                                  width: 90.w,
                                  height: 25.h,
                                  borderRadius: 20.r)
                              : isLearning!
                                  ? LinearPercentIndicator(
                                      animationDuration: 2500,
                                      barRadius: Radius.circular(5.r),
                                      // animation: true,
                                      width: 200.w,
                                      lineHeight: 8.h,
                                      percent: 0.4,
                                      progressColor: AppTheme.orange,
                                    )
                                  : isCertificate!
                                      ? Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              CustomText(
                                                  text: date,
                                                  textColor:
                                                      AppTheme.blackLight,
                                                  size: 11.sp),
                                              CustomFunction.customSpace(
                                                  width: 60.w),
                                              CustomButton(
                                                  bgcolor: AppTheme.orange,
                                                  text: 'Download',
                                                  fontSize: 12.sp,
                                                  onTap: () {
                                                    // CustomFunction.navigatePage(EditProfilePage(), context);
                                                  },
                                                  width: 90.w,
                                                  height: 25.h,
                                                  borderRadius: 20.r)
                                            ],
                                          ),
                                        )
                                      : Expanded(
                                          child: Row(
                                            children: [
                                              CustomText(
                                                  text: time,
                                                  textColor:
                                                      AppTheme.blackLight,
                                                  size: 11.sp),
                                              CustomFunction.customSpace(
                                                  width: 20.w),
                                              Icon(
                                                Icons.circle,
                                                color: AppTheme.orange,
                                                size: 12.sp,
                                              ),
                                              CustomText(
                                                  text: '   $lessons',
                                                  textColor:
                                                      AppTheme.blackLight,
                                                  size: 11.sp)
                                            ],
                                          ),
                                        ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
        CustomFunction.customSpace(height: 10.h)
      ],
    );
  }
}
