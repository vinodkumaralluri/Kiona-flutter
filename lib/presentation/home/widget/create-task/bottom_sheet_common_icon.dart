import 'package:flutter/material.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';

class BottomSheetCommonMenuIcon extends StatelessWidget {
  const BottomSheetCommonMenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.more_horiz,
          color: lightTextColor,
        ),
      ],
    );
  }
}
