import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_title_widget.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/routing/app_router.gr.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:provider/provider.dart';

class CustomHeadingWidget extends StatelessWidget {
  const CustomHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
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
                  CommonTitleWidget(
                    iconHeight: 15.h,
                    fontSize: 18.sp,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.notifications_outlined,
                    color: lightTextColor,
                  ),
                  SizedBox(width: 20.w),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(const ProfileRoute());
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          homeState.userProfileEntity!.data.photoUrl),
                      radius: 18.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
