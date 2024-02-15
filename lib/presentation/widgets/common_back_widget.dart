import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';

class CommonBackWidget extends StatelessWidget {
  const CommonBackWidget({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: color ?? darkTextColor,
        size: 20.w,
      ),
    );
  }
}
