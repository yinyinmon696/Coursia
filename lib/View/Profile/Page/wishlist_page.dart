import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_courses_card.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Wishlist', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Column(
        children: [
          CustomFunction.customSpace(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return const CustomCourseCard(
                    isCart: false,
                    isWishlist: true,
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
          ),
        ],
      ),
    );
  }
}
