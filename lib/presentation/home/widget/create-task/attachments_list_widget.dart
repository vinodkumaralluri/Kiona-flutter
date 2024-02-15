import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_x_task_management_freelance/gen/assets.gen.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class AttachmentsListWidget extends StatelessWidget {
  const AttachmentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              homeState.pickedDocsList.length,
              (index) {
                final data = homeState.pickedDocsList[index];
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Stack(
                    children: [
                      Container(
                        height: 62.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: backGroundColor,
                          border: Border.all(
                            color: const Color(0xffC3C3C3),
                            width: 1.w,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  Assets.images.pdfAttachments,
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        data.fileName,
                                        style: headingStyle.copyWith(
                                          color: darkTextColor,
                                          fontSize: 12.sp,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "PDF",
                                      style: subHeadingStyle.copyWith(
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
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            homeState.deleteFileData(index);
                          },
                          child: SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: const Center(
                              child: Icon(
                                Icons.cancel_sharp,
                                color: darkTextColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
