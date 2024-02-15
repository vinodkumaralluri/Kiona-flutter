import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/bottom_sheet_common_icon.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class TaskViewHeadingWidget extends StatelessWidget {
  const TaskViewHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: backGroundColor,
        boxShadow: [
          BoxShadow(
            color: Color(0xffE0E0E0),
            blurRadius: 10,
            spreadRadius: 1.5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
        child: Padding(
          padding: EdgeInsets.only(top: 35.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: greyColor,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                "All",
                style: headingStyle.copyWith(fontSize: 14.sp, color: blueColor),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Provider.of<HomeProvider>(context, listen: false)
                      .updateTaskMenu();
                },
                child: const BottomSheetCommonMenuIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
