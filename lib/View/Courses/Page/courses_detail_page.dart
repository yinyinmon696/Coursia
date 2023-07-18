// // ignore_for_file: must_be_immutable

// import 'package:coursia/UIDesign/app_theme.dart';
// import 'package:coursia/UIDesign/custom_button.dart';
// import 'package:coursia/UIDesign/custom_scaffold.dart';
// import 'package:coursia/UIDesign/custom_text.dart';
// import 'package:coursia/UIDesign/custom_video_play_card.dart';
// import 'package:coursia/UIDesign/function.dart';
// import 'package:coursia/View/Courses/Page/courses_lesson_learn_page.dart';
// import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:video_player/video_player.dart';

// class CourseDetialPage extends StatelessWidget {
//   CourseDetialPage({super.key});
//   TextEditingController reviewController = TextEditingController();

//   final FlickManager flickManager = FlickManager(
//       videoPlayerController: VideoPlayerController.network(
//           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
//   bool isIconTap = false;
//   String lessonOrReview = 'lesson';

//   @override
//   Widget build(BuildContext context) {
//     return CusotmScaffold(text: 'Course Detail', data: bodyData(context));
//   }

//   bodyData(BuildContext context) {
//     return BlocConsumer<CoursesBloc, CoursesState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         if (state is IconTapSuccess) {
//           isIconTap = state.isIconTap!;
//         }
//         if (state is OnTapLessonReviewSuccess) {
//           lessonOrReview = state.lessonOrReview!;
//         }
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: FlickVideoPlayer(flickManager: flickManager),
//               ),
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.all(15.w),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const CustomText(
//                             text: 'By Daniel Walter Scott',
//                             textColor: AppTheme.orange,
//                             textAlign: TextAlign.left,
//                           ),
//                           InkWell(
//                               onTap: () {},
//                               child: Container(
//                                 width: 100.w,
//                                 height: 25.h,
//                                 decoration: BoxDecoration(
//                                     color: AppTheme.greyLight,
//                                     borderRadius: BorderRadius.circular(20.r)),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.shopping_cart,
//                                       size: 17.sp,
//                                     ),
//                                     Text(
//                                       ' Add To Cart',
//                                       style: TextStyle(
//                                           color: AppTheme.orange,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 12.sp),
//                                     ),
//                                   ],
//                                 ),
//                               ))
//                         ],
//                       ),
//                       CustomFunction.customSpace(height: 10.h),
//                       CustomText(
//                         text: 'Online Marketing Course',
//                         textColor: AppTheme.black,
//                         size: 18.sp,
//                       ),
//                       CustomFunction.customSpace(height: 10.h),
//                       CustomText(
//                         text: '5h 30min - 10 Lessons',
//                         textColor: AppTheme.grey,
//                         size: 10.sp,
//                       ),
//                       CustomFunction.customSpace(height: 10.h),
//                       CustomText(
//                         text: 'About this course',
//                         textColor: AppTheme.black,
//                         size: 12.sp,
//                       ),
//                       CustomFunction.customSpace(height: 10.h),
//                       CustomText(
//                         text:
//                             r'Online marketing is the practice of leveraging web-based channels to spread a message about a company’s brand, products, or services to its potential customers.',
//                         textColor: AppTheme.greyDark,
//                         textAlign: TextAlign.justify,
//                         size: 12.sp,
//                       ),
//                       CustomFunction.customSpace(height: 10.h),
//                       Center(
//                         child: InkWell(
//                           onTap: () {
//                             isIconTap = !isIconTap;
//                             context
//                                 .read<CoursesBloc>()
//                                 .add(IconTap(isIconTap: isIconTap));
//                           },
//                           child: isIconTap
//                               ? Icon(
//                                   Icons.arrow_drop_down,
//                                   size: 35.sp,
//                                   color: AppTheme.grey,
//                                 )
//                               : Icon(
//                                   Icons.arrow_drop_up,
//                                   size: 35.sp,
//                                   color: AppTheme.grey,
//                                 ),
//                         ),
//                       ),
//                       isIconTap
//                           ? Container()
//                           : Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         context.read<CoursesBloc>().add(
//                                             const OnTapLessonReviewEvent(
//                                                 lessonOrReview: 'lesson'));
//                                       },
//                                       child: CustomText(
//                                         text: 'Lessons',
//                                         textColor: lessonOrReview == 'lesson'
//                                             ? AppTheme.orange
//                                             : AppTheme.grey,
//                                         textAlign: TextAlign.left,
//                                       ),
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         context.read<CoursesBloc>().add(
//                                             const OnTapLessonReviewEvent(
//                                                 lessonOrReview: 'review'));
//                                       },
//                                       child: CustomText(
//                                         text: 'Reviews',
//                                         textColor: lessonOrReview == 'review'
//                                             ? AppTheme.orange
//                                             : AppTheme.grey,
//                                         textAlign: TextAlign.left,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 CustomFunction.customSpace(height: 10.h),
//                                 lessonOrReview == 'lesson'
//                                     ? SizedBox(
//                                         height: 100.h,
//                                         width: double.infinity,
//                                         child: ListView.builder(
//                                           scrollDirection: Axis.vertical,
//                                           shrinkWrap: true,
//                                           physics: const ScrollPhysics(),
//                                           itemCount: 4,
//                                           itemBuilder: (context, index) {
//                                             return const CustomVideoPlayCard(
//                                                 leadText: '   01   ',
//                                                 titleText: 'Intro to Marketing',
//                                                 bodyText: ' 01:30 Mins',
//                                                 bodyTextColor:
//                                                     AppTheme.greyDark,
//                                                 postIcon: Icons.play_circle,
//                                                 isTimeIcon: true);
//                                           },
//                                         ),
//                                       )
//                                     : SizedBox(
//                                         height: 100.h,
//                                         child: ListView.builder(
//                                           itemCount: 3,
//                                           itemBuilder: (context, index) {
//                                             return SizedBox(
//                                               height: 120.h,
//                                               child: Card(
//                                                 child: Padding(
//                                                   padding: EdgeInsets.all(8.w),
//                                                   child: Column(children: [
//                                                     Row(
//                                                       children: [
//                                                         CustomFunction
//                                                             .customSpace(
//                                                                 width: 5.w),
//                                                         CircleAvatar(
//                                                           child: Image.asset(
//                                                             'images/boy.png',
//                                                             width: 50.w,
//                                                             height: 30.h,
//                                                             fit: BoxFit.contain,
//                                                           ),
//                                                         ),
//                                                         CustomFunction
//                                                             .customSpace(
//                                                                 width: 10.w),
//                                                         SizedBox(
//                                                           width: 185.w,
//                                                           child: CustomText(
//                                                             text:
//                                                                 'Arkar Min Myat',
//                                                             textColor:
//                                                                 AppTheme.black,
//                                                             size: 12.sp,
//                                                             textAlign:
//                                                                 TextAlign.left,
//                                                           ),
//                                                         ),
//                                                         CustomText(
//                                                           text: '12/3/2022 ',
//                                                           textColor:
//                                                               AppTheme.orange,
//                                                           size: 12.sp,
//                                                           textAlign:
//                                                               TextAlign.right,
//                                                         )
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       children: [
//                                                         CustomFunction
//                                                             .customSpace(
//                                                                 width: 50.w),
//                                                         Expanded(
//                                                           child: CustomText(
//                                                             text:
//                                                                 'This course was short but very informative and very helpful for an aspiring leader like myself. It also helped me understand how to view or understand when I receive feedback. I highly recommend it!!',
//                                                             textColor:
//                                                                 AppTheme.black,
//                                                             size: 10.sp,
//                                                             textAlign: TextAlign
//                                                                 .justify,
//                                                           ),
//                                                         )
//                                                       ],
//                                                     )
//                                                   ]),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       )
//                               ],
//                             ),
//                       isIconTap
//                           ? CustomFunction.customSpace(height: 123.h)
//                           : CustomFunction.customSpace(height: 17.h),
//                       isIconTap == true
//                           ? Container()
//                           : lessonOrReview == 'lesson'
//                               ? Row(
//                                   children: [
//                                     Container(
//                                       width: 50.w,
//                                       height: 40.h,
//                                       decoration: BoxDecoration(
//                                           color: AppTheme.black,
//                                           borderRadius:
//                                               BorderRadius.circular(10.r)),
//                                       child: const Center(
//                                         child: Icon(Icons.favorite,
//                                             color: AppTheme.white),
//                                       ),
//                                     ),
//                                     CustomFunction.customSpace(width: 10.w),
//                                     Expanded(
//                                         child: CustomButton(
//                                             text: 'Buy Now',
//                                             onTap: () {
//                                               CustomFunction.navigatePage(
//                                                   CourseLessonLearnPage(),
//                                                   context);
//                                             })),
//                                   ],
//                                 )
//                               : Row(children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       // keyboardType: TextInputType.multiline,
//                                       // maxLines: 2,
//                                       controller: reviewController,
//                                       decoration: InputDecoration(
//                                         filled: true,
//                                         fillColor: AppTheme.greyLight,
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           borderSide: const BorderSide(
//                                             width: 0,
//                                             style: BorderStyle.none,
//                                           ),
//                                         ),
//                                         contentPadding:
//                                             const EdgeInsets.symmetric(
//                                           vertical: 10.0,
//                                           horizontal: 12,
//                                         ),
//                                         hintText: 'Type here...',
//                                       ),
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return "This field is required.";
//                                         }
//                                         return null;
//                                       },
//                                       textInputAction: TextInputAction.done,
//                                     ),
//                                   ),
//                                   CustomFunction.customSpace(width: 10.w),
//                                   Container(
//                                     width: 50.w,
//                                     height: 40.h,
//                                     decoration: BoxDecoration(
//                                         color: AppTheme.orange,
//                                         borderRadius:
//                                             BorderRadius.circular(10.r)),
//                                     child: Center(
//                                       child: Icon(
//                                         Icons.telegram,
//                                         color: AppTheme.white,
//                                         size: 30.sp,
//                                       ),
//                                     ),
//                                   )
//                                 ]),
//                       // CustomFunction.customSpace(height: 100.h)
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/Model/static_data.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_video_play_card.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Courses/Page/courses_lesson_learn_page.dart';
import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class CourseDetialPage extends StatefulWidget {
  const CourseDetialPage({super.key});

  @override
  State<CourseDetialPage> createState() => _CourseDetialPageState();
}

class _CourseDetialPageState extends State<CourseDetialPage> {
  TextEditingController reviewController = TextEditingController();

  bool isIconTap = false;

  String lessonOrReview = 'lesson';

  String? videoUrl = '';

  var isVisible = true;
  bool? isWatched;
  VideoPlayerController videoPlayerController = VideoPlayerController.asset("");

  @override
  void initState() {
    super.initState();
    context
        .read<CoursesBloc>()
        .add(PlayVideo(videoUrl: StaticData.videoList[0]['name'], index: 0));
  }

  // void checkVideo(int index) {
  //   if (videoPlayerController.value.position ==
  //       const Duration(seconds: 0, minutes: 0, hours: 0)) {
  //     log('video Started');
  //   }

  //   if (videoPlayerController.value.position ==
  //       videoPlayerController.value.duration) {
  //     log('video Ended');
  //     // context
  //     //     .read<CoursesBloc>()
  //     //     .add(PlayVideo(videoUrl: StaticData.videoList[index! + 1]['name']));
  //   }
  // }

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
        if (state is ScrollSuccess) {
          isVisible = state.isScroll;
        }
        if (state is PlayVideoSuccess) {
          videoUrl = state.videoUrl;
          videoPlayerController = VideoPlayerController.asset(videoUrl!);
          videoPlayerController.addListener(() {
            if (videoPlayerController.value.position ==
                const Duration(seconds: 0, minutes: 0, hours: 0)) {
              log('video Started');
            }

            if (videoPlayerController.value.position ==
                videoPlayerController.value.duration) {
              log('video Ended');
              if (state.index != StaticData.videoList.length - 1) {
                StaticData.videoList[state.index + 1]['isWatched'] = true;
                context.read<CoursesBloc>().add(PlayVideo(
                    videoUrl: StaticData.videoList[state.index + 1]['name'],
                    index: state.index + 1));
              } else {
                log("No video to play");
              }
            }
          });
        }
        if (state is PlayVideoLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }

        return Column(
          children: [
            videoUrl == ''
                ? const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Center(
                      child: CustomText(
                        text: 'Something went wrong!',
                        textColor: AppTheme.blackLight,
                      ),
                    ),
                  )
                : FlickVideoPlayer(
                    flickManager: FlickManager(
                        videoPlayerController: videoPlayerController)),
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  context
                      .read<CoursesBloc>()
                      .add(const Scroll(isScroll: false));
                  // _onStartScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollUpdateNotification) {
                  context
                      .read<CoursesBloc>()
                      .add(const Scroll(isScroll: false));
                  // _onUpdateScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollEndNotification) {
                  context.read<CoursesBloc>().add(const Scroll(isScroll: true));
                  // _onEndScroll(scrollNotification.metrics);
                }
                return true;
              },
              child: Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: 'By Daniel Walter Scott',
                              textColor: AppTheme.orange,
                              textAlign: TextAlign.left,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100.w,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                      color: AppTheme.greyLight,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        size: 17.sp,
                                      ),
                                      Text(
                                        ' Add To Cart',
                                        style: TextStyle(
                                            color: AppTheme.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
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
                                          // height: double.infinity,
                                          width: double.infinity,
                                          child: ListView.builder(
                                            // scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                StaticData.videoList.length,
                                            itemBuilder: (context, index) {
                                              return CustomVideoPlayCard(
                                                  onTap: () {
                                                    // context
                                                    //     .read<CoursesBloc>()
                                                    //     .add(PlayVideo(
                                                    //         videoUrl: StaticData
                                                    //                 .videoList[
                                                    //             index]['name'],
                                                    //         index: index));
                                                  },
                                                  isWatched: StaticData
                                                          .videoList[index]
                                                      ['isWatched'],
                                                  leadText: '   01   ',
                                                  titleText: StaticData
                                                      .videoList[index]['name'],
                                                  bodyText: ' 01:30 Mins',
                                                  bodyTextColor:
                                                      AppTheme.greyDark,
                                                  postIcon: Icons.play_circle,
                                                  isTimeIcon: true);
                                            },
                                          ),
                                        )
                                      : SizedBox(
                                          // height: 100.h,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 10,
                                            itemBuilder: (context, index) {
                                              return SizedBox(
                                                height: 120.h,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.w),
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
                                                              fit: BoxFit
                                                                  .contain,
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
                                                                  AppTheme
                                                                      .black,
                                                              size: 12.sp,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
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
                                                                  AppTheme
                                                                      .black,
                                                              size: 10.sp,
                                                              textAlign:
                                                                  TextAlign
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
                                        ),
                                  CustomFunction.customSpace(height: 50)
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            isIconTap == true
                ? Container()
                : lessonOrReview == 'lesson'
                    ? Visibility(
                        visible: isVisible,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0).w,
                          child: Row(
                            children: [
                              Container(
                                width: 50.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color: AppTheme.black,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: const Center(
                                  child: Icon(Icons.favorite,
                                      color: AppTheme.white),
                                ),
                              ),
                              CustomFunction.customSpace(width: 10.w),
                              Expanded(
                                  child: CustomButton(
                                      text: 'Buy Now',
                                      onTap: () {
                                        CustomFunction.navigatePage(
                                            CourseLessonLearnPage(), context);
                                      })),
                            ],
                          ),
                        ),
                      )
                    : Visibility(
                        visible: isVisible,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0).w,
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                // keyboardType: TextInputType.multiline,
                                // maxLines: 2,
                                controller: reviewController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppTheme.greyLight,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
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
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                child: Icon(
                                  Icons.telegram,
                                  color: AppTheme.white,
                                  size: 30.sp,
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
          ],
        );
      },
    );
  }
}
