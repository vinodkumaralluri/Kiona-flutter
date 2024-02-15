import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/create_task_common_container.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_mode_of_notification_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/select_reminder_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_back_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_scaffold.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_textfield.dart';
import 'package:project_x_task_management_freelance/providers/authentication/authentication_provider.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Consumer2<AuthenticatonProvider, HomeProvider>(
        builder: (context, authState, homeState, _) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CommonBackWidget(color: Color(0xffC3C3C3)),
                          SizedBox(width: 5.w),
                          Text(
                            "Edit Profile",
                            style: headingStyle.copyWith(
                              color: blueColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Divider(
                      color: borderColor,
                      thickness: 1.w,
                    ),
                    SizedBox(height: 25.h),
                    Stack(
                      children: [
                        Container(
                          height: 85.h,
                          width: 85.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            shape: BoxShape.circle,
                          ),
                          child: homeState.profilePicState ==
                                  ProfilePicState.assets
                              ? CircleAvatar(
                                  backgroundImage:
                                      FileImage(homeState.profileImage!),
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    homeState.userProfileEntity!.data.photoUrl,
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              homeState.pickProfileimage();
                            },
                            child: Container(
                              height: 25.h,
                              width: 25.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xff006EFF),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 15.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Profile Photo",
                      style: headingStyle.copyWith(
                        color: blueColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Full Name",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hintText: "",
                            keyboardType: TextInputType.name,
                            autofocus: true,
                            controller: homeState.nameController,
                            onChanged: (value) {},
                            height: 35.h,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Email Address",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hintText: "",
                            keyboardType: TextInputType.name,
                            controller: homeState.emailController,
                            onChanged: (value) {},
                            height: 35.h,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Phone Number",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hintText: "",
                            keyboardType: TextInputType.name,
                            controller: homeState.phoneController,
                            onChanged: (value) {},
                            height: 35.h,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Default Mode of Notification",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
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
                          Text(
                            "Default Time of Reminder",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
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
                                    isProfile: true,
                                  );
                                },
                              );
                            },
                            child: CreateTaskCommonContainer(
                              data: homeState.selectedReminder!,
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: InkWell(
                        onTap: () {
                          homeState.updateUserProfile(context);
                        },
                        child: Container(
                          height: 50.h,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: blueColor),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: homeState.homeStates == HomeState.loading
                                ? const CircularProgressIndicator(
                                    color: blueColor,
                                  )
                                : Text(
                                    "Save Changes",
                                    style: headingStyle.copyWith(
                                      color: blueColor,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
