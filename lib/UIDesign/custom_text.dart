import 'package:coursia/UIDesign/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  const CustomText(
      {super.key,
      required this.text,
      this.textColor,
      this.size,
      this.textAlign,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? "",
        style: TextStyle(
            color: textColor ?? AppTheme.white,
            fontSize: size?.sp ?? 15.sp,
            fontWeight: fontWeight ?? FontWeight.normal),
        textAlign: textAlign ?? TextAlign.center);
  }
}
