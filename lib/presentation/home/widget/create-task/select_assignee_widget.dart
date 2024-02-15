import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/bottom_sheet_common_icon.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_textfield.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

class SelectAssigneeWidget extends StatelessWidget {
  const SelectAssigneeWidget({super.key, required this.isFilter});
  final bool isFilter;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return Container(
          height: 650.h,
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BottomSheetCommonMenuIcon(),
                  SizedBox(height: 5.h),
                  Text(
                    "Select Assignee",
                    style: headingStyle.copyWith(
                      fontSize: 16.sp,
                      color: darkTextColor,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextField(
                    hintText: "Search by name",
                    keyboardType: TextInputType.name,
                    prefix: const Icon(Icons.search, color: greyColor),
                    controller: homeState.searchAssigneeController,
                    onChanged: (value) {
                      homeState.seacrhContactList(value);
                    },
                    height: 40.h,
                    hintTextColor: greyColor,
                  ),
                  SizedBox(height: 30.h),
                  homeState.contactStates == ContactState.loading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: blueColor,
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 440.h,
                          child: ListView.builder(
                            itemCount: homeState.filteredItems.length,
                            itemBuilder: (context, index) {
                              final data = homeState.filteredItems[index];

                              String displayName = data.displayName ?? '';
                              Uint8List photo = data.avatar!;
                              String phoneNumber = data.phones!.isNotEmpty
                                  ? data.phones!.first.value ?? ''
                                  : '';
                              return phoneNumber.isEmpty
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: EdgeInsets.only(bottom: 15.h),
                                      child: InkWell(
                                        onTap: () {
                                          homeState.updateselectedAssigneeId(
                                            phoneNumber,
                                            displayName,
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                photo.isEmpty
                                                    ? Container(
                                                        height: 35.h,
                                                        width: 35.w,
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    blueColor),
                                                        child: Center(
                                                          child: Text(
                                                            "NA",
                                                            style:
                                                                subHeadingStyle
                                                                    .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        height: 35.h,
                                                        width: 35.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: MemoryImage(
                                                                photo),
                                                          ),
                                                        ),
                                                      ),
                                                SizedBox(width: 15.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      displayName,
                                                      style:
                                                          headingStyle.copyWith(
                                                        fontSize: 12.sp,
                                                        color: homeState
                                                                .assigneeIdList
                                                                .contains(
                                                                    phoneNumber)
                                                            ? blueColor
                                                            : lightTextColor,
                                                      ),
                                                    ),
                                                    SizedBox(height: 3.h),
                                                    Text(
                                                      phoneNumber,
                                                      style:
                                                          headingStyle.copyWith(
                                                        fontSize: 12.sp,
                                                        color: homeState
                                                                .assigneeIdList
                                                                .contains(
                                                                    phoneNumber)
                                                            ? blueColor
                                                            : darkTextColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                homeState.assigneeIdList
                                                        .contains(phoneNumber)
                                                    ? const Icon(
                                                        Icons.check,
                                                        color: darkBlueColor,
                                                      )
                                                    : const SizedBox.shrink(),
                                              ],
                                            ),
                                            SizedBox(height: 5.h),
                                            Divider(
                                              thickness: 1.h,
                                              color: borderColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                            },
                          ),
                        ),
                  homeState.contactStates == ContactState.loading
                      ? const SizedBox.shrink()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (isFilter) {
                                  homeState.filterTaskListByAssignee(true);
                                  AutoRouter.of(context).pop();
                                } else {
                                  AutoRouter.of(context).pop();
                                }
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
                                if (isFilter) {
                                  homeState.filterTaskListByAssignee(false);
                                  AutoRouter.of(context).pop();
                                } else {
                                  AutoRouter.of(context).pop();
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
    );
  }
}
