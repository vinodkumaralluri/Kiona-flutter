import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/core/prefs.dart';
import 'package:project_x_task_management_freelance/injection/injection.dart';
import 'package:project_x_task_management_freelance/presentation/profile/widget/profile_common_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_back_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_scaffold.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/routing/app_router.gr.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).updateProfieEditData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Consumer<HomeProvider>(
        builder: (context, homeState, _) {
          final profileData = homeState.userProfileEntity!.data;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 750.h,
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
                            "Profile",
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
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(profileData.photoUrl),
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
                          ProfileCommonWidget(data: profileData.fullName),
                          SizedBox(height: 20.h),
                          Text(
                            "Email Address",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
                          ),
                          SizedBox(height: 5.h),
                          ProfileCommonWidget(data: profileData.email),
                          SizedBox(height: 20.h),
                          Text(
                            "Phone Number",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
                          ),
                          SizedBox(height: 5.h),
                          ProfileCommonWidget(
                              data: "+91-${profileData.phoneNumber}"),
                          SizedBox(height: 20.h),
                          Text(
                            "Default Mode of Notification",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
                          ),
                          SizedBox(height: 5.h),
                          ProfileCommonWidget(
                              data: profileData.defaultNotification),
                          SizedBox(height: 20.h),
                          Text(
                            "Default Time of Reminder",
                            style: subHeadingStyle.copyWith(
                                fontSize: 14.sp, color: blueColor),
                          ),
                          SizedBox(height: 5.h),
                          ProfileCommonWidget(
                            data: profileData.defaultReminder,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: InkWell(
                        onTap: () {
                          AutoRouter.of(context).push(const EditProfileRoute());
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
                            child: Text(
                              "Edit Profile",
                              style: headingStyle.copyWith(
                                color: blueColor,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: InkWell(
                        onTap: () async {
                          await getIt<AppPrefs>().token.clear();
                          if (context.mounted) {
                            AutoRouter.of(context).pushAndPopUntil(
                              const UserSignInRoute(),
                              predicate: (route) {
                                return false;
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 50.h,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Text(
                              "Logout",
                              style: headingStyle.copyWith(
                                color: Colors.white,
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
