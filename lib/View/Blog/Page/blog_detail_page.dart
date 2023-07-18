// ignore_for_file: must_be_immutable

import 'package:coursia/Model/blog_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/Utils/api_service.dart';
import 'package:coursia/View/Blog/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BlogDetailPage extends StatelessWidget {
  int? index;
  List<BlogModel>? blogList;
  int? blogTypeId;
  BlogDetailPage({super.key, this.index, this.blogList, this.blogTypeId});

  String? createdDate1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.read<BlogBloc>().add(GetBlogList(blogTypeId: blogTypeId));
          return true;
        },
        child: CusotmScaffold(text: 'Blog', data: bodyData(context)));
  }

  bodyData(BuildContext context) {
    String? createDate = blogList?[index!].createdAt;
    DateTime? date = DateTime.parse(createDate ?? "");
    String createdDate = DateFormat('dd-MMM-yyyy').format(date);

    int? listLength = blogList?.length;
    if (index != listLength! - 1) {
      String? createDate1 = blogList?[index! + 1].createdAt;
      DateTime? date1 = DateTime.parse(createDate1 ?? "");
      createdDate1 = DateFormat('dd-MMM-yyyy').format(date1);
    }
    return Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              CustomText(
                  text: blogList?[index!].blogType?.name ?? "",
                  textColor: AppTheme.black,
                  textAlign: TextAlign.left),
              CustomFunction.customSpace(height: 20.h),
              Image.network(
                "${APIService.IMAGE_URL}${blogList?[index!].imageModel?.filePath}/${blogList?[index!].imageModel?.fileName}",
                fit: BoxFit.contain,
                height: 150,
                width: 150.w,
                errorBuilder: (context, url, error) => const Icon(
                  Icons.photo,
                  size: 150,
                  color: Colors.grey,
                ),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CustomLoading(),
                  );
                },
              ),
              CustomFunction.customSpace(height: 30.h),
              CustomText(
                  text: blogList?[index!].title ?? "",
                  textColor: AppTheme.black,
                  size: 20,
                  textAlign: TextAlign.left),
              CustomFunction.customSpace(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: createdDate,
                      textColor: AppTheme.black,
                      textAlign: TextAlign.left),
                  CustomText(
                      text: blogList?[index!].authorName ?? "",
                      textColor: AppTheme.black,
                      fontWeight: FontWeight.bold,
                      size: 13,
                      textAlign: TextAlign.left),
                ],
              ),
              CustomFunction.customSpace(height: 20.h),
              CustomText(
                  text: blogList?[index!].content,
                  textColor: AppTheme.black,
                  size: 14,
                  textAlign: TextAlign.justify),
              CustomFunction.customSpace(height: 20.h),
              const Divider(
                color: AppTheme.black,
              ),
              index == listLength - 1
                  ? Container()
                  : InkWell(
                      onTap: () {
                        CustomFunction.navigatePage(
                            BlogDetailPage(
                              index: index! + 1,
                              blogList: blogList,
                              blogTypeId: blogTypeId,
                            ),
                            context);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFunction.customSpace(height: 20.h),
                          const CustomText(
                              text: 'Next Articles',
                              textColor: AppTheme.black,
                              textAlign: TextAlign.left),
                          CustomFunction.customSpace(height: 20.h),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  "${APIService.IMAGE_URL}${blogList?[index! + 1].imageModel?.filePath}/${blogList?[index! + 1].imageModel?.fileName}",
                                  fit: BoxFit.contain,
                                  height: 150,
                                  width: 150.w,
                                  errorBuilder: (context, url, error) =>
                                      const Icon(
                                    Icons.photo,
                                    size: 150,
                                    color: Colors.grey,
                                  ),
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return const Center(
                                      child: CustomLoading(),
                                    );
                                  },
                                ),
                                CustomFunction.customSpace(width: 5.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                              text: blogList?[index!]
                                                      .blogType
                                                      ?.name ??
                                                  "",
                                              textColor: AppTheme.black,
                                              size: 12,
                                              textAlign: TextAlign.left),
                                          CustomFunction.customSpace(width: 20),
                                          Expanded(
                                            child: CustomText(
                                                text: createdDate1,
                                                textColor: AppTheme.black,
                                                size: 12,
                                                textAlign: TextAlign.right),
                                          )
                                        ],
                                      ),
                                      CustomFunction.customSpace(height: 10.h),
                                      CustomText(
                                          text:
                                              blogList?[index! + 1].title ?? "",
                                          textColor: AppTheme.black,
                                          textAlign: TextAlign.justify),
                                      CustomFunction.customSpace(height: 10.h),
                                      CustomText(
                                          text: blogList?[index! + 1]
                                                  .authorName ??
                                              "",
                                          textColor: AppTheme.black,
                                          fontWeight: FontWeight.bold,
                                          size: 12,
                                          textAlign: TextAlign.left)
                                    ],
                                  ),
                                )
                              ]),
                          CustomFunction.customSpace(height: 20.h),
                          const Divider(
                            color: AppTheme.grey,
                          ),
                          CustomFunction.customSpace(height: 20.h),
                        ],
                      ),
                    )
            ]));
  }
}
