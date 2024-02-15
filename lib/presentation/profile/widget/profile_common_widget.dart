import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';

class ProfileCommonWidget extends StatelessWidget {
  const ProfileCommonWidget({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: backGroundColor,
        border: Border.all(
          color: const Color(0xffC3C3C3),
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  data,
                  style: headingStyle.copyWith(
                    color: const Color(0xff6D6D6D),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
