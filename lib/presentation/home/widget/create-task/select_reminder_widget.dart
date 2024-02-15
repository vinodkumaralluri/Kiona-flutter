import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/bottom_sheet_common_icon.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_custom_reminder.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_container.dart';
import 'package:project_x_task_management_freelance/providers/home/contant/home_contants.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class SelectReminderWidget extends StatefulWidget {
  const SelectReminderWidget({super.key, required this.isProfile});
  final bool isProfile;

  @override
  State<SelectReminderWidget> createState() => _SelectReminderWidgetState();
}

class _SelectReminderWidgetState extends State<SelectReminderWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Container(
          height: 450.h,
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
                  "Select Reminder",
                  style: headingStyle.copyWith(
                    fontSize: 16.sp,
                    color: darkTextColor,
                  ),
                ),
                SizedBox(height: 30.h),
                ...List.generate(
                  reminderOptionsList.length,
                  (index) {
                    final data = reminderOptionsList[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: InkWell(
                        onTap: () {
                          homeState.updateselectedReminder(data);
                          if (!widget.isProfile) {
                            if (index == 4) {
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
                                  return const SelectCustomReminder();
                                },
                              );
                            }
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 280.w,
                                  child: Text(
                                    widget.isProfile
                                        ? data == "Custom"
                                            ? ""
                                            : data
                                        : data,
                                    style: headingStyle.copyWith(
                                      fontSize: 16.sp,
                                      color: data == homeState.selectedReminder
                                          ? darkBlueColor
                                          : lightTextColor,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                data == homeState.selectedReminder
                                    ? const Icon(
                                        Icons.check,
                                        color: darkBlueColor,
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Divider(
                              thickness: 1.h,
                              color: borderColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                  child: CommonContainer(
                    color: blueColor,
                    child: Text(
                      "Save",
                      style: subHeadingStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
