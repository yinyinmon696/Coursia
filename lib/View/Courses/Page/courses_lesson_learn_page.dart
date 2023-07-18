// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_video_play_card.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class CourseLessonLearnPage extends StatelessWidget {
  CourseLessonLearnPage({super.key});
  TextEditingController reviewController = TextEditingController();

  final FlickManager flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
  bool isIconTap = false;
  String lessonOrReview = 'lesson';

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Course Detail', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<CoursesBloc, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is IconTapSuccess) {
          isIconTap = state.isIconTap!;
        }
        if (state is OnTapLessonReviewSuccess) {
          lessonOrReview = state.lessonOrReview!;
        }
        return Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
            Expanded(
              child: SingleChildScrollView(
                // scrollDirection: Axis.vertical,
                // physics: const ScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'By Daniel Walter Scott',
                        textColor: AppTheme.orange,
                        textAlign: TextAlign.left,
                      ),
                      CustomFunction.customSpace(height: 10.h),
                      CustomText(
                        text: 'Online Marketing Course',
                        textColor: AppTheme.black,
                        size: 18.sp,
                      ),
                      CustomFunction.customSpace(height: 10.h),
                      CustomText(
                        text: '5h 30min - 10 Lessons',
                        textColor: AppTheme.grey,
                        size: 10.sp,
                      ),
                      CustomFunction.customSpace(height: 10.h),
                      CustomText(
                        text: 'About this course',
                        textColor: AppTheme.black,
                        size: 12.sp,
                      ),
                      CustomFunction.customSpace(height: 10.h),
                      CustomText(
                        text:
                            r'Online marketing is the practice of leveraging web-based channels to spread a message about a company’s brand, products, or services to its potential customers.',
                        textColor: AppTheme.greyDark,
                        textAlign: TextAlign.justify,
                        size: 12.sp,
                      ),
                      CustomFunction.customSpace(height: 10.h),
                      Center(
                        child: InkWell(
                          onTap: () {
                            isIconTap = !isIconTap;
                            context
                                .read<CoursesBloc>()
                                .add(IconTap(isIconTap: isIconTap));
                          },
                          child: isIconTap
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  size: 35.sp,
                                  color: AppTheme.grey,
                                )
                              : Icon(
                                  Icons.arrow_drop_up,
                                  size: 35.sp,
                                  color: AppTheme.grey,
                                ),
                        ),
                      ),
                      isIconTap
                          ? Container()
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.read<CoursesBloc>().add(
                                            const OnTapLessonReviewEvent(
                                                lessonOrReview: 'lesson'));
                                      },
                                      child: CustomText(
                                        text: 'Lessons',
                                        textColor: lessonOrReview == 'lesson'
                                            ? AppTheme.orange
                                            : AppTheme.grey,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.read<CoursesBloc>().add(
                                            const OnTapLessonReviewEvent(
                                                lessonOrReview: 'review'));
                                      },
                                      child: CustomText(
                                        text: 'Reviews',
                                        textColor: lessonOrReview == 'review'
                                            ? AppTheme.orange
                                            : AppTheme.grey,
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                                CustomFunction.customSpace(height: 10.h),
                                lessonOrReview == 'lesson'
                                    ? SizedBox(
                                        height: 200.h,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              physics: const ScrollPhysics(),
                                              itemCount: 4,
                                              itemBuilder: (context, index) {
                                                return const CustomVideoPlayCard(
                                                    isWatched: true,
                                                    leadText: '   01   ',
                                                    titleText:
                                                        'Intro to Marketing',
                                                    bodyText: ' 01:30 Mins',
                                                    bodyTextColor:
                                                        AppTheme.greyDark,
                                                    postIcon: Icons.play_circle,
                                                    isTimeIcon: true);
                                              },
                                            ),
                                            const CustomVideoPlayCard(
                                                isWatched: true,
                                                leadText: '   05   ',
                                                titleText: 'Evaluation Form',
                                                bodyText: 'Done',
                                                bodyTextColor: AppTheme.orange,
                                                postIcon: Icons.play_circle,
                                                isTimeIcon: false),
                                            const CustomVideoPlayCard(
                                                isWatched: true,
                                                leadText: '   06   ',
                                                titleText:
                                                    'Post Test (Assignment) ',
                                                bodyText: 'Failed',
                                                bodyTextColor: AppTheme.red,
                                                postIcon: Icons.play_circle,
                                                isTimeIcon: false),
                                            const CustomVideoPlayCard(
                                                isWatched: true,
                                                leadText: '   07   ',
                                                titleText: 'Certificate',
                                                bodyText: '',
                                                postIcon: Icons.download,
                                                isTimeIcon: false),
                                            CustomFunction.customSpace(
                                                height: 30.h)
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: 100.h,
                                        child: ListView.builder(
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              height: 120.h,
                                              child: Card(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: Column(children: [
                                                    Row(
                                                      children: [
                                                        CustomFunction
                                                            .customSpace(
                                                                width: 5.w),
                                                        CircleAvatar(
                                                          child: Image.asset(
                                                            'images/boy.png',
                                                            width: 50.w,
                                                            height: 30.h,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                        CustomFunction
                                                            .customSpace(
                                                                width: 10.w),
                                                        SizedBox(
                                                          width: 185.w,
                                                          child: CustomText(
                                                            text:
                                                                'Arkar Min Myat',
                                                            textColor:
                                                                AppTheme.black,
                                                            size: 12.sp,
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                        CustomText(
                                                          text: '12/3/2022 ',
                                                          textColor:
                                                              AppTheme.orange,
                                                          size: 12.sp,
                                                          textAlign:
                                                              TextAlign.right,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        CustomFunction
                                                            .customSpace(
                                                                width: 50.w),
                                                        Expanded(
                                                          child: CustomText(
                                                            text:
                                                                'This course was short but very informative and very helpful for an aspiring leader like myself. It also helped me understand how to view or understand when I receive feedback. I highly recommend it!!',
                                                            textColor:
                                                                AppTheme.black,
                                                            size: 10.sp,
                                                            textAlign: TextAlign
                                                                .justify,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ]),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                              ],
                            ),
                      isIconTap
                          ? CustomFunction.customSpace(height: 123.h)
                          : CustomFunction.customSpace(height: 17.h),
                      isIconTap == true
                          ? Container()
                          : lessonOrReview == 'lesson'
                              ? Container()
                              : Row(children: [
                                  Expanded(
                                    child: TextFormField(
                                      // keyboardType: TextInputType.multiline,
                                      // maxLines: 2,
                                      controller: reviewController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppTheme.greyLight,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 12,
                                        ),
                                        hintText: 'Type here...',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "This field is required.";
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                  CustomFunction.customSpace(width: 10.w),
                                  Container(
                                    width: 50.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: AppTheme.orange,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Center(
                                      child: Icon(
                                        Icons.telegram,
                                        color: AppTheme.white,
                                        size: 30.sp,
                                      ),
                                    ),
                                  )
                                ]),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
