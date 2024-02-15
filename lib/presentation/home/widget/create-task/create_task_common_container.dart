import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';

class CreateTaskCommonContainer extends StatelessWidget {
  const CreateTaskCommonContainer({super.key, required this.data});
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
                    color: darkTextColor,
                    fontSize: 14.sp,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xff323232),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
