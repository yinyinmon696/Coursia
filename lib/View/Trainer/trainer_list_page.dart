
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Trainer/trainer_courses_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainerListPage extends StatelessWidget {
  const TrainerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(15.0).w,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    CustomFunction.navigatePage(
                        const TrainerCoursesPage(), context);
                  },
                  child: Container(
                    height: 95.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5).r,
                        color: AppTheme.greyLight),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        SizedBox(
                            width: 80.w,
                            height: 80.h,
                            child: Image.asset("images/boy.png")),
                        CustomFunction.customSpace(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(8).w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: 'Arkar Min Myat',
                                textColor: AppTheme.black,
                                size: 12.sp,
                              ),
                              CustomText(
                                  text: 'Internal Tainer',
                                  textColor: AppTheme.blackLight,
                                  size: 11.sp),
                              CustomText(
                                  text: '7 Courses',
                                  textColor: AppTheme.blackLight,
                                  size: 11.sp)
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                CustomFunction.customSpace(height: 10)
              ],
            );
          }),
    )));
  }
}
