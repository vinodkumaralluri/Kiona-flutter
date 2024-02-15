import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/bottom_sheet_common_icon.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/custom_drop_down.dart';
import 'package:project_x_task_management_freelance/providers/home/contant/home_contants.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class SelectCustomReminder extends StatelessWidget {
  const SelectCustomReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Container(
          height: 500.h,
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
                  "Select Date and Time",
                  style: headingStyle.copyWith(
                    fontSize: 16.sp,
                    color: darkTextColor,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  "Reminder type",
                  style: subHeadingStyle.copyWith(
                    fontSize: 14.sp,
                    color: blueColor,
                  ),
                ),
                SizedBox(height: 5.h),
                CustomDropDown(
                  value: homeState.initialReminder,
                  items: reminderList,
                  onChanged: (value) {
                    homeState.updateReminderList(value!);
                  },
                ),
                homeState.initialReminder == "Annually"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            "Month",
                            style: subHeadingStyle.copyWith(
                              fontSize: 14.sp,
                              color: blueColor,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomDropDown(
                            value: homeState.initialMonth,
                            items: monthSet,
                            onChanged: (value) {
                              homeState.updateMonthSet(value!);
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeState.initialReminder == "Weekly"
                              ? "Day"
                              : "Date",
                          style: subHeadingStyle.copyWith(
                            fontSize: 14.sp,
                            color: blueColor,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        homeState.initialReminder == "Weekly"
                            ? CustomDropDown(
                                value: homeState.initialWeekDay,
                                items: weekDays,
                                width: 150.w,
                                onChanged: (value) {
                                  homeState.updateweekDays(value!);
                                },
                              )
                            : homeState.initialReminder == "Monthly"
                                ? CustomDropDown(
                                    value: homeState.initialMonthDate,
                                    items: monthDates,
                                    width: 150.w,
                                    onChanged: (value) {
                                      homeState.updateMonthDates(value!);
                                    },
                                  )
                                : InkWell(
                                    onTap: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: homeState.selectedDueDate,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      await homeState
                                          .formattedRemiderDate(picked!);
                                    },
                                    child: Container(
                                      height: 35.h,
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: backGroundColor,
                                        border: Border.all(
                                          color: const Color(0xffC3C3C3),
                                          width: 1.w,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                homeState.customReminderDueDate,
                                                style: headingStyle.copyWith(
                                                  fontSize: 14.sp,
                                                  color: darkTextColor,
                                                ),
                                              ),
                                              const Spacer(),
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                color: darkTextColor,
                                                size: 15.w,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                      ],
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Time",
                          style: subHeadingStyle.copyWith(
                            fontSize: 14.sp,
                            color: blueColor,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        homeState.initialReminder == "Hourly"
                            ? CustomDropDown(
                                value: homeState.initialMinute,
                                items: minutesSet,
                                width: 150.w,
                                onChanged: (value) {
                                  homeState.updateMintuesSet(value!);
                                },
                              )
                            : InkWell(
                                onTap: () async {
                                  final TimeOfDay? picked =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        homeState.selectedDueDate),
                                  );
                                  await homeState.formattedRemiderTime(
                                      homeState.selectedDueDate, picked!);
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: backGroundColor,
                                    border: Border.all(
                                      color: const Color(0xffC3C3C3),
                                      width: 1.w,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            homeState.customReminderDueTime,
                                            style: headingStyle.copyWith(
                                              fontSize: 14.sp,
                                              color: darkTextColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          SvgPicture.asset(
                                              Assets.icons.clockIcon),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Container(
                  height: 40.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    border: Border.all(color: blueColor),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: Text(
                      "+ Add more",
                      style: headingStyle.copyWith(
                        color: blueColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        AutoRouter.of(context).pop();
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
                        AutoRouter.of(context).pop();
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
              ],
            ),
          ),
        );
      },
    );
  }
}
