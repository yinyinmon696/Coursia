// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/Utils/api_service.dart';
import 'package:coursia/View/Blog/Page/blog_detail_page.dart';
import 'package:coursia/View/Blog/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BlogListPage extends StatelessWidget {
  int? blogTypeId;
  String? blogTypeName;
  BlogListPage(
      {super.key, required this.blogTypeId, required this.blogTypeName});

  @override
  Widget build(BuildContext context) {
    context.read<BlogBloc>().add(GetBlogList(blogTypeId: blogTypeId));
    return WillPopScope(
        onWillPop: () async {
          context.read<BlogBloc>().add(const GetBlogTypeList());
          return true;
        },
        child: CusotmScaffold(text: "Blog", data: bodyData(context)));

    ///blogTypeName ?? "" (If you want to show blog type,use it)
  }

  bodyData(BuildContext context) {
    return BlocConsumer<BlogBloc, BlogState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BlogListLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }
        if (state is BlogListSuccess) {
          if (state.blogList.isEmpty) {
            return const Center(
                child: CustomText(
                    text: "There is no data.",
                    textColor: AppTheme.black,
                    textAlign: TextAlign.justify));
          }
          return Padding(
              padding: EdgeInsets.all(15.w),
              child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    // CustomFunction.customSpace(height: 20.h),
                    // Image.asset(
                    //   'images/travel.png',
                    //   height: 150.h,
                    //   fit: BoxFit.contain,
                    // ),
                    // CustomFunction.customSpace(height: 10.h),
                    // const CustomText(
                    //     text: 'Traveling',
                    //     textColor: AppTheme.black,
                    //     textAlign: TextAlign.left),
                    // CustomFunction.customSpace(height: 20.h),
                    // const CustomText(
                    //     text: 'A while back, we were travelling in London.',
                    //     textColor: AppTheme.black,
                    //     size: 20,
                    //     textAlign: TextAlign.left),
                    // CustomFunction.customSpace(height: 20.h),
                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     CustomText(
                    //         text: 'July-24, 2022',
                    //         textColor: AppTheme.black,
                    //         textAlign: TextAlign.left),
                    //     CustomText(
                    //         text: 'Arkar Min Myat',
                    //         textColor: AppTheme.black,
                    //         fontWeight: FontWeight.bold,
                    //         size: 13,
                    //         textAlign: TextAlign.left),
                    //   ],
                    // ),
                    // CustomFunction.customSpace(height: 20.h),
                    // const Divider(
                    //   color: AppTheme.black,
                    // ),
                    CustomFunction.customSpace(height: 20.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: state.blogList.length,
                      itemBuilder: (context, index) {
                        String? createDate = state.blogList[index].createdAt;
                        DateTime? date = DateTime.parse(createDate ?? "");
                        String createdDate =
                            DateFormat('dd-MMM-yyyy').format(date);
                        return InkWell(
                          onTap: () {
                            CustomFunction.navigatePage(
                                BlogDetailPage(
                                  index: index,
                                  blogList: state.blogList,
                                  blogTypeId: blogTypeId,
                                ),
                                context);
                          },
                          child: Column(
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      "${APIService.IMAGE_URL}${state.blogList[index].imageModel?.filePath}/${state.blogList[index].imageModel?.fileName}",
                                      fit: BoxFit.contain,
                                      height: 150,
                                      width: 150.w,
                                      errorBuilder: (context, url, error) =>
                                          const Icon(
                                        Icons.photo,
                                        size: 160,
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
                                    CustomFunction.customSpace(width: 10.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                  text: state.blogList[index]
                                                          .blogType?.name ??
                                                      "",
                                                  textColor: AppTheme.black,
                                                  size: 12,
                                                  textAlign: TextAlign.left),
                                              CustomFunction.customSpace(
                                                  width: 10),
                                              Expanded(
                                                child: CustomText(
                                                    text: createdDate,
                                                    textColor: AppTheme.black,
                                                    size: 12,
                                                    textAlign: TextAlign.right),
                                              )
                                            ],
                                          ),
                                          CustomFunction.customSpace(
                                              height: 10.h),
                                          CustomText(
                                              text:
                                                  state.blogList[index].title ??
                                                      "",
                                              textColor: AppTheme.black,
                                              textAlign: TextAlign.justify),
                                          CustomFunction.customSpace(
                                              height: 10.h),
                                          CustomText(
                                              text: state.blogList[index]
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
                        );
                      },
                    ),
                  ]));
        }
        if (state is BlogListFailed) {
          return Center(
            child: CustomText(text: state.message),
          );
        }
        return Container();
      },
    );
  }
}
