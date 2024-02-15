import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_container.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_title_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_scaffold.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_textfield.dart';
import 'package:project_x_task_management_freelance/providers/authentication/authentication_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

@RoutePage()
class UserSignInScreen extends StatelessWidget {
  const UserSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Consumer<AuthenticatonProvider>(
        builder: (context, authState, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                const CommonTitleWidget(),
                SizedBox(height: 40.h),
                Text(
                  "What’s your phone number?",
                  style: subHeadingStyle.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 40.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: backGroundColor,
                    border: Border.all(
                      color: const Color(0xffC3C3C3),
                      width: 1.w,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "+91",
                              style: subHeadingStyle.copyWith(fontSize: 14.sp),
                            ),
                            SizedBox(width: 2.w),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 15.w,
                              color: const Color(0xff323232),
                            ),
                            SizedBox(width: 4.w),
                            const VerticalDivider(
                              color: Color(0xffC3C3C3),
                            ),
                          ],
                        ),
                        CustomTextField(
                          hintText: "",
                          width: 250.w,
                          keyboardType: TextInputType.phone,
                          autofocus: true,
                          borderColor: Colors.transparent,
                          controller: authState.phoneController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          onChanged: (value) {
                            if (value.length == 10) {
                              authState.updateButtonStateToActive();
                            } else {
                              authState.updateButtonStateToInActive();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    if (authState.buttonState == ButtonState.active) {
                      authState.sendOTP(context, false);
                    }
                  },
                  child: CommonContainer(
                    color: authState.buttonState == ButtonState.inactive
                        ? const Color(0xffE2E2E2)
                        : blueColor,
                    child: authState.authenticatonStates ==
                            AuthenticatonState.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Next",
                            style: subHeadingStyle.copyWith(
                              fontSize: 18.sp,
                              color:
                                  authState.buttonState == ButtonState.inactive
                                      ? const Color(0xff858585)
                                      : Colors.white,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "By tapping next you are creating an account and you agree to ",
                          style: subHeadingStyle.copyWith(
                            fontSize: 10.sp,
                            color: const Color(0xff515151),
                          ),
                        ),
                        TextSpan(
                          text: "Account Terms ",
                          style: subHeadingStyle.copyWith(
                            fontSize: 10.sp,
                            color: const Color(0xff006eff),
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: subHeadingStyle.copyWith(
                            fontSize: 10.sp,
                            color: const Color(0xff515151),
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy.",
                          style: subHeadingStyle.copyWith(
                            fontSize: 10.sp,
                            color: const Color(0xff006eff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
