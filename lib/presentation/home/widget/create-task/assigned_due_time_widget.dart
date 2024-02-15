import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_assignee_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_due_date_time_widget.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class AssignedDueTimeWidget extends StatelessWidget {
  const AssignedDueTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Assigned to",
                  style: subHeadingStyle.copyWith(
                    fontSize: 14.sp,
                    color: blueColor,
                  ),
                ),
                SizedBox(height: 10.h),
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
                        return const SelectAssigneeWidget(
                          isFilter: false,
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      homeState.assigneeIdList.isEmpty
                          ? Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: DottedDecoration(
                                shape: Shape.circle,
                                color: Colors.black,
                                dash: const [2, 2],
                              ),
                              child: const Icon(
                                Icons.person_outlined,
                                color: Colors.black,
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(width: 10.w),
                      homeState.assigneeIdList.isEmpty
                          ? Text(
                              "No Assignee",
                              style: subHeadingStyle.copyWith(
                                color: lightTextColor,
                                fontSize: 14.sp,
                              ),
                            )
                          : Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      Assets.images.profileImage.path),
                                  radius: 18.r,
                                ),
                                SizedBox(width: 10.w),
                                SizedBox(
                                  width: 60.w,
                                  child: Text(
                                    homeState.assigneeIdList.first,
                                    style: headingStyle.copyWith(
                                      color: darkTextColor,
                                      fontSize: 14.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: 30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Due Date & Time",
                  style: subHeadingStyle.copyWith(
                    fontSize: 14.sp,
                    color: blueColor,
                  ),
                ),
                SizedBox(height: 10.h),
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
                        return const SelectDateTimeWidget(
                          isFilter: false,
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: DottedDecoration(
                          shape: Shape.circle,
                          color: Colors.black,
                          dash: const [2, 2],
                        ),
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.black,
                          size: 15.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        homeState.dueDate.isNotEmpty
                            ? "${homeState.dueDate}, ${homeState.dueTime}"
                            : "Not Selected",
                        style: subHeadingStyle.copyWith(
                          color: lightTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
