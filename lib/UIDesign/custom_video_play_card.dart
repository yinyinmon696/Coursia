import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVideoPlayCard extends StatelessWidget {
  final String? leadText;
  final String? titleText;
  final String? bodyText;
  final Color? bodyTextColor;
  final bool? isTimeIcon;
  final IconData? postIcon;
  final bool? isWatched;
  final void Function()? onTap;

  const CustomVideoPlayCard(
      {super.key,
      required this.leadText,
      required this.titleText,
      required this.bodyText,
      this.bodyTextColor,
      this.isTimeIcon,
      required this.postIcon,
      required this.isWatched,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 70.h,
        child: Card(
          child: Row(children: [
            CustomText(
              text: leadText, //'   01   ',
              size: 20.sp,
              textColor: AppTheme.greyDark,
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: bodyText == ''
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: titleText, //'Intro to Marketing',
                    textColor: AppTheme.black,
                    textAlign: TextAlign.left,
                  ),
                  bodyText == ''
                      ? Container()
                      : Row(
                          children: [
                            isTimeIcon! ? const Icon(Icons.timer) : Container(),
                            CustomText(
                              text: bodyText, //' 01:30 Mins',
                              textColor: bodyTextColor,
                              textAlign: TextAlign.left,
                            )
                          ],
                        )
                ],
              ),
            ),
            Icon(
              postIcon, // Icons.play_circle,
              color: isWatched! ? AppTheme.orange : AppTheme.grey,
              size: 40.sp,
            ),
            CustomFunction.customSpace(width: 10.w)
          ]),
        ),
      ),
    );
  }
}
