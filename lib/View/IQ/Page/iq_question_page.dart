// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/Utils/api_service.dart';
import 'package:coursia/View/IQ/Page/iq_result_page.dart';
import 'package:coursia/View/IQ/bloc/iq_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IqQuestionPage extends StatelessWidget {
  final List<IqQuestion>? iqQuestionList;
  final IqQuestion? iqQuestion;
  final int? index;
  final int? listLength;
  final int? tapIndex;
  IqQuestionPage(
      {super.key,
      required this.iqQuestionList,
      required this.iqQuestion,
      required this.index,
      required this.listLength,
      required this.tapIndex});

  int? onTapIndex = -1;
  int? selectIndex;
  List<IQAnswerModel> iqAnswerList = [];

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'iQ Test', data: bodyData(context));
  }

  checkSelectIndex(BuildContext context) {
    if (iqQuestionList![index!].selectIqAnswer == null) {
      context.read<IqBloc>().add(const OnTapEvent(onTapIndex: -1));
    } else {
      context
          .read<IqBloc>()
          .add(OnTapEvent(onTapIndex: iqQuestionList![index!].selectIqAnswer));
    }
  }

  bodyData(BuildContext context) {
    int no = index! + 1;
    checkSelectIndex(context);
    return BlocConsumer<IqBloc, IQState>(
      listener: (context, state) {
        if (state is SendIQAnswerListSuccess) {
          // CustomFunction.navigatePage(
          //     IQResultPage(iqResult: state.result), context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => IQResultPage(iqResult: state.result)));
        }
        if (state is SendIQAnswerListFailed) {
          CustomFunction.flushBar(state.message, context,
              msgColor: AppTheme.red);
        }
      },
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }
        if (state is SendIQAnswerListLoading) {
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
                CustomFunction.customSpace(height: 10.h),
                Image.network(
                  "${APIService.IMAGE_URL}${iqQuestionList?[index!].imageModel?.filePath}/${iqQuestionList?[index!].imageModel?.fileName}",
                  fit: BoxFit.fill,
                  height: 150,
                  errorBuilder: (context, url, error) => const Icon(
                    Icons.photo,
                    size: 150,
                    color: Colors.grey,
                  ),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CustomLoading(),
                    );
                  },
                ),
                CustomFunction.customSpace(height: 20.h),
                CustomText(
                  text: iqQuestionList?[index!].questionName ?? "",
                  textColor: AppTheme.black,
                  textAlign: TextAlign.center,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
                CustomFunction.customSpace(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: iqQuestionList![index!].iqAnswer?.length,
                    itemBuilder: (context, j) {
                      return Column(
                        children: [
                          CustomAnswerContainer(
                            text: iqQuestionList![index!].iqAnswer?[j].answer ??
                                "",
                            index: j,
                            currentIndex: onTapIndex,
                            boxColor: AppTheme.orange,
                            onTap: () {
                              log(j.toString());
                              selectIndex = j;
                              context
                                  .read<IqBloc>()
                                  .add(OnTapEvent(onTapIndex: j));
                            },
                          ),
                          CustomFunction.customSpace(height: 10)
                        ],
                      );
                    },
                  ),
                ),
                CustomFunction.customSpace(height: 20.h),
                index == 0
                    ? CustomButton(
                        onTap: () {
                          if (selectIndex == null &&
                              iqQuestion?.selectIqAnswer == null) {
                            CustomFunction.flushBar(
                                'Please select one of the answers!', context,
                                msgColor: AppTheme.red);
                          } else {
                            selectIndex == null
                                ? iqQuestion?.selectIqAnswer =
                                    iqQuestionList![index!].selectIqAnswer
                                : iqQuestion?.selectIqAnswer = selectIndex;

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IqQuestionPage(
                                          iqQuestionList: iqQuestionList,
                                          iqQuestion:
                                              iqQuestionList?[index! + 1],
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
                                      ? iqQuestion?.selectIqAnswer =
                                          iqQuestionList![index!].selectIqAnswer
                                      : iqQuestion?.selectIqAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => IqQuestionPage(
                                                iqQuestionList: iqQuestionList,
                                                iqQuestion:
                                                    iqQuestionList?[index! - 1],
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
                                      iqQuestion?.selectIqAnswer == null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? iqQuestion?.selectIqAnswer =
                                            iqQuestionList![index!]
                                                .selectIqAnswer
                                        : iqQuestion?.selectIqAnswer =
                                            selectIndex;
                                    retrieveAnswerList(iqQuestionList, context);
                                    log(iqQuestionList.toString());
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
                                      ? iqQuestion?.selectIqAnswer =
                                          iqQuestionList![index!].selectIqAnswer
                                      : iqQuestion?.selectIqAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => IqQuestionPage(
                                                iqQuestionList: iqQuestionList,
                                                iqQuestion:
                                                    iqQuestionList?[index! - 1],
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
                                      iqQuestion?.selectIqAnswer == null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? iqQuestion?.selectIqAnswer =
                                            iqQuestionList![index!]
                                                .selectIqAnswer
                                        : iqQuestion?.selectIqAnswer =
                                            selectIndex;

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IqQuestionPage(
                                                  iqQuestionList:
                                                      iqQuestionList,
                                                  iqQuestion: iqQuestionList?[
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

  retrieveAnswerList(List<IqQuestion>? iqQuestionList, BuildContext context) {
    List<IQAnswerModel> iqAnswerList = [];
    iqAnswerList.clear();
    for (int i = 0; i < iqQuestionList!.length; i++) {
      IQAnswerModel iqAnswerModel = IQAnswerModel();

      iqAnswerModel.iqTypeId = iqQuestionList[i].iqTypeId;
      iqAnswerModel.iqQuestionId = iqQuestionList[i]
          .iqAnswer?[iqQuestionList[i].selectIqAnswer!]
          .iqQuestionId;
      iqAnswerModel.iqAnswerId =
          iqQuestionList[i].iqAnswer?[iqQuestionList[i].selectIqAnswer!].id;
      iqAnswerList.add(iqAnswerModel);
    }
    log(iqAnswerList.toString());
    IQQuestionModel iqQuestionModel = IQQuestionModel();
    iqQuestionModel.iqAnswerList = iqAnswerList;
    context.read<IqBloc>().add(SendIQAnswerList(iqQuestionModel));
  }
}
