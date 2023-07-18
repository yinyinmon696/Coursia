import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/View/Blog/Page/blog_type_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coursia/View/Home/bloc/home_bloc.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0).w,
          child: Column(
            children: [
              Stack(fit: StackFit.passthrough, children: <Widget>[
                Container(height: 470.h, color: AppTheme.white),
                Positioned(
                  top: 0.h,
                  bottom: 250.h,
                  child: InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(const OnTapEvent(
                          onTapIndex: 1, courseName: 'Technical'));
                    },
                    child: CustomFunction.assetImage(
                        image: 'images/blog1.png', height: 50.h, width: 330.w),
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: 30.0.w,
                  child: InkWell(
                      onTap: () {
                        context.read<HomeBloc>().add(const OnTapEvent(
                            onTapIndex: 1, courseName: 'Technical'));
                      },
                      child: const CustomText(text: 'Technical', size: 18)),
                ),
                Positioned(
                  top: 90.h,
                  left: 30.0.w,
                  child: InkWell(
                      onTap: () {
                        // CustomFunction.navigatePage(
                        context.read<HomeBloc>().add(const OnTapEvent(
                            onTapIndex: 1, courseName: 'Technical'));
                      },
                      child: const CustomText(text: '100+ Course', size: 15)),
                ),
                Positioned(
                  top: 30.h,
                  left: 180.0.w,
                  child: InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(const OnTapEvent(
                          onTapIndex: 1, courseName: 'Technical'));
                    },
                    child: CustomFunction.assetImage(
                        image: 'images/robot.png', height: 90.h, width: 130.w),
                  ),
                ),
                Positioned(
                  top: 200.h,
                  child: InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(const OnTapEvent(
                          onTapIndex: 1, courseName: 'Functional'));
                    },
                    child: CustomFunction.assetImage(
                        image: 'images/blog2.png', height: 160.h, width: 155.w),
                  ),
                ),
                Positioned(
                  top: 230.h,
                  left: 30.0.w,
                  child: InkWell(
                      onTap: () {
                        context.read<HomeBloc>().add(const OnTapEvent(
                            onTapIndex: 1, courseName: 'Functional'));
                      },
                      child: const CustomText(text: 'Functional', size: 18)),
                ),
                Positioned(
                  top: 260.h,
                  left: 30.0.w,
                  child: InkWell(
                      onTap: () {
                        context.read<HomeBloc>().add(const OnTapEvent(
                            onTapIndex: 1, courseName: 'Functional'));
                      },
                      child: const CustomText(text: '50+ Course', size: 15)),
                ),
                Positioned(
                  top: 280.h,
                  left: 30.0.w,
                  child: InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(const OnTapEvent(
                          onTapIndex: 1, courseName: 'Functional'));
                    },
                    child: CustomFunction.assetImage(
                        image: 'images/functional.png',
                        height: 70.h,
                        width: 100.w),
                  ),
                ),
                Positioned(
                  top: 200.h,
                  left: 175.0.w,
                  child: InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(const OnTapEvent(
                          onTapIndex: 1, courseName: 'Behaviour'));
                    },
                    child: CustomFunction.assetImage(
                        image: 'images/blog3.png', height: 160.h, width: 155.w),
                  ),
                ),
                Positioned(
                  top: 230.h,
                  left: 210.w,
                  child: InkWell(
                      onTap: () {
                        context.read<HomeBloc>().add(const OnTapEvent(
                            onTapIndex: 1, courseName: 'Behaviour'));
                      },
                      child: const CustomText(text: 'Behaviourval', size: 18)),
                ),
                Positioned(
                  top: 260.h,
                  left: 240.w,
                  child: InkWell(
                      onTap: () {
                        context.read<HomeBloc>().add(const OnTapEvent(
                            onTapIndex: 1, courseName: 'Behaviour'));
                      },
                      child: const CustomText(text: '80+ Course', size: 15)),
                ),
                Positioned(
                  top: 290.h,
                  left: 210.w,
                  child: InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(const OnTapEvent(
                          onTapIndex: 1, courseName: 'Behaviour'));
                    },
                    child: CustomFunction.assetImage(
                        image: 'images/behaviour.png',
                        height: 60.h,
                        width: 110.w),
                  ),
                ),
                Positioned(
                  top: 370.h,
                  child: InkWell(
                      onTap: () {
                        CustomFunction.navigatePage(
                            const BlogTypeListPage(), context);
                      },
                      child: CustomFunction.assetImage(
                          image: 'images/blog4.png',
                          height: 100.h,
                          width: 330.w)),
                ),
                Positioned(
                  top: 400.h,
                  left: 30.0.w,
                  child: const CustomText(text: 'Knowledge Blog', size: 18),
                ),
                Positioned(
                  top: 430.h,
                  left: 30.0.w,
                  child: const CustomText(text: '100+ Blog', size: 15),
                ),
                Positioned(
                  top: 380.h,
                  left: 210.w,
                  child: CustomFunction.assetImage(
                      image: 'images/blog.png', height: 80.h, width: 100.w),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
