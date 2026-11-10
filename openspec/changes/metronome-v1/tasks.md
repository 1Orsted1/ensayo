# Tasks

**Implementation rules**
- Use fvm for every flutter/dart command. Never edit generated files; change the source and re-run build_runner.
- After each task, run `fvm flutter analyze` and `fvm flutter test`. Check it off only when both pass, then add a one-line result note with the date.
- If the implementation needs to differ from design.md or the specs, stop and update the artifacts first.
- Never perform a gated action unless its row in design.md's Gated actions table is marked ☑. If it is still ☐, stop and ask.

Spec references: **M** = `specs/metronome/spec.md`, **I** = `specs/metronome-indicator/spec.md`. Design references: D1–D12, G-1–G-5.

## 1. Setup

- [x] 1.1 ⚠️ G-5 Add `mockito` to `dev_dependencies`. Files: `pubspec.yaml`. Requirements: none (test tooling). Verify: `fvm flutter pub get` succeeds, analyze clean, existing tests green. — Result 2026-10-26: mockito ^5.6.4 added; analyze clean, 1/1 tests green.
- [x] 1.2 ⚠️ G-1 Add `audio_session` to `dependencies`. Files: `pubspec.yaml`. Requirements: none yet (used in 3.2). Verify: `fvm flutter pub get` succeeds; `fvm flutter build apk --debug` and `fvm flutter build ios --debug --no-codesign` both compile. — Result 2026-10-26: audio_session ^0.2.4 added; debug APK and iOS (no-codesign) builds succeed; analyze clean, tests green.
- [x] 1.3 ⚠️ G-2 Register `SoLoud` as a synchronous `@lazySingleton` returning `SoLoud.instance` in `register_module.dart`, then run `fvm flutter pub run build_runner build --delete-conflicting-outputs`. Files: `lib/infra/core/register_module.dart`, regenerated `lib/injection.config.dart`. Requirements: none (DI wiring). Verify: generated config shows `gh.lazySingleton<SoLoud>`; analyze clean; `test/infra/theme_registration_test.dart` still green. — Result 2026-10-26: SoLoud now gh.lazySingleton<SoLoud>; build_runner ok; analyze clean, tests green.

## 2. Domain: pure metronome logic

- [x] 2.1 Write `tempo_test.dart` first, then add `tempo.dart` (`minBpm`, `maxBpm`, `defaultBpm`, `clampBpm`, `isValidBpm`). Files: `lib/domain/metronome/tempo.dart`, `test/domain/metronome/tempo_test.dart`. Requirements: M Tempo range and steps, M Default tempo on first run. Verify: 4 tests green (bounds, clamp below 1, clamp above 300, validity). — Result 2026-10-26: tempo.dart + 4 tests green; analyze clean.
- [x] 2.2 Write `beat_timeline_test.dart` first, then add `BeatTimeline` (microsecond anchor + interval, `timeOfBeat`, `nextBeatAfter`, `retempo`; D1, D3). Files: `lib/domain/metronome/beat_timeline.dart`, `test/domain/metronome/beat_timeline_test.dart`. Requirements: M Beat timing without drift, M Tempo change while running. Verify: ~10 tests green, including beat 1 200 at 120 BPM = exactly 600 000 ms, 1 and 300 BPM intervals, retempo next = last + new interval, past-due retempo = now. — Result 2026-10-26: BeatTimeline + 11 tests green (incl. 1 200-beat no-drift, retempo, past-due); analyze clean.
- [x] 2.3 Write `click_sound_test.dart` first, then add the WAV synthesizer (D4). Files: `lib/domain/metronome/click_sound.dart`, `test/domain/metronome/click_sound_test.dart`. Requirements: M Offline click sound. Verify: 3 tests green (valid RIFF/WAVE header for 44.1 kHz mono 16-bit, expected sample count, peak ≤ full scale with the first sample near 0). — Result 2026-10-26: click_sound.dart + 3 tests green; analyze clean.
- [x] 2.4 Replace `IMetronomeFacade` (`start(bpm)`, `setBpm`, `stop`, `beats`, `interruptions`), define `IMetronomeDataSource` (`init`, `playClick`, `interruptions`, `dispose`) and add the freezed `MetronomeFailure`; run build_runner. Files: `lib/domain/metronome/i_metronome_facade.dart`, `i_metronome_data_source.dart`, `metronome_failure.dart` (+ generated). Requirements: M Single shared metronome, M Audio unavailable (contracts only). Verify: build_runner succeeds, analyze clean. — Result 2026-10-26: facade/data-source contracts + freezed MetronomeFailure; build_runner ok; analyze clean, 19 tests green.

