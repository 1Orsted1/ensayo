// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:drift/backends.dart' as _i883;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:flutter_soloud/flutter_soloud.dart' as _i956;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'application/metrics/metrics_cubit.dart' as _i600;
import 'application/metronome/metronome_bloc.dart' as _i516;
import 'application/no-brainer/playground_bloc.dart' as _i137;
import 'application/theme/theme_cubit.dart' as _i309;
import 'domain/metrics/i_metrics_data_source.dart' as _i864;
import 'domain/metrics/i_metrics_facade.dart' as _i159;
import 'domain/no-brainer/i_playground_data_source.dart' as _i897;
import 'domain/no-brainer/i_playground_facade.dart' as _i900;
import 'domain/theme/i_personalized_theme.dart' as _i130;
import 'infra/app_database.dart' as _i437;
import 'infra/core/register_module.dart' as _i390;
import 'infra/metrics/metrics_data_source_imp.dart' as _i825;
import 'infra/metrics/metrics_facade_imp.dart' as _i846;
import 'infra/no-brainer/playground_data_source_imp.dart' as _i173;
import 'infra/no-brainer/playground_facade_imp.dart' as _i15;
import 'presentation/theme/ensayo_theme_dark.dart' as _i213;
import 'presentation/theme/ensayo_theme_light.dart' as _i553;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i516.MetronomeBloc>(() => _i516.MetronomeBloc());
    gh.lazySingleton<_i309.ThemeCubit>(() => _i309.ThemeCubit());
    gh.lazySingletonAsync<_i956.SoLoud>(() => registerModule.soLoud);
    gh.lazySingleton<_i398.FirebaseAnalytics>(
      () => registerModule.getAnalitics(),
    );
    gh.factory<_i897.IPlaygroundDataSource>(
      () => _i173.PlaygroundDataSourceImp(),
    );
    gh.factory<_i900.IPlaygroundFacade>(
      () => _i15.PlaygroundFacadeImp(
        playgroundDataSource: gh<_i897.IPlaygroundDataSource>(),
      ),
    );
    gh.factory<_i130.IPersonalizedTheme>(
      () => _i553.EnsayoThemeLight(),
      instanceName: 'light',
    );
    await gh.lazySingletonAsync<_i883.QueryExecutor>(
      () => registerModule.databaseExecutor,
      registerFor: {_dev, _prod},
      preResolve: true,
    );
    gh.factory<_i130.IPersonalizedTheme>(
      () => _i213.EnsayoThemeDark(),
      instanceName: 'dark',
    );
    await gh.lazySingletonAsync<_i883.QueryExecutor>(
      () => registerModule.databaseExecutorTest,
      registerFor: {_test},
      preResolve: true,
    );
    gh.singleton<_i137.PlaygroundBloc>(
      () => _i137.PlaygroundBloc(gh<_i900.IPlaygroundFacade>()),
    );
    gh.lazySingleton<_i437.AppDatabase>(
      () => registerModule.database(gh<_i883.QueryExecutor>()),
    );
    gh.factory<_i864.IMetricsDataSource>(
      () => _i825.MetricsDataSourceImp(dataBase: gh<_i437.AppDatabase>()),
    );
    gh.factory<_i159.IMetricsFacade>(
      () => _i846.MetricsFacadeImp(
        metricsDataSource: gh<_i864.IMetricsDataSource>(),
      ),
    );
    gh.lazySingleton<_i600.MetricsCubit>(
      () => _i600.MetricsCubit(gh<_i159.IMetricsFacade>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i390.RegisterModule {}
