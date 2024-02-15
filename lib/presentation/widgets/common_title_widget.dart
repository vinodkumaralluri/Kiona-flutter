import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';

class CommonTitleWidget extends StatelessWidget {
  const CommonTitleWidget({super.key, this.fontSize, this.iconHeight});
  final double? fontSize;
  final double? iconHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.icons.appIcon,
          color: blueColor,
          height: iconHeight ?? 30.h,
        ),
        SizedBox(width: 10.w),
        Text(
          "Project X",
          style: headingStyle.copyWith(
              fontSize: fontSize ?? 42.sp, color: blueColor),
        ),
      ],
    );
  }
}