## 3. Infra: scheduler, audio and facade

- [x] 3.1 Write `beat_scheduler_test.dart` with a fake `Clock` and fake `TimerFactory` first, then add `BeatScheduler` (one-shot timer per beat re-armed from the timeline, D1; late-fire policy, D2; retempo, D3; stop cancels). Files: `lib/infra/metronome/beat_scheduler.dart`, `test/infra/metronome/beat_scheduler_test.dart`. Requirements: M Start and stop, M Beat timing without drift, M Tempo change while running. Verify: ~8 tests green: beat 0 fires immediately; each beat dispatched exactly once within ±5 ms of scheduled time under the fake clock; a late fire under one interval plays once; a multi-beat stall skips without a burst and returns to the timeline; no beat after stop. — Result 2026-10-26: BeatScheduler + 10 fake-clock tests green (exactly-once, ±5 ms under jitter, D2 skip, D3 retempo, stop); analyze clean, 29 tests green.
- [x] 3.2 Implement `MetronomeDataSourceImp` (`@LazySingleton(as: IMetronomeDataSource)`): lazy `SoLoud.init(bufferSize: 256)` (D5), `loadMem` of the synthesized click, `play` per click, `audio_session` configured as `playback` and activated on init, interruption `begin` events forwarded (D8). Files: `lib/infra/metronome/metronome_data_source_imp.dart`. Requirements: M Offline click sound, M Stop on audio interruption, M Audio unavailable. Verify: analyze clean. Not unit-tested (wraps platform audio, which tests must not touch); covered through the mocked interface in 3.3 and the device check in 11.2. — Result 2026-10-26: MetronomeDataSourceImp registered (lazySingleton); SoLoud bufferSize 256 mono, loadMem click, audio_session music config, release() on stop (design D8 amended first), duck ignored; analyze clean, 29 tests green; device check in 11.2.
- [x] 3.3 Write `metronome_facade_imp_test.dart` (mocked data source, fake clock/timers) first, then implement `MetronomeFacadeImp` (`@LazySingleton(as: IMetronomeFacade)`; init once, retry init after failure, `playClick` per scheduled beat, `beats` broadcast, interruptions forwarded); run build_runner. Files: `lib/infra/metronome/metronome_facade_imp.dart`, `test/infra/metronome/metronome_facade_imp_test.dart`, `test/infra/metronome/*.mocks.dart` (generated). Requirements: M Single shared metronome, M Start and stop, M Audio unavailable, M Stop on audio interruption. Verify: ~6 tests green; `getIt<IMetronomeFacade>()` returns the same instance twice (registration test). — Result 2026-10-26: MetronomeFacadeImp lazySingleton + 7 tests green (incl. stop-during-init guard, same-instance registration); analyze clean, 36 tests green.

## 4. Application: MetronomeBloc

