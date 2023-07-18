// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/View/Profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final String? date;

  CustomDatePicker({super.key, required this.date});

  DateTime? _selectedDate;
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: DatePickerWidget(
              looping: false, // default is not looping
              firstDate: DateTime(1900), //DateTime(1960),
              initialDate: DateTime.parse(date!),
              dateFormat: "dd/MMMM/yyyy",
              onChange: (DateTime newDate, _) {
                _selectedDate = newDate;
                selectedDate = DateFormat('yyyy-MM-dd').format(_selectedDate!);
                context
                    .read<ProfileBloc>()
                    .add(GetSelectedDate(date: selectedDate!));
              },
              pickerTheme: DateTimePickerTheme(
                backgroundColor: Colors.transparent,
                itemTextStyle:
                    TextStyle(color: AppTheme.blackLight, fontSize: 12.sp),
                dividerColor: AppTheme.greyDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
