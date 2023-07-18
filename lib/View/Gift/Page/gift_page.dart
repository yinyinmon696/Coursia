// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Gift/bloc/gift_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftPage extends StatelessWidget {
  GiftPage({super.key});

  String? code;
  bool? isGetCode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GiftBloc, GiftState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetCodeSuccess) {
            code = state.code;
            isGetCode = true;
          }
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(15.0).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                    text: '1 Promo Code Arrived!', textColor: AppTheme.black),
                CustomFunction.customSpace(height: 10.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color:
                              isGetCode! ? AppTheme.black : AppTheme.orange)),
                  height: 130.h,
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CustomText(
                                  text: '12.12 Shopping Day',
                                  textColor: AppTheme.black,
                                  size: 16),
                              const CustomText(
                                  text: 'All Module 50% Discount',
                                  textColor: AppTheme.black,
                                  size: 12),
                              const CustomText(
                                  text: 'Available only 12.12.2022',
                                  textColor: AppTheme.orange,
                                  size: 12),
                              isGetCode!
                                  ? const CustomText(
                                      text: 'Code - X12Y12Z23',
                                      textColor: AppTheme.black,
                                      fontWeight: FontWeight.bold,
                                      size: 13)
                                  : CustomFunction.customSpace(height: 15.h),
                            ]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'images/gift.png',
                              // width: 150.w,
                              height: 70.h,
                              fit: BoxFit.contain,
                            ),
                            isGetCode!
                                ? CustomButton(
                                    bgcolor: AppTheme.black,
                                    text: 'Copy',
                                    fontSize: 12.sp,
                                    onTap: () {
                                      // CustomFunction.navigatePage(
                                      //   const  GiftEmptyPage(), context);
                                    },
                                    width: 90.w,
                                    height: 25.h,
                                    borderRadius: 20.r)
                                : CustomButton(
                                    bgcolor: AppTheme.orange,
                                    text: 'Get Code',
                                    fontSize: 12.sp,
                                    onTap: () {
                                      context.read<GiftBloc>().add(
                                          const GetCode(
                                              code: 'Code - X12Y12Z23'));
                                    },
                                    width: 90.w,
                                    height: 25.h,
                                    borderRadius: 20.r),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
