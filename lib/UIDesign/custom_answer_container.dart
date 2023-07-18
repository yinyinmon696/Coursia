// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAnswerContainer extends StatelessWidget {
  final String? text;
  final int? index;
  final int? currentIndex;
  final Color? boxColor;
  final void Function()? onTap;
  const CustomAnswerContainer(
      {super.key,
      required this.text,
      this.index,
      this.currentIndex,
      this.boxColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
            color: index == currentIndex ? boxColor : AppTheme.greyLight,
            borderRadius: BorderRadius.circular(5.r)),
        child: Row(children: [
          SizedBox(
            width: 100.w,
            child: index == currentIndex
                ? const Icon(
                    Icons.album,
                    color: AppTheme.white,
                  )
                : const Icon(
                    Icons.circle_outlined,
                    color: AppTheme.greyDark,
                  ),
          ),
          CustomText(
            text: text,
            textColor:
                index == currentIndex ? AppTheme.white : AppTheme.greyDark,
          )
        ]),
      ),
    );
  }
}
