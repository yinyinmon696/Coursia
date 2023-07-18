import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomResultContainer extends StatelessWidget {
  final String? preText;
  final String? postText;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final bool? isIcon;
  final void Function()? onTap;
  const CustomResultContainer(
      {super.key,
      this.preText,
      this.postText,
      this.bgColor,
      this.borderColor,
      this.textColor,
      this.iconColor,
      this.isIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          border: isIcon! ? Border.all(color: borderColor!) : null,
          color: bgColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
              mainAxisAlignment: isIcon!
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                isIcon!
                    ? Icon(Icons.check_circle, color: iconColor)
                    : CustomText(
                        text: preText,
                        textAlign: TextAlign.left,
                      ),
                CustomText(
                  text: postText,
                  size: 12.sp,
                  textColor: isIcon! ? textColor : AppTheme.white,
                ),
              ]),
        ),
      ),
    );
  }
}
