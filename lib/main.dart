import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:project_x_task_management_freelance/core/prefs.dart';
import 'package:project_x_task_management_freelance/injection/injection.dart';
import 'package:project_x_task_management_freelance/providers/provider.dart';
import 'package:project_x_task_management_freelance/routing/app_router.dart';
import 'package:provider/provider.dart';

void main() async {
  configureInjection(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     
        builder: (context, child) {
          return MaterialApp.router(
            
            routeInformationParser: _appRouter.defaultRouteParser(),
            title: "Project X",
          );
        },
      ),
    );
  }
}