- [x] 4.1 Write `metronome_bloc_test.dart` first (mocked facade, mocked HydratedBloc `Storage`), then rewrite `MetronomeBloc` as a `HydratedBloc` `@lazySingleton` with events `started`, `stopped`, `tempoSet`, `tempoStepped`, `appBackgrounded`, `audioInterrupted`, `failureShown` and state `{bpm, isRunning, failure}`; expose `beats`; persist bpm only (D6, D9, D10); run build_runner. Files: `lib/application/metronome/metronome_bloc.dart`, `metronome_event.dart`, `metronome_state.dart` (+ generated), `test/application/metronome/metronome_bloc_test.dart` (+ mocks). Requirements: M Single shared metronome, M Tempo range and steps, M Default tempo on first run, M Tempo is remembered offline, M Start and stop, M Tempo change while running, M Audio unavailable, M Stop when leaving the app, M Stop on audio interruption. Verify: ~14 tests green (default 120 stopped; clamp at 1/300; step ±1; start ok → running; start throws → stopped + failure; stop; background → stopped, bpm kept; interruption → stopped, bpm kept, no auto-resume; toJson has only bpm; fromJson missing/corrupt/out-of-range → null). — Result 2026-10-26: MetronomeBloc rewritten as HydratedBloc lazySingleton + 16 tests green (bounds, start ok/fail, background/interruption stop, bpm-only persistence); analyze clean, 52 tests green.

## 5. Translations

- [x] 5.1 Add translation keys in en + es under `metronome` (card title, BPM label, play/stop/increase/decrease semantics labels, "could not start" message, slider label, indicator stop label, tempo announcement) and regenerate the slang output. Files: `lib/i18n/en.i18n.json`, `lib/i18n/es.i18n.json`, generated `lib/i18n/strings*.g.dart`. Requirements: M Audio unavailable, M Dashboard metronome controls, M Practice screen metronome, M Accessible tempo controls, I Indicator content and stop. Verify: both locales contain the same keys; generation succeeds; analyze clean. — Result 2026-10-26: 9 keys added to en + es (same key set); regenerated with 'fvm dart run slang' (66 strings); analyze clean, 52 tests green.

## 6. App wiring

- [x] 6.1 Write a widget test first that pumps `MetronomeLifecycleListener` with a mocked bloc and simulates `hidden`/`paused` (dispatches `appBackgrounded`) and `inactive` (does not); then add the widget (D8). Files: `lib/presentation/metronome/metronome_lifecycle_listener.dart`, `test/presentation/metronome/metronome_lifecycle_listener_test.dart`. Requirements: M Stop when leaving the app. Verify: 3 tests green. — Result 2026-10-26: MetronomeLifecycleListener + 3 widget tests green (real bloc over mocked facade via test/helpers/metronome_test_harness.dart; mocking the freezed bloc does not compile); analyze clean, 55 tests green.
- [x] 6.2 ⚠️ G-4 Provide `MetronomeBloc` in `App`'s `MultiBlocProvider` and wrap the router child in `MetronomeLifecycleListener`. Files: `lib/app.dart`. Requirements: M Single shared metronome, M Stop when leaving the app. Verify: analyze clean; all tests green; app launches with `fvm flutter run -t lib/main_dev.dart` with no new errors. — Result 2026-10-26: MetronomeBloc provided in App + MetronomeLifecycleListener above the theme builder; analyze clean, 55 tests green; main_dev launched on iPhone 18 Pro simulator with no app errors.

## 7. Shared presentation pieces

- [x] 7.1 Write `metronome_routes_test.dart` first, then add `isMetronomeRoute` (exact `/home`, `/session`). Files: `lib/presentation/metronome/metronome_routes.dart`, test. Requirements: I Indicator visibility. Verify: 5 tests green (`/home` true, `/session` true, `/home/playground` false, `/plan` false, `/progress/demo` false). — Result 2026-10-26: isMetronomeRoute + 5 tests green; analyze clean.
- [x] 7.2 Write `hold_repeat_test.dart` first, then add `repeatDelay` (400 ms first, 150 ms − 15 ms/repeat, 40 ms floor; D7) and the hold gesture wrapper. Files: `lib/presentation/metronome/hold_repeat.dart`, test. Requirements: M Hold to repeat with acceleration. Verify: 3 curve tests green, plus 2 widget tests (hold produces accelerating steps; release stops them). — Result 2026-10-26: repeatDelay + HoldRepeatButton; 3 curve tests + 4 widget tests green (tap, accelerating hold, release, disabled/bound stop); analyze clean, 67 tests green.
- [x] 7.3 Write widget tests first, then add `BeatDots` (4 dots, `beat % 4`, cleared when stopped; D12) and `MetronomePulse` (ripple per beat, modeled on `_SonarPulse`). Files: `lib/presentation/metronome/beat_dots.dart`, `metronome_pulse.dart`, tests. Requirements: M Beat dots, M Practice screen metronome. Verify: dots go 1,2,3,4,1 across five beats and none is lit when stopped; one ripple per beat and none when stopped. — Result 2026-10-26: BeatDots + MetronomePulse (PulseRipple per beat); 4 widget tests green; analyze clean, 71 tests green.

