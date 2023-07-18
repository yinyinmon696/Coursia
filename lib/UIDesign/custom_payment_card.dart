import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaymentCard extends StatelessWidget {
  final String? imageUrl;
  final String? amount;
  final int? index;
  final int? currentIndex;
  final void Function()? onTap;

  const CustomPaymentCard({
    super.key,
    required this.imageUrl,
    required this.amount,
    this.index,
    this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70.h,
        decoration: BoxDecoration(
            color: AppTheme.greyLight,
            border: Border.all(
                color: index == currentIndex
                    ? AppTheme.orange
                    : AppTheme.greyLight)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imageUrl ?? "",
                width: 80.w,
                height: 50.h,
                fit: BoxFit.contain,
              ),
              CustomText(
                text: amount ?? 'MMK-0',
                textAlign: TextAlign.left,
                textColor: AppTheme.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
