import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_courses_card.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCertificatePage extends StatelessWidget {
  const MyCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'My Certificate', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Column(
        children: [
          CustomFunction.customSpace(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return const CustomCourseCard(
                    isCart: false,
                    isWishlist: false,
                    isLearning: false,
                    isCertificate: true,
                    image: 'images/pana1.png',
                    title: 'Data Visualization with R Language',
                    date: '8-Jul-2023',
                    name: 'Joni Iskandar',
                    cost: '40%',
                    time: '1h 35m ',
                    lessons: '17 Lessons');
              },
            ),
          ),
        ],
      ),
    );
  }
}
