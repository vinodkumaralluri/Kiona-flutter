import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x_task_management_freelance/core/prefs.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/injection/injection.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_container.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_scaffold.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_textfield.dart';
import 'package:project_x_task_management_freelance/providers/authentication/authentication_provider.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/routing/app_router.gr.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:project_x_task_management_freelance/utils/toast.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Consumer2<AuthenticatonProvider, HomeProvider>(
        builder: (context, authState, homeState, _) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    authState.profileImage == null
                        ? Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 100.h,
                                  width: 100.w,
                                  child: SvgPicture.asset(
                                    Assets.images.dottedContainer,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  authState.pickProfileimage();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.person_outlined,
                                      color: darkTextColor,
                                      size: 80.w,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 68.h,
                                right: 120.w,
                                child: Container(
                                  height: 25.h,
                                  width: 25.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff006EFF),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 100.h,
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: borderColor),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        FileImage(authState.profileImage!),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 68.h,
                                right: 120.w,
                                child: InkWell(
                                  onTap: () {
                                    authState.pickProfileimage();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add a Profile Photo",
                          style: subHeadingStyle.copyWith(
                            fontSize: 14.sp,
                            color: blueColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Text(
                      "Enter your Full Name ",
                      style: subHeadingStyle.copyWith(
                          fontSize: 14.sp, color: blueColor),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      hintText: "",
                      keyboardType: TextInputType.name,
                      autofocus: true,
                      controller: authState.nameController,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          authState.updateUserFormStateToInEmpty();
                        } else {
                          authState.updateUserFormStateToFilled();
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Enter your Email Address",
                      style: subHeadingStyle.copyWith(
                          fontSize: 14.sp, color: blueColor),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      hintText: "",
                      keyboardType: TextInputType.emailAddress,
                      controller: authState.emailController,
                      onChanged: (value) {},
                    ),
                    const Spacer(),
                    authState.nameController.text.isEmpty
                        ? InkWell(
                            onTap: () {
                              AutoRouter.of(context).pushAndPopUntil(
                                const AppBaseRoute(),
                                predicate: (route) {
                                  return false;
                                },
                              );
                            },
                            child: CommonContainer(
                              color: const Color(0xffE2E2E2),
                              child: Text(
                                "Skip",
                                style: subHeadingStyle.copyWith(
                                  fontSize: 18.sp,
                                  color: const Color(0xff858585),
                                ),
                              ),
                            ),
                          )
                        : authState.authenticatonStates ==
                                AuthenticatonState.loading
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: blueColor,
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      getIt<AppPrefs>()
                                          .registerScreenState
                                          .setValue(true);
                                      setState(() {});
                                      AutoRouter.of(context).pushAndPopUntil(
                                        const AppBaseRoute(),
                                        predicate: (route) {
                                          return false;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: 165.w,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE2E2E2),
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Skip",
                                          style: subHeadingStyle.copyWith(
                                              fontSize: 18.sp,
                                              color: const Color(0xff858585)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (authState
                                          .nameController.text.isEmpty) {
                                        showToast("Please fill all details!!!",
                                            redColor);
                                      } else if (EmailValidator.validate(
                                              authState.emailController.text) !=
                                          true) {
                                        showToast(
                                            "Please enter a valid email!!!",
                                            redColor);
                                      } else {
                                        authState.updateUserProfile(context);
                                      }
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: 165.w,
                                      decoration: BoxDecoration(
                                        color: blueColor,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
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
            ),
          );
        },
      ),
    );
  }
}
