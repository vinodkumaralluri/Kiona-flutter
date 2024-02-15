import 'package:auto_route/auto_route.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/assigned_due_time_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/attachments_list_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/bottom_sheet_common_icon.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/create_task_common_container.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/custom_drop_down.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_mode_of_notification_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_reminder_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_textfield.dart';
import 'package:project_x_task_management_freelance/providers/home/contant/home_contants.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:project_x_task_management_freelance/utils/toast.dart';
import 'package:provider/provider.dart';

class CreateTaskWidget extends StatefulWidget {
  const CreateTaskWidget({super.key, required this.isTaskUpdate, this.taskId});
  final bool isTaskUpdate;
  final String? taskId;

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false)
          .formattedRemiderDate(DateTime.now());
      Provider.of<HomeProvider>(context, listen: false).getCurrentRemiderTime(
        DateTime.now(),
      );
      Provider.of<HomeProvider>(context, listen: false)
          .updatemodeOfNotification("WhatsApp");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Container(
          height: 720.h,
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
                  widget.isTaskUpdate ? "Update Task" : "Create Task",
                  style: headingStyle.copyWith(
                    fontSize: 16.sp,
                    color: darkTextColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Task Name",
                  style: subHeadingStyle.copyWith(
                    fontSize: 14.sp,
                    color: blueColor,
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: "",
                  keyboardType: TextInputType.name,
                  controller: homeState.taskNameController,
                  onChanged: (value) {},
                  height: 35.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Description",
                  style: subHeadingStyle.copyWith(
                    fontSize: 14.sp,
                    color: blueColor,
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: "",
                  keyboardType: TextInputType.name,
                  controller: homeState.descriptionController,
                  onChanged: (value) {},
                  height: 35.h,
                ),
                SizedBox(height: 20.h),
                const AssignedDueTimeWidget(),
                SizedBox(height: 20.h),
                Text(
                  "Task priority",
                  style: subHeadingStyle.copyWith(
                    fontSize: 14.sp,
                    color: blueColor,
                  ),
                ),
                SizedBox(height: 5.h),
                CustomDropDown(
                  value: homeState.initialPriority,
                  items: taskPriority,
                  onChanged: (value) {
                    homeState.updateTaskPriority(value!);
                  },
                ),
                SizedBox(height: 20.h),
                Text(
                  "Reminder",
                  style: subHeadingStyle.copyWith(
                    fontSize: 14.sp,
                    color: blueColor,
                  ),
                ),
                SizedBox(height: 5.h),
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
                        return const SelectReminderWidget(
                          isProfile: false,
                        );
                      },
                    );
                  },
                  child: CreateTaskCommonContainer(
                    data: homeState.selectedReminder!,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Modes of Notification",
                  style: subHeadingStyle.copyWith(
                    fontSize: 14.sp,
                    color: blueColor,
                  ),
                ),
                SizedBox(height: 5.h),
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
                        return const SelectModeofNotificationWidget();
                      },
                    );
                  },
                  child: CreateTaskCommonContainer(
                    data: homeState.selectedModeofNotification!,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      "Attachments",
                      style: subHeadingStyle.copyWith(
                        fontSize: 14.sp,
                        color: blueColor,
                      ),
                    ),
                    const Spacer(),
                    homeState.pickedDocsList.isEmpty
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              homeState.pickDocument();
                            },
                            child: const Icon(
                              Icons.add,
                              color: blueColor,
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 10.h),
                homeState.pickedDocsList.isEmpty
                    ? InkWell(
                        onTap: () {
                          homeState.pickDocument();
                        },
                        child: Container(
                          height: 70.h,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: DottedDecoration(
                            shape: Shape.box,
                            borderRadius: BorderRadius.circular(5.r),
                            color: darkBlueColor,
                          ),
                          child: Container(
                            height: 65.h,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              color: const Color(0xffEAF3FF),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.shareIcon,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Upload Document",
                                  style: headingStyle.copyWith(
                                    fontSize: 14.sp,
                                    color: darkBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 65.h,
                        child: const AttachmentsListWidget(),
                      ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: homeState.homeStates == HomeState.loading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: blueColor,
                            ),
                          ],
                        )
                      : Row(
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
                                if (homeState.taskNameController.text == '' &&
                                    homeState.descriptionController.text ==
                                        '') {
                                  showToast(
                                      "Please fill all details", redColor);
                                } else if (homeState.dueDate == '' &&
                                    homeState.dueTime == '') {
                                  showToast(
                                      "Please add due time and date", redColor);
                                } else {
                                  homeState.createTask(
                                    context,
                                    widget.isTaskUpdate,
                                    widget.taskId,
                                  );
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
                                    widget.isTaskUpdate ? "Update" : "Create",
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
