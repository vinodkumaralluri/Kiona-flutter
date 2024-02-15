import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x_task_management_freelance/domain/home/task_list_entity.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class TaskContainerWidget extends StatelessWidget {
  const TaskContainerWidget({super.key, required this.data});
  final Task data;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: (context) {
                    homeState.updateTaskStatus(
                      data.taskId,
                      context,
                      "Completed",
                    );
                  },
                  backgroundColor: greenColor,
                  foregroundColor: Colors.white,
                  icon: Icons.check,
                  label: 'Completed',
                ),
              ],
            ),
            child: Container(
              height: 150.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.white,
                border: Border.all(
                  color: borderColor,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5.w,
                    spreadRadius: 1.5.w,
                    color: const Color(0xffA5A5A5).withOpacity(0.25),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height,
                    width: 5.w,
                    decoration: BoxDecoration(
                      color: data.priority == "High"
                          ? redColor
                          : data.priority == "Medium"
                              ? orangeColor
                              : greenColor,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: data.taskStatus != "Pending"
                                    ? greenColor
                                    : Colors.transparent,
                                border: Border.all(
                                  color: data.taskStatus != "Pending"
                                      ? Colors.transparent
                                      : const Color(0xff929292),
                                ),
                              ),
                              child: data.taskStatus != "Pending"
                                  ? Center(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 11.w,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.taskTitle,
                                  style: headingStyle.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(
                                  height: 30.h,
                                  width: 280.w,
                                  child: Text(
                                    data.description,
                                    style: headingStyle.copyWith(
                                      fontSize: 12.sp,
                                      color: lightTextColor,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(height: 10.w),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: const Color(0xff2A2A2A),
                                      size: 15.w,
                                    ),
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        data.dueDate,
                                        style: subHeadingStyle.copyWith(
                                          color: darkTextColor,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    SvgPicture.asset(Assets.icons.clockIcon),
                                    SizedBox(width: 5.w),
                                    Text(
                                      data.dueTime,
                                      style: subHeadingStyle.copyWith(
                                        color: darkTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 1.h,
                          width: 310.w,
                          color: borderColor,
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 25.w),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(data.assignedTo.first.photoUrl),
                              radius: 14.r,
                            ),
                            SizedBox(width: 10.w),
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                data.assignedTo.first.name,
                                style: subHeadingStyle.copyWith(
                                  color: lightTextColor,
                                  fontSize: 14.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 90.w),
                            Container(
                              height: 20.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: data.taskStatus == "Pending"
                                    ? yelloFadeColor
                                    : blueColor,
                              ),
                              child: Center(
                                child: Text(
                                  data.taskStatus,
                                  style: subHeadingStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
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
