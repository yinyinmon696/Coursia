// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Competency/Page/competency_result_page.dart';
import 'package:coursia/View/Competency/bloc/competency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompetencyQuestionPage extends StatelessWidget {
  final List<CompetencyQuestion>? competencyQuestionList;
  final CompetencyQuestion? competencyQuestion;
  final int? index;
  final int? listLength;
  final int? tapIndex;
  CompetencyQuestionPage(
      {super.key,
      this.competencyQuestionList,
      required this.competencyQuestion,
      required this.index,
      required this.listLength,
      required this.tapIndex});
  List answerList = [
    {"id": 5, "name": "Strongly Agree"},
    {"id": 4, "name": "Agree"},
    {"id": 3, "name": "Undecided"},
    {"id": 2, "name": "Disagree"},
    {"id": 1, "name": "Strongly Disagree"}
  ];
  int? onTapIndex = -1;
  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Competency Test', data: bodyData(context));
  }

  checkSelectIndex(BuildContext context) {
    if (competencyQuestionList![index!].selectAnswer == null) {
      context.read<CompetencyBloc>().add(const OnTapEvent(onTapIndex: -1));
    } else {
      context.read<CompetencyBloc>().add(
          OnTapEvent(onTapIndex: competencyQuestionList![index!].selectAnswer));
    }
  }

  bodyData(BuildContext context) {
    int no = index! + 1;
    checkSelectIndex(context);
    return BlocConsumer<CompetencyBloc, CompetencyState>(
      listener: (context, state) {
        if (state is SendCompetencyAnswerListSuccess) {
          // CustomFunction.navigatePage(
          //     CompetencyResultPage(competencyResult: state.result), context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CompetencyResultPage(competencyResult: state.result)));
        }
        if (state is SendCompetencyAnswerListFailed) {
          CustomFunction.flushBar(state.message, context,
              msgColor: AppTheme.red);
        }
      },
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }
        if (state is SendCompetencyAnswerListLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }
        return Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              children: [
                CustomText(
                  text: 'Question $no/$listLength',
                  textColor: AppTheme.orange,
                  textAlign: TextAlign.left,
                ),
                CustomFunction.customSpace(height: 20.h),
                CustomText(
                  text: competencyQuestion?.questionName ?? "",
                  textColor: AppTheme.black,
                  textAlign: TextAlign.center,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
                CustomFunction.customSpace(height: 30.h),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: answerList.length,
                    itemBuilder: (context, j) {
                      return Column(
                        children: [
                          CustomAnswerContainer(
                            text: answerList[j]["name"],
                            index: j,
                            currentIndex: onTapIndex,
                            boxColor: onTapIndex == 0 || onTapIndex == 1
                                ? AppTheme.green
                                : onTapIndex == 2
                                    ? AppTheme.grey
                                    : onTapIndex == 3 || onTapIndex == 4
                                        ? AppTheme.red
                                        : AppTheme.greyLight,
                            onTap: () {
                              selectIndex = j;
                              context
                                  .read<CompetencyBloc>()
                                  .add(OnTapEvent(onTapIndex: j));
                            },
                          ),
                          CustomFunction.customSpace(height: 10.h)
                        ],
                      );
                    },
                  ),
                ),
                // CustomFunction.customSpace(height: 20.h),
                index == 0
                    ? CustomButton(
                        onTap: () {
                          if (selectIndex == null &&
                              competencyQuestion?.selectAnswer == null) {
                            CustomFunction.flushBar(
                                'Please select one of the answers!', context,
                                msgColor: AppTheme.red);
                          } else {
                            selectIndex == null
                                ? competencyQuestion?.selectAnswer =
                                    competencyQuestionList![index!].selectAnswer
                                : competencyQuestion?.selectAnswer =
                                    selectIndex;

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompetencyQuestionPage(
                                          competencyQuestionList:
                                              competencyQuestionList,
                                          competencyQuestion:
                                              competencyQuestionList?[
                                                  index! + 1],
                                          index: index! + 1,
                                          listLength: listLength,
                                          tapIndex: onTapIndex,
                                        )));
                          }
                        },
                        text: 'Next',
                        textColor: AppTheme.white,
                        bgcolor: onTapIndex != -1
                            ? AppTheme.black
                            : AppTheme.greyDark,
                      )
                    : index == listLength! - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  selectIndex == null
                                      ? competencyQuestion?.selectAnswer =
                                          competencyQuestionList![index!]
                                              .selectAnswer
                                      : competencyQuestion?.selectAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CompetencyQuestionPage(
                                                competencyQuestionList:
                                                    competencyQuestionList,
                                                competencyQuestion:
                                                    competencyQuestionList?[
                                                        index! - 1],
                                                index: index! - 1,
                                                listLength: listLength,
                                                tapIndex: onTapIndex,
                                              )));
                                },
                                text: 'Previous',
                                textColor: AppTheme.white,
                                bgcolor: onTapIndex != -1
                                    ? AppTheme.black
                                    : AppTheme.greyDark,
                              ),
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  if (selectIndex == null &&
                                      competencyQuestion?.selectAnswer ==
                                          null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? competencyQuestion?.selectAnswer =
                                            competencyQuestionList![index!]
                                                .selectAnswer
                                        : competencyQuestion?.selectAnswer =
                                            selectIndex;
                                    retrieveAnswerList(
                                        competencyQuestionList, context);
                                    // log(competencyQuestionList.toString());
                                  }
                                },
                                text: 'Submit',
                                textColor: AppTheme.white,
                                bgcolor: onTapIndex != -1
                                    ? AppTheme.black
                                    : AppTheme.greyDark,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  selectIndex == null
                                      ? competencyQuestion?.selectAnswer =
                                          competencyQuestionList![index!]
                                              .selectAnswer
                                      : competencyQuestion?.selectAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CompetencyQuestionPage(
                                                competencyQuestionList:
                                                    competencyQuestionList,
                                                competencyQuestion:
                                                    competencyQuestionList?[
                                                        index! - 1],
                                                index: index! - 1,
                                                listLength: listLength,
                                                tapIndex: onTapIndex,
                                              )));
                                },
                                text: 'Previous',
                                textColor: AppTheme.white,
                                bgcolor: onTapIndex != -1
                                    ? AppTheme.black
                                    : AppTheme.greyDark,
                              ),
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  if (selectIndex == null &&
                                      competencyQuestion?.selectAnswer ==
                                          null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? competencyQuestion?.selectAnswer =
                                            competencyQuestionList![index!]
                                                .selectAnswer
                                        : competencyQuestion?.selectAnswer =
                                            selectIndex;

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompetencyQuestionPage(
                                                  competencyQuestionList:
                                                      competencyQuestionList,
                                                  competencyQuestion:
                                                      competencyQuestionList?[
                                                          index! + 1],
                                                  index: index! + 1,
                                                  listLength: listLength,
                                                  tapIndex: onTapIndex,
                                                )));
                                  }
                                },
                                text: 'Next',
                                textColor: AppTheme.white,
                                bgcolor: onTapIndex != -1
                                    ? AppTheme.black
                                    : AppTheme.greyDark,
                              ),
                            ],
                          ),
              ],
            ));
      },
    );
  }

  retrieveAnswerList(
      List<CompetencyQuestion>? competencyQuestionList, BuildContext context) {
    List<CompetencyAnswerModel> competencyAnswerList = [];
    competencyAnswerList.clear();
    for (int i = 0; i < competencyQuestionList!.length; i++) {
      CompetencyAnswerModel competencyAnswerModel = CompetencyAnswerModel();

      competencyAnswerModel.competencyTypeId =
          competencyQuestionList[i].competencyTypeId;
      competencyAnswerModel.competencyQuestionId = competencyQuestionList[i].id;
      competencyQuestionList[i].selectAnswer == 0
          ? competencyAnswerModel.range = 5
          : competencyQuestionList[i].selectAnswer == 1
              ? competencyAnswerModel.range = 4
              : competencyQuestionList[i].selectAnswer == 2
                  ? competencyAnswerModel.range = 3
                  : competencyQuestionList[i].selectAnswer == 3
                      ? competencyAnswerModel.range = 2
                      : competencyQuestionList[i].selectAnswer == 4
                          ? competencyAnswerModel.range = 1
                          : 0;
      competencyAnswerList.add(competencyAnswerModel);
    }
    log(competencyAnswerList.toString());
    CompetencyQuestionModel competencyQuestionModel = CompetencyQuestionModel();
    competencyQuestionModel.competencyAnswerList = competencyAnswerList;
    context
        .read<CompetencyBloc>()
        .add(SendCompetencyAnswerList(competencyQuestionModel));
  }
}