## 8. Dashboard metronome card

- [x] 8.1 Write `metronome_card_test.dart` first (mocked bloc), then rework `MetronomeCard`: tempo in BPM, `-` / play-stop / `+` using the hold wrapper, `BeatDots`, no slider, bound controls disabled, `BlocListener` showing the failure SnackBar and dispatching `failureShown`, semantics labels (D10). Files: `lib/presentation/dashboard/widgets/metronome_card.dart`, `test/presentation/dashboard/widgets/metronome_card_test.dart`. Requirements: M Dashboard metronome controls, M Tempo range and steps, M Hold to repeat with acceleration, M Beat dots, M Audio unavailable, M Accessible tempo controls. Verify: ~8 tests green; no hardcoded user-facing strings (`grep` for quoted literals in the file finds none). — Result 2026-10-26: MetronomeCard reworked (shared MetronomeTempo/MetronomeControls + MetronomeFailureListener); 8 widget tests green; no hardcoded strings; analyze clean, 79 tests green.

## 9. Practice screen metronome

- [x] 9.1 Write `metronome_full_view_test.dart` first, then add `MetronomeFullView` (tempo, `-` / play-stop / `+`, 1–300 slider, `MetronomePulse`, failure SnackBar listener, semantics) and show it in `SessionScreen`. Files: `lib/presentation/metronome/metronome_full_view.dart`, `lib/presentation/dashboard/session_screen.dart`, test. Requirements: M Practice screen metronome, M Single shared metronome, M Audio unavailable, M Accessible tempo controls. Verify: ~5 tests green (slider to 140 dispatches `tempoSet(140)`; pulse per beat; no pulse when stopped; same bloc instance shows the same bpm in card and full view). — Result 2026-10-26: MetronomeFullView (pulse + 1–300 slider + controls) shown in SessionScreen; 5 widget tests green incl. card/full view sharing state; analyze clean, 84 tests green.

## 10. Now-playing indicator

- [x] 10.1 Write `metronome_indicator_test.dart` first, then add `MetronomeIndicator`: tempo + stop control, beat cue, `AnimatedSlide` + `AnimatedOpacity` at 250 ms, fade only when `disableAnimations`, `IgnorePointer` and excluded semantics when hidden (D11, D12). Files: `lib/presentation/metronome/metronome_indicator.dart`, test. Requirements: I Indicator content and stop, I Indicator beat cue, I Indicator transitions, I Reduced motion, I Indicator hides when the metronome stops for any reason. Verify: ~8 tests green (shows bpm; stop dispatches `stopped`; cue per beat; animation duration within 200–300 ms; reduce motion = zero slide offset; reversing mid-animation has no jump; hidden is not tappable). — Result 2026-10-26: MetronomeIndicator (tempo, beat cue, stop; 250 ms slide+fade, fade-only with reduce motion, IgnorePointer/ExcludeSemantics when hidden); 7 widget tests green; single easeInOutCubic curve after a test caught a mid-reverse jump (design D11 amended first); analyze clean, 91 tests green.
- [x] 10.2 ⚠️ G-3 Overlay the indicator in `ScaffoldWithNavBar` (body becomes a `Stack`; visibility = running && !`isMetronomeRoute(current path)` from the router delegate). Files: `lib/presentation/dashboard/scaffold_with_nav_bar.dart`, `test/presentation/dashboard/scaffold_with_nav_bar_test.dart`. Requirements: I Indicator visibility, I Indicator does not move content, I Indicator hides when the metronome stops for any reason. Verify: widget tests with a test `GoRouter` green: shown on `/plan` while running; hidden on `/home` and `/session`; shown on `/home/playground`; hidden when stopped and on launch; a scrolled list keeps its offset when the indicator appears. — Result 2026-10-26: Indicator overlaid in ScaffoldWithNavBar (Stack; visibility from router delegate path + bloc); 6 GoRouter widget tests green (launch hidden, other tabs shown, /home & /session hidden, /home/playground shown, hides on stop, no content shift); analyze clean, 97 tests green.

