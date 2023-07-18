import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final IconData? prefixIcon;
  final String? text;
  final IconData? surffixIcon;
  final void Function()? onTap;

  const CustomProfileCard(
      {super.key,
      required this.prefixIcon,
      required this.text,
      required this.surffixIcon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            prefixIcon,
            color: AppTheme.blackLight,
          ),
          CustomText(
            text: '     $text',
            textColor: AppTheme.black,
          ),
          Expanded(
            child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  surffixIcon,
                  color: AppTheme.blackLight,
                )),
          )
        ],
      ),
    );
  }
}
