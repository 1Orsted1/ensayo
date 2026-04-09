// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:drift/backends.dart' as _i883;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'application/theme/theme_cubit.dart' as _i309;
import 'infra/app_database.dart' as _i437;
import 'infra/register_module.dart' as _i761;
import 'presentation/theme/ensayo_theme_dark.dart' as _i213;
import 'presentation/theme/ensayo_theme_light.dart' as _i553;
import 'domain/theme/i_personalized_theme.dart' as _i240;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.getSharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i309.ThemeCubit>(() => _i309.ThemeCubit());
    await gh.lazySingletonAsync<_i883.QueryExecutor>(
      () => registerModule.databaseExecutor,
      preResolve: true,
    );
    gh.lazySingleton<_i437.AppDatabase>(
      () => registerModule.database(gh<_i883.QueryExecutor>()),
    );
    gh.factory<_i240.IPersonalizedTheme>(
      () => _i553.EnsayoThemeLight(),
      instanceName: 'light',
    );
    gh.factory<_i240.IPersonalizedTheme>(
      () => _i213.EnsayoThemeDark(),
      instanceName: 'dark',
    );
    return this;
  }
}

class _$RegisterModule extends _i761.RegisterModule {}
