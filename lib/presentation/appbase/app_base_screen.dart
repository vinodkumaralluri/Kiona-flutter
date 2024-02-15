// Flutter imports:
// Package imports:

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_x_task_management_freelance/presentation/widgets/custom_scaffold.dart';
import 'package:project_x_task_management_freelance/providers/appbase/app_base_provider.dart';
import 'package:project_x_task_management_freelance/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AppBaseScreen extends StatelessWidget {
  const AppBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      homeIndex: 0,
      routes: const [
        HomeRoute(),
      ],
      builder: (context, child) {
        return CustomScaffold(
          body: Consumer<AppBaseProvider>(
            builder: (context, appBaseState, _) {
              return Stack(
                children: [
                  CustomScaffold(
                    body: child,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
