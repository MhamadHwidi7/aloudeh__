// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import 'core/api/api_consumer.dart' as _i9;
import 'core/api/dio_consumer.dart' as _i10;
import 'core/api/logging_interceptor.dart' as _i6;
import 'core/error/error_interceptor.dart' as _i4;
import 'core/network/network_info.dart' as _i7;
import 'core/third_party_injection.dart' as _i15;
import 'core/utils/shared_preference_utils.dart' as _i8;
import 'features/admin/data/repository/admin_repository.dart' as _i12;
import 'features/admin/data/web_services/admin_web_service.dart' as _i11;
import 'features/admin/presentation/controllers/cubit/log_in_cubit.dart'
    as _i13;
import 'features/admin/presentation/controllers/register_cubit.dart' as _i14;

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
    final thirdPartyInjection = _$ThirdPartyInjection();
    gh.singleton<_i3.Dio>(() => thirdPartyInjection.dio);
    gh.singleton<_i4.ErrorInterceptor>(() => _i4.ErrorInterceptor());
    gh.singleton<_i5.InternetConnectionChecker>(
        () => thirdPartyInjection.internetConnectionChecker);
    gh.singleton<_i6.LoggingInterceptor>(() => _i6.LoggingInterceptor());
    gh.lazySingleton<_i7.NetworkInfo>(() => _i7.NetworkInfoImpl(
        connectionChecker: gh<_i5.InternetConnectionChecker>()));
    gh.singleton<_i8.SharedPreferencesUtils>(
        () => thirdPartyInjection.sharedPreferencesUtils);
    gh.singleton<_i9.ApiConsumer>(() => _i10.DioConsumer(gh<_i3.Dio>()));
    gh.singleton<_i11.AdminBaseWebService>(
        () => _i11.AdminWebService(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.singleton<_i12.AdminBaseRepository>(() => _i12.AdminRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          adminBaseWebService: gh<_i11.AdminBaseWebService>(),
        ));
    gh.factory<_i13.LogInCubit>(() => _i13.LogInCubit(
          gh<_i12.AdminBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i14.RegisterCubit>(() => _i14.RegisterCubit(
          gh<_i12.AdminBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    return this;
  }
}

class _$ThirdPartyInjection extends _i15.ThirdPartyInjection {}
