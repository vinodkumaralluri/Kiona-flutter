import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/bottom_sheet_common_icon.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class SelectDateTimeWidget extends StatefulWidget {
  const SelectDateTimeWidget({super.key, required this.isFilter});
  final bool isFilter;

  @override
  State<SelectDateTimeWidget> createState() => _SelectDateTimeWidgetState();
}

class _SelectDateTimeWidgetState extends State<SelectDateTimeWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false)
          .formattedDate(DateTime.now());
      Provider.of<HomeProvider>(context, listen: false).getCurrentTime(
        DateTime.now(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Container(
          height: 350.h,
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
                  "Select Due Date & Time",
                  style: headingStyle.copyWith(
                    fontSize: 16.sp,
                    color: darkTextColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: List.generate(
                    3,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: InkWell(
                          onTap: () {
                            if (index == 0) {
                              homeState.formattedTodayDate();
                            } else if (index == 1) {
                              homeState.formattedTomorrowDate();
                            } else {
                              homeState.formattedNextModay();
                            }
                          },
                          child: Container(
                            height: 25.h,
                            width: 110.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: const Color(0xffEFEFEF),
                            ),
                            child: Center(
                              child: Text(
                                index == 0
                                    ? "Today"
                                    : index == 1
                                        ? "Tomorrow"
                                        : "Next Monday",
                                style: subHeadingStyle.copyWith(
                                  fontSize: 12.sp,
                                  color: const Color(0xff787878),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                Divider(
                  thickness: 1.w,
                  color: borderColor,
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Due Date",
                      style: subHeadingStyle.copyWith(
                        color: darkTextColor,
                        fontSize: 17.sp,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: homeState.selectedDueDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        await homeState.formattedDate(picked!);
                      },
                      child: Container(
                        height: 35.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                          color: const Color(0xff767680).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: Text(
                            homeState.dueDate,
                            style: subHeadingStyle.copyWith(
                              color: darkTextColor,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Divider(
                  thickness: 1.w,
                  color: borderColor,
                ),
                SizedBox(height: 10.h),
                Divider(
                  thickness: 1.w,
                  color: borderColor,
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Due Time",
                      style: subHeadingStyle.copyWith(
                        color: darkTextColor,
                        fontSize: 17.sp,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(homeState.selectedDueDate),
                        );
                        await homeState.formattedTime(
                            homeState.selectedDueDate, picked!);
                      },
                      child: Container(
                        height: 35.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                          color: const Color(0xff767680).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: Text(
                            homeState.dueTime,
                            style: subHeadingStyle.copyWith(
                              color: darkTextColor,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Divider(
                  thickness: 1.w,
                  color: borderColor,
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (widget.isFilter) {
                            homeState.updateFilterDueDate(true);
                            AutoRouter.of(context).pop();
                          } else {
                            AutoRouter.of(context).pop();
                          }
                        },
                        child: Container(
                          height: 45.h,
                          width: 165.w,
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
                      InkWell(
                        onTap: () {
                          if (widget.isFilter) {
                            homeState.updateFilterDueDate(false);
                            AutoRouter.of(context).pop();
                          } else {
                            AutoRouter.of(context).pop();
                          }
                        },
                        child: Container(
                          height: 45.h,
                          width: 165.w,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Text(
                              "Save",
                              style: subHeadingStyle.copyWith(
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
