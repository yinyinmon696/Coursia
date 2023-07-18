// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/DISC/Page/disc_result_page.dart';
import 'package:coursia/View/DISC/bloc/disc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DISCQuestionPage extends StatelessWidget {
  final List<DiscQuestion>? discQuestionList;
  final DiscQuestion? discQuestionModel;
  final int? index;
  final int? listLength;
  final int? tapIndex;
  List<String> answerList = [];
  DISCQuestionPage(
      {super.key,
      required this.discQuestionList,
      required this.discQuestionModel,
      required this.index,
      required this.listLength,
      required this.tapIndex});

  int? onTapIndex = -1;
  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'DISC Test', data: bodyData(context));
  }

  checkSelectIndex(BuildContext context) {
    if (discQuestionList?[index!].selectIndex == null) {
      context.read<DISCBloc>().add(const DISCOnTapEvent(onTapIndex: -1));
    } else {
      context.read<DISCBloc>().add(
          DISCOnTapEvent(onTapIndex: discQuestionList?[index!].selectIndex));
    }
  }

  bodyData(BuildContext context) {
    // log(StaticData.discAnswerList.toString());

    int no = index! + 1;
    checkSelectIndex(context);
    return BlocConsumer<DISCBloc, DISCState>(
      listener: (context, state) {
        if (state is SendDISCAnswerListSuccess) {
          // CustomFunction.navigatePage(
          //     DISCResultPage(result: state.result), context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DISCResultPage(result: state.result)));
        }
        if (state is SendDISCAnswerListFailed) {
          CustomFunction.flushBar(state.message, context,
              msgColor: AppTheme.red);
        }
      },
      builder: (context, state) {
        if (state is DISCOnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }
        if (state is SendDISCAnswerListLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }
        return Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFunction.customSpace(height: 10.h),
              CustomText(
                text: 'Question $no/$listLength',
                textColor: AppTheme.orange,
              ),
              CustomFunction.customSpace(height: 40.h),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: discQuestionList?[index!].questions?.length,
                  itemBuilder: (context, j) {
                    return Column(
                      children: [
                        CustomAnswerContainer(
                          text: discQuestionList?[index!]
                                  .questions?[j]
                                  .questionName ??
                              "",
                          index: j,
                          currentIndex: onTapIndex,
                          boxColor: AppTheme.orange,
                          onTap: () {
                            selectIndex = j;
                            context
                                .read<DISCBloc>()
                                .add(DISCOnTapEvent(onTapIndex: j));
                          },
                        ),
                        CustomFunction.customSpace(height: 10)
                      ],
                    );
                  },
                ),
              ),
              // CustomFunction.customSpace(height: 50),
              index == 0
                  ? CustomButton(
                      onTap: () {
                        if (selectIndex == null &&
                            discQuestionList?[index!].selectIndex == null) {
                          CustomFunction.flushBar(
                              'Please select one of the answers!', context,
                              msgColor: AppTheme.red);
                        } else {
                          selectIndex == null
                              ? discQuestionModel?.selectIndex =
                                  discQuestionList![index!].selectIndex
                              : discQuestionModel?.selectIndex = selectIndex;

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DISCQuestionPage(
                                  discQuestionList: discQuestionList,
                                  discQuestionModel:
                                      discQuestionList?[index! + 1],
                                  index: index! + 1,
                                  listLength: listLength,
                                  tapIndex: onTapIndex,
                                ),
                                //  DISCQuestionPage(
                                //       discQuestionList: discQuestionList,
                                //       discQuestionModel:
                                //           discQuestionList?[index! + 1],
                                //       index: index! + 1,
                                //       listLength: listLength,
                                //       tapIndex: onTapIndex,
                                //     )
                              ));
                        }
                      },
                      text: 'Next',
                      textColor: AppTheme.white,
                      bgcolor:
                          onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                    )
                  : index == listLength! - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              width: 150.w,
                              onTap: () {
                                selectIndex == null
                                    ? discQuestionModel?.selectIndex =
                                        discQuestionList![index!].selectIndex
                                    : discQuestionModel?.selectIndex =
                                        selectIndex;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DISCQuestionPage(
                                              discQuestionList:
                                                  discQuestionList,
                                              discQuestionModel:
                                                  discQuestionList?[index! - 1],
                                              index: index! - 1,
                                              listLength: listLength,
                                              tapIndex: onTapIndex,
                                            )));
                                // CustomFunction.navigatePage(
                                //     DISCQuestionPage(
                                //       discQuestionList: discQuestionList,
                                //       discQuestionModel:
                                //           discQuestionList?[index! - 1],
                                //       index: index! - 1,
                                //       listLength: listLength,
                                //     ),
                                //     context);
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
                                    discQuestionModel?.selectIndex == null) {
                                  CustomFunction.flushBar(
                                      'Please select one of the answers!',
                                      context,
                                      msgColor: AppTheme.red);
                                } else {
                                  selectIndex == null
                                      ? discQuestionModel?.selectIndex =
                                          discQuestionList![index!].selectIndex
                                      : discQuestionModel?.selectIndex =
                                          selectIndex;
                                  retrieveAnswerList(discQuestionList, context);

                                  // log(discQuestionList.toString());
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
                                    ? discQuestionModel?.selectIndex =
                                        discQuestionList![index!].selectIndex
                                    : discQuestionModel?.selectIndex =
                                        selectIndex;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DISCQuestionPage(
                                              discQuestionList:
                                                  discQuestionList,
                                              discQuestionModel:
                                                  discQuestionList?[index! - 1],
                                              index: index! - 1,
                                              listLength: listLength,
                                              tapIndex: onTapIndex,
                                            )));

                                // CustomFunction.navigatePage(
                                //     DISCQuestionPage(
                                //       discQuestionList: discQuestionList,
                                //       discQuestionModel:
                                //           discQuestionList?[index! - 1],
                                //       index: index! - 1,
                                //       listLength: listLength,
                                //     ),
                                //     context);
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
                                    discQuestionModel?.selectIndex == null) {
                                  CustomFunction.flushBar(
                                      'Please select one of the answers!',
                                      context,
                                      msgColor: AppTheme.red);
                                } else {
                                  selectIndex == null
                                      ? discQuestionModel?.selectIndex =
                                          discQuestionList![index!].selectIndex
                                      : discQuestionModel?.selectIndex =
                                          selectIndex;

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DISCQuestionPage(
                                                discQuestionList:
                                                    discQuestionList,
                                                discQuestionModel:
                                                    discQuestionList?[
                                                        index! + 1],
                                                index: index! + 1,
                                                listLength: listLength,
                                                tapIndex: onTapIndex,
                                              )));
                                }

                                // CustomFunction.navigatePage(
                                //     DISCQuestionPage(
                                //       discQuestionList: discQuestionList,
                                //       discQuestionModel:
                                //           discQuestionList?[index! + 1],
                                //       index: index! + 1,
                                //       listLength: listLength,
                                //     ),
                                //     context);
                              },
                              text: 'Next',
                              textColor: AppTheme.white,
                              bgcolor: onTapIndex != -1
                                  ? AppTheme.black
                                  : AppTheme.greyDark,
                            ),
                          ],
                        )
            ],
          ),
        );
      },
    );
  }

  retrieveAnswerList(
      List<DiscQuestion>? discQuestionList, BuildContext context) {
    DISCQuestionModel discQuestionModel = DISCQuestionModel();
    answerList.clear();
    for (int i = 0; i < discQuestionList!.length; i++) {
      int j = discQuestionList[i].selectIndex!;
      var index1 = discQuestionList[i].questions!.elementAt(j);
      log(index1.toString());
      answerList.add(index1.type.toString());
    }
    discQuestionModel.answerList = answerList;
    context.read<DISCBloc>().add(SendDISCAnswerList(discQuestionModel));
  }
}
