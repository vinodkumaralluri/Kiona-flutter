import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/all_section.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/assigned_task_section.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/create-task/create_task_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/custom_heading_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/custom_home_section_widget.dart';
import 'package:project_x_task_management_freelance/presentation/home/widget/my_task_section.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_scaffold.dart';
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/text_styles.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HomeProvider>(context, listen: false).getTask();
      if (context.mounted) {
        await Provider.of<HomeProvider>(context, listen: false)
            .getUserProfile();
      }
      if (context.mounted) {
        await Provider.of<HomeProvider>(context, listen: false)
            .requestContactsPermission();
      }
      if (context.mounted) {
        await Provider.of<HomeProvider>(context, listen: false).getContacts();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, _) {
        return CustomScaffold(
          floatingActionButton: homeState.combainedTaskList.isNotEmpty
              ? FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  onPressed: () {
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
                        return const CreateTaskWidget(
                          isTaskUpdate: false,
                        );
                      },
                    );
                  },
                  backgroundColor: greenColor,
                  label: Text(
                    'New Task',
                    style: subHeadingStyle.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : const SizedBox.shrink(),
          body: homeState.homeStates == HomeState.loading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: blueColor,
                ))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const CustomHeadingWidget(),
                      SizedBox(height: 20.h),
                      const CustomHomeSectionWidget(),
                      SizedBox(height: 20.h),
                      homeState.homeSection == "All"
                          ? const AllSection()
                          : homeState.homeSection == "My Tasks"
                              ? const MyTaskSection()
                              : const AssignedTaskSection(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
