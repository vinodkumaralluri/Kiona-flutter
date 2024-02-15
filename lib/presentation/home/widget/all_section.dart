import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/all_section_placeholder.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/task_container_widget.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

class AllSection extends StatelessWidget {
  const AllSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Column(
          children: [
            homeState.taskList == null
                ? const AllSectionPlaceHolder()
                : homeState.combainedTaskList.isEmpty
                    ? const AllSectionPlaceHolder()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            ...List.generate(
                              homeState.combainedTaskList.length,
                              (index) {
                                final data = homeState.combainedTaskList[index];
                                return InkWell(
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                      TaskViewRoute(data: data),
                                    );
                                  },
                                  child: TaskContainerWidget(data: data),
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
