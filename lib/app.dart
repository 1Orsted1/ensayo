import 'package:ensayo/application/logs/logs_bloc.dart';
import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/application/session/session_bloc.dart';
import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/session/session_status.dart';
import 'package:ensayo/domain/theme/i_personalized_theme.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/injection.dart';
import 'package:ensayo/presentation/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
        BlocProvider(create: (context) => getIt<MetricsCubit>()..load()),
        BlocProvider(
          create: (context) =>
              getIt<PlanBloc>()..add(const PlanEvent.started()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<SessionBloc>()..add(const SessionEvent.restored()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<LogsBloc>()..add(const LogsEvent.started()),
        ),
      ],
      child: BlocListener<SessionBloc, SessionState>(
        listenWhen: (previous, current) =>
            previous.status != SessionStatus.idle &&
            current.status == SessionStatus.idle,
        listener: (context, state) {
          context.read<MetricsCubit>().load();
          context.read<LogsBloc>().add(const LogsEvent.started());
        },
        child: BlocBuilder<ThemeCubit, SelectedTheme>(
          builder: (context, selectedTheme) {
            return MaterialApp.router(
              title: 'Ensayo',
              theme: getIt<IPersonalizedTheme>(
                instanceName: selectedTheme.value,
              ).getTheme(),
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              routerConfig: appRouter,
            );
          },
        ),
      ),
    );
  }
}
