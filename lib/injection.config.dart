// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;

import 'core/api/api_consumer.dart' as _i3;
import 'core/api/dio_consumer.dart' as _i4;
import 'core/api/logging_interceptor.dart' as _i7;
import 'core/error/error_interceptor.dart' as _i6;
import 'core/network/network_info.dart' as _i8;
import 'core/utils/shared_preference_utils.dart' as _i10;

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
    gh.singleton<_i3.ApiConsumer>(() => _i4.DioConsumer(gh<_i5.Dio>()));
    gh.singleton<_i6.ErrorInterceptor>(() => _i6.ErrorInterceptor());
    gh.singleton<_i7.LoggingInterceptor>(() => _i7.LoggingInterceptor());
    gh.lazySingleton<_i8.NetworkInfo>(() => _i8.NetworkInfoImpl(
        connectionChecker: gh<_i9.InternetConnectionChecker>()));
    gh.singleton<_i10.SharedPreferencesUtils>(
        () => _i10.SharedPreferencesUtils());
    return this;
  }
}
