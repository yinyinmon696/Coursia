import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursiaTopImage extends StatelessWidget {
  const CoursiaTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/CoursiaLogo.png',
      width: 150.w,
      height: 33.h,
      fit: BoxFit.fill,
    );
  }
}
