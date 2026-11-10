# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Flutter Version

This project uses FVM. Always use `fvm flutter` instead of `flutter` directly.

```bash
fvm flutter pub get
fvm flutter run -t lib/main_dev.dart
fvm flutter run -t lib/main_prod.dart
```

The pinned version is **3.38.7** (see `.fvmrc`).

## Common Commands

```bash
# Code generation (Drift DB + Injectable DI) — run after changing annotated files
fvm flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode during development
fvm flutter pub run build_runner watch --delete-conflicting-outputs

# Analyze
fvm flutter analyze

# Tests
fvm flutter test --coverage
```

## Architecture

The app follows **Clean Architecture** with four layers:

| Layer | Path | Role |
|---|---|---|
| Domain | `lib/domain/` | Table definitions (Drift), interfaces, pure models |
| Infrastructure | `lib/infra/` | Drift database class, Injectable module (DB wiring) |
| Application | `lib/application/` | BLoC/Cubit state management (use cases) |
| Presentation | `lib/presentation/` | UI screens, widgets, router, themes |

**Entry points:** `lib/main_dev.dart` and `lib/main_prod.dart` bootstrap the app with environment-specific configuration. Both call `configureDependencies(env)` for environment-aware DI, then set up `HydratedBloc` storage before `runApp`.

## Key Patterns

### Dependency Injection (Injectable + GetIt)
Register dependencies with `@lazySingleton`, `@injectable`, or `@module` annotations, then re-run build_runner. The generated `injection.config.dart` must not be edited manually. Call `configureDependencies('dev' | 'prod')` at startup.

### Database (Drift)
Table schemas live in `lib/domain/db/` as plain Dart classes annotated with `@DataClassName`. The central `@DriftDatabase` class is `AppDatabase` in `lib/infra/app_database.dart` — it must reference all tables. After adding a table, add it to `AppDatabase.tables` and run build_runner.

For tests, use `NativeDatabase.memory()` instead of the Flutter backend.

### State Management (BLoC/Cubit)
Theme state uses `HydratedCubit` for automatic persistence. New feature state should live in `lib/application/<feature>/`. Use `Bloc` by default; use a plain `Cubit` only when it clearly fits better (e.g. simple state with no event modeling), and say why in the design.

### Navigation (GoRouter)
Router is configured in `lib/presentation/core/app_router.dart` using `StatefulShellRoute` for the 4-tab bottom navigation (Home → Plan → Session → Progress). Each tab has its own navigation branch.

### Theming
Dual-font Material 3 theme with full light/dark coverage. Light theme: `lib/presentation/theme/ensayo_theme_light.dart`; dark: `ensayo_theme_dark.dart`. Custom extensions (card styles, etc.) in `lib/presentation/theme/extensions/`. Theme switching is managed by `ThemeCubit`.

## Database Schema

Six Drift tables: `Metrics` (streak/goal tracking), `PracticeLogs` (sessions with feelings), `Songs`, `Tags`, `TagsAssigned` (songs↔tags join), and `Feelings`.

## CI

GitHub Actions runs `flutter analyze` and `flutter test --coverage` on every push/PR to `main`. Both must pass before merging.
