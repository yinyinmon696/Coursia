import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/View/Profile/bloc/profile_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final String? hintText;
  final List<dynamic> items;
  final bool? isSignUp;
  final void Function()? onChange;
  final bool? isCourses;
  final bool? isJobLevel;
  const CustomDropDown(
      {super.key,
      required this.hintText,
      required this.items,
      required this.isSignUp,
      this.onChange,
      this.isCourses,
      this.isJobLevel = false});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        enabledBorder: isSignUp!
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.grey, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)))
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.grey, width: 2.0)),
        errorStyle: isSignUp!
            ? const TextStyle(color: AppTheme.grey)
            : const TextStyle(color: AppTheme.black),
        errorBorder: isSignUp!
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.orange, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)))
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.orange)),
        fillColor: Colors.white,
        isDense: true,
        // contentPadding: EdgeInsets.zero,
        focusedBorder: isSignUp!
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.grey, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)))
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.orange)),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.greyDark)),
      ),
      //isExpanded: true,
      hint: Text(
        hintText!,
        style: TextStyle(
            color: isCourses! && isSignUp == true
                ? AppTheme.black
                : isSignUp!
                    ? AppTheme.white
                    : isJobLevel!
                        ? AppTheme.black
                        : AppTheme.grey),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppTheme.greyDark,
      ),
      iconSize: 30,
      buttonHeight: isSignUp! ? 45.h : 30.h,
      buttonPadding: const EdgeInsets.only(left: 5, right: 5).w,
      dropdownDecoration: BoxDecoration(
        color: isCourses! && isSignUp == true
            ? AppTheme.white
            : isSignUp!
                ? AppTheme.blackLight
                : AppTheme.white,
        borderRadius: BorderRadius.circular(15).r,
      ),

      items: items
          .map((item) => DropdownMenuItem<dynamic>(
                value: item,
                child: Text(
                  item.name,
                  style: TextStyle(
                      color: isCourses! && isSignUp == true
                          ? AppTheme.black
                          : isSignUp!
                              ? AppTheme.white
                              : AppTheme.black),
                ),
              ))
          .toList(),
      // validator: (value) {
      //   if (value == null) {
      //     return 'Please select $hintText.';
      //   }
      //   return null;
      // },
      onChanged: (value) {
        context.read<ProfileBloc>().add(GetDropDownValue(value: value));
        // if (value.isGender == true) {
        //   context.read<ProfileBloc>().add(GetDropDownValue(value: value));
        // }
        // if (value.isJobLevel == true) {
        //   context.read<ProfileBloc>().add(GetDropDownValue(value: value));
        // }
        // if (value.isTopic == true) {
        //   context.read<ProfileBloc>().add(GetDropDownValue(value: value));
        // }
        // if (value.isCost == true) {
        //   context.read<ProfileBloc>().add(GetDropDownValue(value: value));
        // }
        // if (value.isUserLevel == true) {
        //   context.read<ProfileBloc>().add(GetDropDownValue(value: value));
        // }

        // log(value.toString());
      },
      onSaved: (value) {},
    );
  }
}
