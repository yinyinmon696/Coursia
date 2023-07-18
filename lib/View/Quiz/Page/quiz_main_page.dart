// ignore_for_file: must_be_immutable

import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/Utils/api_service.dart';
import 'package:coursia/View/Quiz/Page/quiz_question_page.dart';
import 'package:coursia/View/Quiz/Page/quiz_result_page.dart';
import 'package:coursia/View/Quiz/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizMainPage extends StatelessWidget {
  QuizMainPage({
    super.key,
  });

  List<QuizTypeModel> quizTypeList = [];
  QuizQuestionModel? quizQuestionModel;
  bool isTest = false;

  @override
  Widget build(BuildContext context) {
    context.read<QuizBloc>().add(const GetQuizTypeEvent());
    return CusotmScaffold(text: 'Quiz', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is GetQuizQuestionListSuccess) {
          quizQuestionModel = state.quizQuestionModel;
          context.read<QuizBloc>().add(const GetQuizTypeEvent());
          if (quizQuestionModel!.quizQuestion!.isEmpty) {
            CustomFunction.flushBar('There is no Quiz Question List!', context,
                msgColor: AppTheme.red);
          } else {
            if (quizQuestionModel!.result == null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizQuestionPage(
                            quizQuestionList: quizQuestionModel?.quizQuestion,
                            quizQuestion: quizQuestionModel?.quizQuestion?[0],
                            index: 0,
                            listLength: quizQuestionModel?.quizQuestion?.length,
                            tapIndex: -1,
                          )));
            } else {
              CustomFunction.navigatePage(
                  QuizResultPage(result: quizQuestionModel?.result), context);
            }
          }
        }
        if (state is GetQuizQuestionListFailed) {
          context.read<QuizBloc>().add(const GetQuizTypeEvent());
          CustomFunction.flushBar(state.message, context,
              msgColor: AppTheme.red);
        }
      },
      builder: (context, state) {
        if (state is GetQuizTypeLoading ||
            state is GetQuizQuestionListLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }

        if (state is GetQuizTypeSuccess) {
          quizTypeList = state.quizTypeList;
          return quizTypeList.isEmpty
              ? const Center(
                  child: CustomText(
                    text: 'There is no data.',
                    textColor: AppTheme.black,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(15.w),
                  child: ListView(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: quizTypeList.length,
                          itemBuilder: (context, index) {
                            if (index == 0 ||
                                index > 0 &&
                                    quizTypeList[index - 1].lock == true) {
                              isTest = true;
                            } else {
                              isTest = false;
                            }
                            return Column(
                              children: [
                                Container(
                                  height: 150.h,
                                  decoration: const BoxDecoration(
                                      color: AppTheme.greyLight),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.w),
                                    child: Row(children: [
                                      Image.network(
                                        "${APIService.IMAGE_URL}${quizTypeList[index].image?.filePath}/${quizTypeList[index].image?.fileName}",
                                        fit: BoxFit.fill,
                                        height: 150,
                                        width: 170.w,
                                        errorBuilder: (context, url, error) =>
                                            const Icon(
                                          Icons.photo,
                                          size: 185,
                                          color: Colors.grey,
                                        ),
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                            child: SizedBox(
                                                height: 150,
                                                width: 170.w,
                                                child: const CustomLoading()),
                                          );
                                        },
                                      ),
                                      CustomFunction.customSpace(width: 20.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomText(
                                                text: quizTypeList[index].name,
                                                textColor: AppTheme.black),
                                            CustomText(
                                                text:
                                                    "${quizTypeList[index].totalQuestion} quiz",
                                                textColor: AppTheme.black,
                                                size: 11.sp),
                                            isTest == true
                                                ? CustomButton(
                                                    bgcolor: AppTheme.black,
                                                    text: 'Test Now ->',
                                                    fontSize: 12.sp,
                                                    onTap: () {
                                                      context.read<QuizBloc>().add(
                                                          GetQuizQuestionListEvent(
                                                              quizTypeId:
                                                                  quizTypeList[
                                                                          index]
                                                                      .id));
                                                    },
                                                    width: 90.w,
                                                    height: 25.h,
                                                    textColor: AppTheme.white,
                                                    borderRadius: 20.r)
                                                : const CircleAvatar(
                                                    backgroundColor:
                                                        AppTheme.orangeLight,
                                                    child: Icon(
                                                      Icons.lock,
                                                      color: AppTheme.orange,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                                CustomFunction.customSpace(height: 10.h)
                              ],
                            );
                          }),
                    ],
                  ),
                );
        }
        if (state is GetQuizTypeFailed) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: state.message.toString(), textColor: AppTheme.red),
                CustomFunction.customSpace(height: 10),
                CustomButton(
                    width: 150.w,
                    text: 'Reload Quiz Type',
                    onTap: () {
                      context.read<QuizBloc>().add(const GetQuizTypeEvent());
                    }),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
