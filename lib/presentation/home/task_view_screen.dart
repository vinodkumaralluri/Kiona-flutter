import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x_task_management_freelance/domain/home/task_list_entity.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/create_task_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/task_view_heading_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_scaffold.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:project_x_task_management_freelance/utils/toast.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TaskViewScreen extends StatefulWidget {
  const TaskViewScreen({
    super.key,
    required this.data,
  });

  final Task data;

  @override
  State<TaskViewScreen> createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false)
          .getComments(widget.data.taskId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return CustomScaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TaskViewHeadingWidget(),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Task Name",
                            style: subHeadingStyle.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xff777777),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            widget.data.taskTitle,
                            style: headingStyle.copyWith(
                              fontSize: 16.sp,
                              color: darkTextColor,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Status",
                            style: subHeadingStyle.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xff777777),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            height: 30.h,
                            width: 110.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: widget.data.taskStatus == "Pending"
                                  ? yelloFadeColor
                                  : blueColor,
                            ),
                            child: Center(
                              child: Text(
                                widget.data.taskStatus,
                                style: headingStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
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
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          widget.data.assignedTo.first.photoUrl,
                                        ),
                                        radius: 18.r,
                                      ),
                                      SizedBox(width: 10.w),
                                      SizedBox(
                                        width: 60.w,
                                        child: Text(
                                          widget.data.assignedTo.first.name,
                                          style: headingStyle.copyWith(
                                            color: darkTextColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ],
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
                                  Row(
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: darkTextColor,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.black,
                                          size: 15.w,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "${widget.data.dueDate}, ${widget.data.dueTime}",
                                        style: headingStyle.copyWith(
                                          color: darkTextColor,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Description",
                            style: subHeadingStyle.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xff777777),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          SizedBox(
                            height: 40.h,
                            width: 350.w,
                            child: Text(
                              widget.data.description,
                              style: headingStyle.copyWith(
                                fontSize: 16.sp,
                                color: darkTextColor,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Task Priority",
                                    style: subHeadingStyle.copyWith(
                                      fontSize: 14.sp,
                                      color: blueColor,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  SizedBox(
                                    width: 110.w,
                                    child: Text(
                                      widget.data.priority,
                                      style: headingStyle.copyWith(
                                        color: darkTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 30.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Reminder",
                                    style: subHeadingStyle.copyWith(
                                      fontSize: 14.sp,
                                      color: blueColor,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    widget.data.reminders.first.reminderType,
                                    style: headingStyle.copyWith(
                                      color: darkTextColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Attachments",
                            style: subHeadingStyle.copyWith(
                              fontSize: 14.sp,
                              color: blueColor,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 65.h,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  widget.data.documents.length,
                                  (index) {
                                    final docData =
                                        widget.data.documents[index];
                                    return Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Container(
                                        height: 50.h,
                                        width: 200.w,
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
                                                SvgPicture.asset(
                                                  Assets.images.pdfAttachments,
                                                ),
                                                SizedBox(width: 10.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 100.w,
                                                      child: Text(
                                                        docData.documentName,
                                                        style: headingStyle
                                                            .copyWith(
                                                          color: darkTextColor,
                                                          fontSize: 12.sp,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.h),
                                                    Text(
                                                      "PDF",
                                                      style: subHeadingStyle
                                                          .copyWith(
                                                        color: darkTextColor,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    homeState.commentsEntity == null
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: blueColor,
                              ),
                            ],
                          )
                        : Container(
                            height: 120.h,
                            width: MediaQuery.sizeOf(context).width,
                            color: const Color(0xffF6F6F6),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              child: homeState.commentsEntity!.data.list.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No Comments",
                                        style: headingStyle.copyWith(
                                          color: darkTextColor,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Activity",
                                            style: headingStyle.copyWith(
                                              fontSize: 14.sp,
                                              color: const Color(0xff777777),
                                            ),
                                          ),
                                          SizedBox(height: 15.h),
                                          ...List.generate(
                                            homeState.commentsEntity!.data.list
                                                .length,
                                            (index) {
                                              final data = homeState
                                                  .commentsEntity!
                                                  .data
                                                  .list[index];
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 20.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              data.userPhoto),
                                                      radius: 15.r,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.h),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                data.user,
                                                                style:
                                                                    headingStyle
                                                                        .copyWith(
                                                                  color:
                                                                      darkTextColor,
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10.w),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    data.createdAt.difference(DateTime.now()).inMinutes.abs().toString() ==
                                                                            "0"
                                                                        ? "Now"
                                                                        : data.createdAt.difference(DateTime.now()).inMinutes.abs() >=
                                                                                60
                                                                            ? data.createdAt.difference(DateTime.now()).inHours.abs().toString()
                                                                            : data.createdAt.difference(DateTime.now()).inHours.abs() >= 24
                                                                                ? data.createdAt.difference(DateTime.now()).inDays.abs().toString()
                                                                                : data.createdAt.difference(DateTime.now()).inMinutes.abs().toString(),
                                                                    style: subHeadingStyle
                                                                        .copyWith(
                                                                      fontSize:
                                                                          10.sp,
                                                                      color:
                                                                          const Color(
                                                                        0xff949494,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    data.createdAt.difference(DateTime.now()).inHours.abs() >=
                                                                            24
                                                                        ? "days"
                                                                        : data.createdAt.difference(DateTime.now()).inMinutes.abs() >=
                                                                                60
                                                                            ? "hours"
                                                                            : data.createdAt.difference(DateTime.now()).inMinutes.abs() == 0
                                                                                ? ""
                                                                                : "mins",
                                                                    style: subHeadingStyle
                                                                        .copyWith(
                                                                      fontSize:
                                                                          10.sp,
                                                                      color:
                                                                          const Color(
                                                                        0xff949494,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 7.h),
                                                          Text(
                                                            data.comment,
                                                            style: headingStyle
                                                                .copyWith(
                                                              color:
                                                                  darkTextColor,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    InkWell(
                                                      onTap: () async {
                                                        await homeState
                                                            .deleteComment(
                                                                data.commentId);
                                                        await homeState
                                                            .getComments(widget
                                                                .data.taskId);
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: blueColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                    Container(
                      height: 60.h,
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 300.w,
                              height: 60.h,
                              child: TextFormField(
                                controller: homeState.commentController,
                                style: headingStyle.copyWith(
                                  color: const Color(0xff868686),
                                  fontSize: 12.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Add a Comment....',
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(left: 10.w, top: 15.h),
                                  hintStyle: headingStyle.copyWith(
                                    color: const Color(0xff868686),
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            homeState.commentState == CommentState.success
                                ? InkWell(
                                    onTap: () {
                                      if (homeState
                                          .commentController.text.isEmpty) {
                                        showToast("Please fill the comment",
                                            redColor);
                                      } else {
                                        homeState
                                            .addComment(widget.data.taskId);
                                      }
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: const BoxDecoration(
                                        color: blueColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            Assets.icons.sendIcon),
                                      ),
                                    ),
                                  )
                                : const CircularProgressIndicator(
                                    color: blueColor,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                homeState.taskMenu == TaskMenu.open
                    ? Positioned(
                        right: 20,
                        top: 80.h,
                        child: Container(
                          height: 86.h,
                          width: 99.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff8E8E8E).withOpacity(0.25),
                                blurRadius: 10.r,
                                spreadRadius: 1.0.w,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 10.w),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await homeState.deleteTaskData();
                                    await homeState.updateTaskData(
                                      widget.data.taskTitle,
                                      widget.data.description,
                                      widget.data.assignedTo,
                                      widget.data.dueDate,
                                      widget.data.dueTime,
                                      widget.data.priority,
                                      widget.data.notificationModes,
                                      widget.data.documents,
                                    );
                                    if (context.mounted) {
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
                                          return CreateTaskWidget(
                                            isTaskUpdate: true,
                                            taskId: widget.data.taskId,
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit_outlined,
                                        color: const Color(0xff646464),
                                        size: 18.w,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "Edit",
                                        style: headingStyle.copyWith(
                                          color: darkTextColor,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                InkWell(
                                  onTap: () {
                                    homeState.deleteTask(
                                        widget.data.taskId, context);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete_outlined,
                                        color: redColor,
                                        size: 18.w,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "Delete",
                                        style: headingStyle.copyWith(
                                          color: redColor,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
