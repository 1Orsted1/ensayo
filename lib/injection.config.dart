// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'application/theme/theme_bloc.dart' as _i353;
import 'domain/theme/i_theme_facade.dart' as _i827;
import 'infra/theme/theme_facade_impl.dart' as _i915;
import 'presentation/theme/ensayo_theme_dark.dart' as _i213;
import 'presentation/theme/ensayo_theme_light.dart' as _i553;
import 'presentation/theme/i_personalized_theme.dart' as _i240;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i827.IThemeFacade>(() => _i915.ThemeFacadeImpl());
    gh.factory<_i240.IPersonalizedTheme>(
      () => _i553.EnsayoThemeLight(),
      instanceName: 'light',
    );
    gh.factory<_i240.IPersonalizedTheme>(
      () => _i213.EnsayoThemeDark(),
      instanceName: 'dark',
    );
    gh.factory<_i353.ThemeBloc>(
      () => _i353.ThemeBloc(gh<_i827.IThemeFacade>()),
    );
    return this;
  }
}
