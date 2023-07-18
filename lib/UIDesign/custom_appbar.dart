// ignore_for_file: file_names

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Profile/Page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? username;
  final void Function()? onTap;
  const CustomAppBar({super.key, this.onTap, required this.username});
  @override
  Size get preferredSize => Size.fromHeight(120.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Hello , $username', size: 20),
          const SizedBox(height: 20),
          const CustomText(text: 'What do you want to learn today?')
        ],
      ),
      actions: [
        Row(
          children: [
            Image.asset('images/Vector.png', width: 30.sp, height: 30.sp),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {
                CustomFunction.navigatePage(ProfilePage(), context);
              },
              child: Image.asset('images/boy.png', width: 40.sp, height: 40.sp),
            ),
            SizedBox(width: 5.w),
          ],
        )
      ],
      toolbarHeight: 120.h,
      backgroundColor: AppTheme.black,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0),
        ),
      ),
    );
  }
}
