import 'package:coursia/UIDesign/app_theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  bool? isEmail;
  final String? hintText;
  IconButton? suffixIcon;
  final String? requiredText;
  final bool? obscureText;
  final void Function(String)? onChange;
  final void Function()? onPress;
  final bool? isProfile;
  final Color? textColor;
  final bool? readonly;

  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.isEmail,
      required this.hintText,
      this.suffixIcon,
      this.requiredText,
      this.obscureText,
      this.onChange,
      this.onPress,
      this.isProfile,
      this.textColor = Colors.black,
      this.readonly});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readonly ?? false,
      autofocus: false,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      onChanged: (value) {
        final bool isValid = EmailValidator.validate(value);
        if (isValid) {
          setState(() {
            widget.suffixIcon = IconButton(
                onPressed: () {},
                icon: const Icon(Icons.check_circle, color: AppTheme.orange));
          });
        } else if (!isValid) {
          if (widget.isEmail!) {
            setState(() {
              widget.suffixIcon = IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_outline,
                      color: AppTheme.orange));
            });
          }
        }
      },
      style: TextStyle(color: widget.textColor),
      decoration: InputDecoration(
          errorStyle: widget.isProfile!
              ? const TextStyle(color: AppTheme.black)
              : const TextStyle(color: AppTheme.grey),
          focusedBorder: widget.isProfile!
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.orange, width: 2.0))
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.orange, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: widget.isProfile!
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.grey, width: 2.0))
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.grey, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedErrorBorder: widget.isProfile!
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.orange, width: 2.0))
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.orange, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: widget.isProfile!
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.orange, width: 2.0))
              : const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.orange, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: AppTheme.grey),
          suffixIcon: widget.suffixIcon),
      // decoration: InputDecoration(
      //   hintText: widget.hintText,
      //   focusedBorder: const UnderlineInputBorder(
      //       borderSide: BorderSide(color: AppTheme.orange, width: 2.0)),
      //   enabledBorder: const UnderlineInputBorder(
      //       borderSide: BorderSide(color: AppTheme.orange, width: 2.0)),
      // ),
      validator: (value) {
        if (value!.isEmpty) {
          return widget.requiredText ?? "This field is required.";
        }
        return null;
      },
    );
  }
}
