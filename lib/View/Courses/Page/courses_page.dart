// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Courses/Page/behaviour_courses_page.dart';
import 'package:coursia/View/Courses/Page/functional_courses_page.dart';
import 'package:coursia/View/Courses/Page/techanical_courses_page.dart';
import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesPage extends StatelessWidget {
  final String? coursesName;
  CoursesPage({super.key, this.coursesName});

  final topicController = TextEditingController();
  final costController = TextEditingController();
  final levelController = TextEditingController();
  String? tapTitle;
  String? tapTitle1;
  @override
  Widget build(BuildContext context) {
    if (coursesName == null) {
      context.read<CoursesBloc>().add(const OnTapEvent(type: 'Technical'));
    }
    context.read<CoursesBloc>().add(OnTapEvent(type: coursesName));

    return Scaffold(
      body: BlocConsumer<CoursesBloc, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OnTapSuccess) {
            tapTitle = state.type;
            if (tapTitle == 'Technical') {
              context.read<CoursesBloc>().add(const GetCoursesList(
                  mainCategoryName: 'Technical', filterList: []));
            }
            if (tapTitle == 'Functional') {
              context.read<CoursesBloc>().add(const GetCoursesList(
                  mainCategoryName: 'Functional', filterList: []));
            }
            if (tapTitle == 'Behaviour') {
              context.read<CoursesBloc>().add(const GetCoursesList(
                  mainCategoryName: 'Behaviour', filterList: []));
            }
          }
          if (state is GetSubCategoryListFailed) {
            if (tapTitle == 'Technical') {
              context.read<CoursesBloc>().add(const GetCoursesList(
                  mainCategoryName: 'Technical', filterList: []));
            }
            if (tapTitle == 'Functional') {
              context.read<CoursesBloc>().add(const GetCoursesList(
                  mainCategoryName: 'Functional', filterList: []));
            }
            if (tapTitle == 'Behaviour') {
              context.read<CoursesBloc>().add(const GetCoursesList(
                  mainCategoryName: 'Behaviour', filterList: []));
            }
          }
          if (state is OnTapLoading || state is GetCoursesListLoading) {
            return const Center(
              child: CustomLoading(),
            );
          }
          if (state is GetCoursesListSuccess) {
            tapTitle1 = tapTitle;
          }
          return Padding(
            padding: const EdgeInsets.all(15.0).w,
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5).r,
                      color: AppTheme.greyLight),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                            .w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                            borderRadius: 5.r,
                            bgcolor: tapTitle == 'Technical'
                                ? AppTheme.white
                                : AppTheme.greyLight,
                            textColor: AppTheme.blackLight,
                            text: 'Technical',
                            width: 100.w,
                            height: 30.h,
                            onTap: () {
                              context
                                  .read<CoursesBloc>()
                                  .add(const OnTapEvent(type: 'Technical'));
                            }),
                        CustomButton(
                            borderRadius: 5.r,
                            bgcolor: tapTitle == 'Functional'
                                ? AppTheme.white
                                : AppTheme.greyLight,
                            textColor: AppTheme.blackLight,
                            text: 'Functional',
                            width: 100.w,
                            height: 30.h,
                            onTap: () {
                              context
                                  .read<CoursesBloc>()
                                  .add(const OnTapEvent(type: 'Functional'));
                            }),
                        CustomButton(
                            borderRadius: 5.r,
                            bgcolor: tapTitle == 'Behaviour'
                                ? AppTheme.white
                                : AppTheme.greyLight,
                            textColor: AppTheme.blackLight,
                            text: 'Behaviour',
                            width: 100.w,
                            height: 30.h,
                            onTap: () {
                              context
                                  .read<CoursesBloc>()
                                  .add(const OnTapEvent(type: 'Behaviour'));
                            }),
                      ],
                    ),
                  ),
                ),
                CustomFunction.customSpace(height: 10),
                tapTitle1 == 'Technical'
                    ? TechanicalCoursesPage()
                    : tapTitle1 == 'Functional'
                        ? FunctionalCoursesPage()
                        : BehaviourCoursesPage()
              ],
            ),
          );
        },
      ),
    );
  }
}
