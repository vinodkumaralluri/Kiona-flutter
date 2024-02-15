// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:project_x_task_management_freelance/domain/home/task_list_entity.dart'
    as _i12;
import 'package:project_x_task_management_freelance/presentation/appbase/app_base_screen.dart'
    as _i1;
import 'package:project_x_task_management_freelance/presentation/authentication/enter_otp_screen.dart'
    as _i3;
import 'package:project_x_task_management_freelance/presentation/authentication/registeration_screen.dart'
    as _i6;
import 'package:project_x_task_management_freelance/presentation/authentication/user_signin_screen.dart'
    as _i9;
import 'package:project_x_task_management_freelance/presentation/home/home_screen.dart'
    as _i4;
import 'package:project_x_task_management_freelance/presentation/home/task_view_screen.dart'
    as _i8;
import 'package:project_x_task_management_freelance/presentation/profile/profile_screen.dart'
    as _i5;
import 'package:project_x_task_management_freelance/presentation/profile/widget/edit_profile_screen.dart'
    as _i2;
import 'package:project_x_task_management_freelance/presentation/splash/splash_screen.dart'
    as _i7;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AppBaseRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppBaseScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditProfileScreen(),
      );
    },
    EnterOTPRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EnterOTPScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
    RegisterationRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterationScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
    TaskViewRoute.name: (routeData) {
      final args = routeData.argsAs<TaskViewRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.TaskViewScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
    UserSignInRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.UserSignInScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppBaseScreen]
class AppBaseRoute extends _i10.PageRouteInfo<void> {
  const AppBaseRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AppBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBaseRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditProfileScreen]
class EditProfileRoute extends _i10.PageRouteInfo<void> {
  const EditProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EnterOTPScreen]
class EnterOTPRoute extends _i10.PageRouteInfo<void> {
  const EnterOTPRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EnterOTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterOTPRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterationScreen]
class RegisterationRoute extends _i10.PageRouteInfo<void> {
  const RegisterationRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegisterationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterationRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TaskViewScreen]
class TaskViewRoute extends _i10.PageRouteInfo<TaskViewRouteArgs> {
  TaskViewRoute({
    _i11.Key? key,
    required _i12.Task data,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          TaskViewRoute.name,
          args: TaskViewRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskViewRoute';

  static const _i10.PageInfo<TaskViewRouteArgs> page =
      _i10.PageInfo<TaskViewRouteArgs>(name);
}

class TaskViewRouteArgs {
  const TaskViewRouteArgs({
    this.key,
    required this.data,
  });

  final _i11.Key? key;

  final _i12.Task data;

  @override
  String toString() {
    return 'TaskViewRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i9.UserSignInScreen]
class UserSignInRoute extends _i10.PageRouteInfo<void> {
  const UserSignInRoute({List<_i10.PageRouteInfo>? children})
      : super(
          UserSignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSignInRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