## 11. Final verification

- [x] 11.1 Full check: `fvm flutter pub run build_runner build --delete-conflicting-outputs`, then `fvm flutter analyze` (0 errors, 0 warnings) and `fvm flutter test --coverage` (all green). Requirements: all. Verify: command output recorded in the result note. — Result 2026-10-26: build_runner + slang regenerated; analyze 0 issues; flutter test --coverage 97/97 green.
- [ ] 11.2 Manual check on one iOS and one Android device (`fvm flutter run -t lib/main_dev.dart`): debug-log dispatch error per beat for 10 minutes at 120 BPM and through tab switches at 300 BPM, and record max |error| (target ≤ 5 ms, D5) and any audio underruns. Walk the specs by hand: dashboard start → Session continues with no restart; pill appears on Plan/Progress and slides away on Home/Session; stop from the pill; lock screen → stopped on return at the same BPM; incoming call / another app's audio → stopped; airplane mode → plays; relaunch keeps BPM and opens stopped; reduce motion → fade only; Spanish locale strings and screen-reader labels. Requirements: all. Verify: findings recorded in the result note. If 256 frames is stable, try 128 and record it (design open question).

## Requirement coverage

| Requirement | Tasks |
|---|---|
| M Single shared metronome | 2.4, 3.3, 4.1, 6.2, 9.1, 11.2 |
| M Tempo range and steps | 2.1, 4.1, 8.1 |
| M Default tempo on first run | 2.1, 4.1, 11.2 |
| M Tempo is remembered offline | 4.1, 11.2 |
| M Start and stop | 3.1, 3.3, 4.1, 11.2 |
| M Beat timing without drift | 2.2, 3.1, 11.2 |
| M Tempo change while running | 2.2, 3.1, 4.1 |
| M Offline click sound | 2.3, 3.2, 11.2 |
| M Audio unavailable | 2.4, 3.2, 3.3, 4.1, 5.1, 8.1, 9.1 |
| M Stop when leaving the app | 4.1, 6.1, 6.2, 11.2 |
| M Stop on audio interruption | 3.2, 3.3, 4.1, 11.2 |
| M Dashboard metronome controls | 5.1, 8.1 |
| M Hold to repeat with acceleration | 7.2, 8.1 |
| M Beat dots | 7.3, 8.1 |
| M Practice screen metronome | 5.1, 7.3, 9.1 |
| M Accessible tempo controls | 5.1, 8.1, 9.1, 11.2 |
| I Indicator visibility | 7.1, 10.2, 11.2 |
| I Indicator does not move content | 10.2 |
| I Indicator content and stop | 5.1, 10.1, 11.2 |
| I Indicator beat cue | 10.1 |
| I Indicator transitions | 10.1, 11.2 |
| I Reduced motion | 10.1, 11.2 |
| I Indicator hides when the metronome stops for any reason | 10.1, 10.2 |

## Workflow follow-up

- Archive only when every task is checked and analyze + test are green.
- Update CLAUDE.md and AGENTS.md if this change added a layer, route or pattern they document (e.g. the metronome feature folder and the app-wide indicator).
