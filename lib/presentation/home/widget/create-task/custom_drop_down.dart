import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.value,
      required this.items,
      required this.onChanged,
      this.width});
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: width ?? MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: backGroundColor,
        border: Border.all(
          color: const Color(0xffC3C3C3),
          width: 1.w,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: DropdownButton<String>(
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            underline: const SizedBox.shrink(),
            isExpanded: true,
            value: value,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value.toString(),
                  style: subHeadingStyle.copyWith(
                    color: darkTextColor,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
