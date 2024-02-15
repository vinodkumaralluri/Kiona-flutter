// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:project_x_task_management_freelance/core/api_client.dart'
    as _i3;
import 'package:project_x_task_management_freelance/domain/authentication/imp_auth_repo.dart'
    as _i5;
import 'package:project_x_task_management_freelance/domain/home/imp_home_repo.dart'
    as _i7;
import 'package:project_x_task_management_freelance/infrastructure/authentication/authentication_repository.dart'
    as _i6;
import 'package:project_x_task_management_freelance/infrastructure/home/home_repository.dart'
    as _i8;
import 'package:project_x_task_management_freelance/providers/appbase/app_base_provider.dart'
    as _i4;
import 'package:project_x_task_management_freelance/providers/authentication/authentication_provider.dart'
    as _i10;
import 'package:project_x_task_management_freelance/providers/home/home_provider.dart'
    as _i11;
import 'package:project_x_task_management_freelance/providers/splash/splash_provider.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.APIClient>(() => _i3.APIClient());
    gh.factory<_i4.AppBaseProvider>(() => _i4.AppBaseProvider());
    gh.lazySingleton<_i5.ImpAuthRepository>(
        () => _i6.AuthenticationRepo(gh<_i3.APIClient>()));
    gh.lazySingleton<_i7.ImpHomeRepository>(
        () => _i8.HomeRepo(gh<_i3.APIClient>()));
    gh.factory<_i9.SplashProvider>(() => _i9.SplashProvider());
    gh.factory<_i10.AuthenticatonProvider>(
        () => _i10.AuthenticatonProvider(gh<_i5.ImpAuthRepository>()));
    gh.factory<_i11.HomeProvider>(
        () => _i11.HomeProvider(gh<_i7.ImpHomeRepository>()));
    return this;
  }
}
