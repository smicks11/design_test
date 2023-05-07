// ignore_for_file: library_private_types_in_public_api, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool? obscureText;
  String? hintText;
  final Widget? icon;
  String? label;
  Color? labelColor;
  final String? Function(String?)? validator;
  final void Function(String)? onSaved;
  Function()? onTap;
  Color? fillingColor;
  bool autofocus;
  bool isEnabled;
  TextInputType? keyboardType;
  int? maxLines;
  TextInputType? textInputType;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  String? labelText;
  bool? filled;
  bool? useUnderline;
  AutovalidateMode? autovalidateMode;

  CustomTextFormField(
      {Key? key,
      this.textInputType,
      this.prefixIcon,
      this.suffixIcon,
      this.autovalidateMode,
      this.maxLines = 1,
      this.label = '',
      this.icon,
      this.labelColor,
      this.fillingColor = AppColors.grayscaleInputColor,
      this.hintText = '',
      this.obscureText,
      this.controller,
      this.validator,
      this.onSaved,
      this.onTap,
      this.autofocus = false,
      this.isEnabled = true,
      this.keyboardType,
      this.inputFormatters,
      this.labelText,
      this.filled = true,
      this.useUnderline = false,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textAlign: useUnderline == true ? TextAlign.center : TextAlign.left,
      style: TextStyle(
          color: AppColors.black,
          letterSpacing: useUnderline == true ? 5.0 : 0.0,
          fontSize: useUnderline == true ? 30.sp : 16.sp,
          fontWeight: FontWeight.w400),
      enabled: isEnabled,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      controller: controller,
      onTap: onTap,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      keyboardType: textInputType,
      validator: validator,
      onChanged: onSaved,
      decoration: InputDecoration(
        suffix: suffix,
        labelText: labelText,
        errorStyle: const TextStyle(color: AppColors.red),
        // contentPadding:
        //     EdgeInsets.only(top: 23.h, bottom: 24.h, left: 20.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1.5.w,
            style: BorderStyle.solid,
          ),
        ),
        fillColor: useUnderline == true ? Colors.transparent : fillingColor,
        filled: filled ?? false,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.grayscalePlaceholderColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
        focusedBorder: useUnderline == true
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black26))
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 0.5.w,
                    style: BorderStyle.solid)),
        enabledBorder: useUnderline == true
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black26))
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                borderSide: BorderSide(
                    color: AppColors.grayscalePlaceholderColor,
                    width: 0.5.w,
                    style: BorderStyle.solid)),
        errorBorder: useUnderline == true
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black26))
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.5.w,
                    style: BorderStyle.solid)),
      ),
    );
  }
}
