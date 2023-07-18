// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_payment_card.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Checkout/Page/checkout_review_page.dart';
import 'package:coursia/View/Checkout/bloc/checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutPaymentPage extends StatelessWidget {
  CheckoutPaymentPage({super.key});
  List paymentList = [
    {"id": 0, "name": "master", "image": "images/master.png"},
    {"id": 1, "name": "visa", "image": "images/visa.png"},
    {"id": 2, "name": "gpay", "image": "images/googlePay.png"},
    {"id": 3, "name": "paypass", "image": "images/paypass.png"},
    {"id": 4, "name": "discover", "image": "images/discover.png"}
  ];
  int? onTapIndex = -1;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Checkout', data: bodyData(context));
  }

  String? selectedText;
  bodyData(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }

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
                    text: 'Payment', textColor: AppTheme.black, size: 20.sp),
                CustomFunction.customSpace(height: 20.h),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: paymentList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CustomPaymentCard(
                            imageUrl: paymentList[index]["image"],
                            amount: 'MMK-10000',
                            index: index,
                            currentIndex: onTapIndex,
                            onTap: () {
                              context
                                  .read<CheckoutBloc>()
                                  .add(OnTapEvent(onTapIndex: index));
                            },
                          ),
                          CustomFunction.customSpace(height: 10.h)
                        ],
                      );
                    }),
                CustomFunction.customSpace(height: 30.h),
                CustomButton(
                  onTap: () {
                    CustomFunction.navigatePage(
                        const CheckoutReviewPage(), context);
                  },
                  text: 'Confirm and Continue',
                  textColor: AppTheme.white,
                  bgcolor: AppTheme.black,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
