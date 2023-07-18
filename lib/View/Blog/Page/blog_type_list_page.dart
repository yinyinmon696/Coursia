// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_loading.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/Utils/api_service.dart';
import 'package:coursia/View/Blog/Page/blog_list_page.dart';
import 'package:coursia/View/Blog/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogTypeListPage extends StatelessWidget {
  const BlogTypeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Blog Type', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    context.read<BlogBloc>().add(const GetBlogTypeList());
    return BlocConsumer<BlogBloc, BlogState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BlogTypeListLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }
        if (state is BlogTypeListFailed) {
          return Center(
            child: CustomText(text: state.message),
          );
        }
        if (state is BlogTypeListSuccess) {
          if (state.blogTypeList.isEmpty) {
            return const Center(
                child: CustomText(
              text: 'There is no data.',
              textColor: AppTheme.black,
            ));
          } else {
            return Padding(
                padding: EdgeInsets.all(15.w),
                child: ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      CustomFunction.customSpace(height: 20.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: state.blogTypeList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  CustomFunction.navigatePage(
                                      BlogListPage(
                                          blogTypeId:
                                              state.blogTypeList[index].id,
                                          blogTypeName:
                                              state.blogTypeList[index].name),
                                      context);
                                },
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        "${APIService.IMAGE_URL}${state.blogTypeList[index].imageModel?.filePath}/${state.blogTypeList[index].imageModel?.fileName}",
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
                                        child: CustomText(
                                            text:
                                                state.blogTypeList[index].name,
                                            textColor: AppTheme.black,
                                            textAlign: TextAlign.justify),
                                      )
                                    ]),
                              ),
                              CustomFunction.customSpace(height: 20.h),
                              const Divider(
                                color: AppTheme.grey,
                              ),
                              CustomFunction.customSpace(height: 20.h),
                            ],
                          );
                        },
                      ),
                    ]));
          }
        }
        return Container();
      },
    );
  }
}
