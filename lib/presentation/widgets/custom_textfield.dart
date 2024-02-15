import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.autofocus,
    this.prefixIcon,
    this.width,
    this.height,
    this.borderColor,
    this.prefix,
    this.hintTextColor,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Widget? prefix;
  final Color? hintTextColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.h,
      width: width ?? MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: backGroundColor,
        border: Border.all(
          color: borderColor ?? const Color(0xffC3C3C3),
          width: 1.w,
        ),
      ),
      child: Center(
        child: TextFormField(
          style: headingStyle.copyWith(fontSize: 14.sp),
          inputFormatters: inputFormatters,
          autofocus: autofocus ?? false,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefix: prefixIcon,
            prefixIcon: prefix,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: Colors.transparent, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: Colors.transparent, width: 1.w),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: Colors.transparent, width: 1.w),
            ),
            hintText: hintText,
            hintStyle: subHeadingStyle.copyWith(
              color: hintTextColor ?? const Color(0xff8E8EA9),
            ),
            contentPadding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w),
          ),
        ),
      ),
    );
  }
}
