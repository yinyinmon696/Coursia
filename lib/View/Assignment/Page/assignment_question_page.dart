// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:coursia/Model/fileobject.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Assignment/Page/assignment_result_page.dart';
import 'package:coursia/View/Assignment/bloc/assignment_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssignmentQuestionPage extends StatelessWidget {
  AssignmentQuestionPage({super.key});

  List<FileObject> filesList = [];

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(
        text: 'Post Test (Assignment)', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<AssignmentBloc, AssignmentState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is UploadFileSuccess) {
          filesList = state.fileObjectList!;
        }

        return Padding(
            padding: EdgeInsets.all(15.w),
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                const CustomText(
                  text: 'Question 1/10',
                  textColor: AppTheme.orange,
                  textAlign: TextAlign.left,
                ),
                CustomFunction.customSpace(height: 10.h),
                const CustomText(
                  text:
                      'Identify The Different Leadership Styles And Their Characteristics ',
                  textColor: AppTheme.black,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.justify,
                ),
                CustomFunction.customSpace(height: 10.h),
                const CustomText(
                  text:
                      'There are many different leadership styles, but the most common ones can be classified as follows:',
                  textColor: AppTheme.blackLight,
                  textAlign: TextAlign.justify,
                ),
                CustomFunction.customSpace(height: 10.h),
                const CustomText(
                  text:
                      '1.Authoritative Leadership Style – This type of leader is demanding and expects their employees to follow their orders.',
                  textColor: AppTheme.blackLight,
                  textAlign: TextAlign.justify,
                ),
                CustomFunction.customSpace(height: 20.h),
                CustomButton(
                    text: 'Download Sample Assignemnt Format', onTap: () {}),
                CustomFunction.customSpace(height: 80.h),
                const CustomText(
                  text: 'Upload Assignment',
                  textColor: AppTheme.black,
                  textAlign: TextAlign.center,
                ),
                CustomFunction.customSpace(height: 10.h),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: const Icon(Icons.cancel),
                    onTap: () {
                      filesList.clear();
                      context
                          .read<AssignmentBloc>()
                          .add(UploadFile(fileObjectList: filesList));
                      // setState(() {
                      //   filesList.clear();
                      // });
                    },
                  ),
                ),
                InkWell(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowMultiple: true,
                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                    );
                    if (result != null) {
                      for (int i = 0; i < result.files.length; i++) {
                        FileObject fileObject = FileObject();

                        fileObject.filename = result.files[i].name.toString();
                        fileObject.filepath = result.files[i].path.toString();

                        // fileObject.base64 =
                        //     getBase64FormateFile(fileObject.filepath!);
                        // filedata.name = getBase64FormateFile(fileObject.filepath!);

                        filesList.add(fileObject);
                      }
                      context
                          .read<AssignmentBloc>()
                          .add(UploadFile(fileObjectList: filesList));
                      // setState(() {
                      //   filesList = filesList;
                      // });
                    }
                  },
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      dashPattern: const [8, 8],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: Center(
                          child: filesList.isEmpty
                              ? Column(
                                  children: [
                                    CustomFunction.customSpace(height: 20.h),
                                    Image.asset(
                                      'images/folder.png',
                                      height: 40.h,
                                      fit: BoxFit.contain,
                                    ),
                                    CustomFunction.customSpace(height: 10.h),
                                    const CustomText(
                                      text: 'Drag & Drop your files here',
                                      textColor: AppTheme.grey,
                                      textAlign: TextAlign.left,
                                    ),
                                    CustomFunction.customSpace(height: 20.h),
                                  ],
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: filesList.length,
                                  itemBuilder: (context, index) {
                                    return CustomText(
                                      text:
                                          filesList[index].filename.toString(),
                                      textColor: AppTheme.blackLight,
                                    );
                                  },
                                ))),
                ),
                CustomFunction.customSpace(height: 30.h),
                CustomButton(
                  onTap: () {
                    CustomFunction.navigatePage(
                        AssignmentResultPage(), context);
                  },
                  text: 'Submit',
                  textColor: AppTheme.white,
                  bgcolor: AppTheme.black,
                ),
              ],
            ));
      },
    );
  }
}
