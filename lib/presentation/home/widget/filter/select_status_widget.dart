import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/bottom_sheet_common_icon.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/common_container.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class SelectStatusWidget extends StatelessWidget {
  const SelectStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Container(
          height: 400.h,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: greyColor,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "Select Status",
                      style: headingStyle.copyWith(
                        fontSize: 16.sp,
                        color: darkTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ...List.generate(
                  homeState.filterStatusOptions.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: InkWell(
                        onTap: () {
                          homeState.updateFilterTaskStatus(index);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: index == 0
                                        ? blueColor
                                        : index == 1
                                            ? yelloFadeColor
                                            : index == 2
                                                ? greenColor
                                                : redColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      homeState.filterStatusOptions[index],
                                      style: headingStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                homeState.selectedStatusOption[index]
                                    ? const Icon(
                                        Icons.check,
                                        color: blueColor,
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Divider(
                              thickness: 1.w,
                              color: borderColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: InkWell(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: CommonContainer(
                      color: blueColor,
                      child: Text(
                        "Save",
                        style: headingStyle.copyWith(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
