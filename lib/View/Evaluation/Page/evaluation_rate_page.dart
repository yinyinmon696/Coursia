// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Evaluation/Page/evaluation_thanks_page.dart';
import 'package:coursia/View/Evaluation/bloc/evaluation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class EvaluationRatePage extends StatelessWidget {
  EvaluationRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Training Evaluation', data: bodyData(context));
  }

  double? rating = 0.0;

  bodyData(BuildContext context) {
    return BlocConsumer<EvaluationBloc, EvaluationState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is RatingSuccess) {
          rating = state.rating;
        }
        return Padding(
            padding: EdgeInsets.all(15.w),
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                CustomFunction.customSpace(height: 10.h),
                const CustomText(
                  text: 'Question 1/10',
                  textColor: AppTheme.orange,
                  textAlign: TextAlign.left,
                ),
                CustomFunction.customSpace(height: 20.h),
                const CustomText(
                  text: 'Rating Star for Courses',
                  textColor: AppTheme.black,
                  textAlign: TextAlign.left,
                  size: 17,
                ),
                CustomFunction.customSpace(height: 20.h),
                Center(
                  child: SmoothStarRating(
                    rating: rating ?? 0.0,
                    size: 50,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: false,
                    spacing: 2.0,
                    onRatingChanged: (value) {
                      context.read<EvaluationBloc>().add(Rating(rating: value));
                      // setState(() {
                      //   rating = value;
                      // });
                    },
                  ),
                ),
                CustomFunction.customSpace(height: 320.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      width: 150.w,
                      onTap: () {},
                      text: 'Previous',
                      textColor: AppTheme.white,
                      bgcolor: AppTheme.black,
                    ),
                    CustomButton(
                      width: 150.w,
                      onTap: () {
                        CustomFunction.navigatePage(
                            const EvaluationThanksPage(), context);
                      },
                      text: 'Submit',
                      textColor: AppTheme.white,
                      bgcolor: AppTheme.black,
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
