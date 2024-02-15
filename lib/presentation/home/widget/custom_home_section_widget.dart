import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/filter/select_filter_widget.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class CustomHomeSectionWidget extends StatelessWidget {
  const CustomHomeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    homeState.homeSectionEntity.length,
                    (index) {
                      final data = homeState.homeSectionEntity[index];
                      return InkWell(
                        onTap: () {
                          homeState.updateHomeSection(data);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 25.w),
                          child: Column(
                            children: [
                              Text(
                                data,
                                style: subHeadingStyle.copyWith(
                                  fontSize: 14.sp,
                                  color: data == homeState.homeSection
                                      ? blueColor
                                      : lightTextColor,
                                ),
                              ),
                              SizedBox(height: 7.h),
                              Container(
                                height: 2.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: data == homeState.homeSection
                                      ? blueColor
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
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
                          return const SelectFilterWidget();
                        },
                      );
                    },
                    child: Icon(
                      Icons.filter_list,
                      color: lightTextColor,
                      size: 25.w,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1.h,
              width: MediaQuery.sizeOf(context).width,
              color: borderColor,
            ),
          ],
        );
      },
    );
  }
}
