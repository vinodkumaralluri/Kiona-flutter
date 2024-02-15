import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/create_task_widget.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';

class AllSectionPlaceHolder extends StatelessWidget {
  const AllSectionPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.h),
        SvgPicture.asset(
          Assets.images.homeScreenPlaceholder,
          height: 140.h,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 300.w,
          child: Text(
            "Start your day with purpose – Create and assign tasks now!",
            style: subHeadingStyle.copyWith(
              color: lightTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              context: context,
              builder: (context) {
                return const CreateTaskWidget(
                  isTaskUpdate: false,
                );
              },
            );
          },
          child: Container(
            height: 40.h,
            width: 125.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.w),
              color: greenColor,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'New Task',
                    style: subHeadingStyle.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
