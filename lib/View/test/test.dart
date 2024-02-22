import 'package:coursia/UIDesign/custom_courses_card.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Courses/Page/courses_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainerCoursesPage extends StatelessWidget {
  const TrainerCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(
        text: 'Trainer Courses List', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return CustomCourseCard(
              onTap: () {
                // CustomFunction.navigatePage(
                //     MultipleChoiceQuestionPage(), context);
                // CustomFunction.navigatePage(
                //     CaseStudyQuestionPage(), context);
                // CustomFunction.navigatePage(
                //     AssignmentResultPage(), context);
                CustomFunction.navigatePage(const CourseDetialPage(), context);
              },
              isCart: false,
              isWishlist: false,
              isLearning: false,
              isCertificate: false,
              image: 'images/pana1.png',
              title: 'Data Visualization with R Language',
              name: 'Joni Iskandar',
              cost: '\$450',
              time: '1h 35m ',
              lessons: '17 Lessons');
        },
      ),
    );
  }
}
