import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/bottom_sheet_common_icon.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_assignee_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_due_date_time_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/filter/select_status_widget.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class SelectFilterWidget extends StatelessWidget {
  const SelectFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Container(
          height: 300.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BottomSheetCommonMenuIcon(),
                SizedBox(height: 5.h),
                Text(
                  "Filter",
                  style: headingStyle.copyWith(
                    fontSize: 16.sp,
                    color: darkTextColor,
                  ),
                ),
                SizedBox(height: 20.h),
                ...List.generate(
                  3,
                  (index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
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
                              return const SelectDateTimeWidget(
                                isFilter: true,
                              );
                            },
                          );
                        } else if (index == 1) {
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
                              return const SelectStatusWidget();
                            },
                          );
                        } else {
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
                              return const SelectAssigneeWidget(
                                isFilter: true,
                              );
                            },
                          );
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                index == 0
                                    ? "Due Date"
                                    : index == 1
                                        ? "Status"
                                        : "Assignee",
                                style: headingStyle.copyWith(
                                  color: darkTextColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color(0xff323232),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Divider(thickness: 1.w, color: borderColor),
                        ],
                      ),
                    );
                  },
                ),
                const Spacer(),
                homeState.isFilterApplied
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: InkWell(
                          onTap: () {
                            homeState.removeFilters();
                          },
                          child: Container(
                            height: 45.h,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              color: const Color(0xffE2E2E2),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: subHeadingStyle.copyWith(
                                    fontSize: 18.sp,
                                    color: const Color(0xff858585)),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
