import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/all_section_placeholder.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/task_container_widget.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/routing/app_router.gr.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MyTaskSection extends StatelessWidget {
  const MyTaskSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Column(
          children: [
            homeState.taskList == null
                ? const AllSectionPlaceHolder()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: homeState.myTaskList.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 150.h),
                            child: Text(
                              "No Tasks",
                              style: headingStyle.copyWith(
                                color: blueColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              SizedBox(height: 10.h),
                              ...List.generate(
                                homeState.myTaskList.length,
                                (index) {
                                  final data = homeState.myTaskList[index];
                                  return InkWell(
                                    onTap: () {
                                      AutoRouter.of(context).push(
                                        TaskViewRoute(data: data),
                                      );
                                    },
                                    child: TaskContainerWidget(
                                      data: data,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                  ),
          ],
        );
      },
    );
  }
}
