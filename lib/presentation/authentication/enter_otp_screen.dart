import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_back_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_container.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_title_widget.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_scaffold.dart';
import 'package:project_x_task_management_freelance/providers/authentication/authentication_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:project_x_task_management_freelance/utils/toast.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EnterOTPScreen extends StatefulWidget {
  const EnterOTPScreen({super.key});

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthenticatonProvider>(context, listen: false).startTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Consumer<AuthenticatonProvider>(
        builder: (context, authState, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                const CommonBackWidget(),
                SizedBox(height: 80.h),
                const CommonTitleWidget(),
                SizedBox(height: 40.h),
                Text(
                  "Enter the code sent to (+91 ${authState.phoneController.text})",
                  style: headingStyle.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 15.h),
                if (context.mounted)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      enablePinAutofill: true,
                      enableActiveFill: true,
                      autoFocus: true,
                      controller: authState.otpController,
                      animationType: AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      onCompleted: (otp) async {
                        if (otp.length == 6 &&
                            authState.otpSentEntity!.data.otp.toString() ==
                                otp) {
                          authState.updateButtonStateToActive();
                          authState.verifyOtp(context);
                        } else {
                          showToast("Enter a valid OTP !!!", redColor);
                          setState(() {});
                        }
                      },
                      keyboardType: TextInputType.number,
                      appContext: context,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5.w),
                        fieldHeight: 50.h,
                        fieldWidth: 35.w,
                        borderWidth: 0.2.w,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        activeColor: const Color(0xffC3C3C3),
                        disabledColor: const Color(0xffC3C3C3),
                        inactiveColor: const Color(0xffC3C3C3),
                        selectedColor: darkTextColor,
                        errorBorderColor: redColor,
                        selectedBorderWidth: 0.8.w,
                        activeBorderWidth: 0.8.w,
                        disabledBorderWidth: 0.8.w,
                      ),
                      cursorColor: Colors.white,
                      textStyle: headingStyle.copyWith(fontSize: 14.sp),
                    ),
                  ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await authState.sendOTP(context, true);
                        authState.startTimer();
                      },
                      child: Text(
                        "Resend OTP",
                        style: subHeadingStyle.copyWith(
                          color: authState.isTimerStarted
                              ? const Color(0xff858585)
                              : const Color(0xff006EFF),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    authState.isTimerStarted
                        ? Text(
                            "(${authState.start})",
                            style: subHeadingStyle.copyWith(
                              color: const Color(0xff858585),
                              fontSize: 12.sp,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    if (authState.otpController.text.length == 6 &&
                        authState.otpSentEntity!.data.otp.toString() ==
                            authState.otpController.text) {
                      authState.updateButtonStateToActive();
                      authState.verifyOtp(context);
                    } else {
                      showToast("Enter a valid OTP !!!", redColor);
                      setState(() {});
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
                          ))
                        : Text(
                            "Confirm",
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
              ],
            ),
          );
        },
      ),
    );
  }
}
