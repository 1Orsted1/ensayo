# Design

## Context

See `proposal.md` for motivation and scope, and `specs/metronome/spec.md` and `specs/metronome-indicator/spec.md` for the behavior. Current state relevant to the approach:

- `lib/application/metronome/` holds a skeleton `MetronomeBloc` (`@lazySingleton`, empty handlers, `init()` builds an event and discards it). `lib/domain/metronome/i_metronome_facade.dart` declares `start()` / `stop()`; `i_metronome_data_source.dart`, `lib/infra/metronome/metronome_facade_imp.dart` and `metronome_data_source_imp.dart` exist but are empty. Nothing outside these files references them.
- Features follow facade + data source layering: `IMetricsFacade` → `MetricsFacadeImp` → `IMetricsDataSource` → `MetricsDataSourceImp`.
- `flutter_soloud` 3.5.4 is a dependency. `SoLoud.init()` defaults to `bufferSize: 2048` (~46 ms at 44.1 kHz), which alone would break the ±5 ms budget. `loadMem()` accepts encoded audio bytes, so a click can be built in memory.
- `register_module.dart` registers `SoLoud` as an async lazy singleton (`Future<SoLoud>`), which cannot be constructor-injected into a synchronous class. Nothing consumes it today.
- `app.dart` provides `ThemeCubit` and `MetricsCubit` (both `@lazySingleton`) through `MultiBlocProvider`. `ThemeCubit` is the only hydrated state.
- The router uses `StatefulShellRoute.indexedStack`, so every tab's root stays mounted. Route, not widget presence, has to decide indicator visibility.
- `test/` contains a single test. `mockito` is not yet a dev dependency (pre-approved).

## Goals / Non-Goals

**Goals:**
- Keep all timing math in pure Dart classes with an injectable clock, so the no-drift and tempo-change rules are unit-tested without Flutter or audio.
- One engine instance owns the audio device for the app's lifetime; the bloc never sees individual beats.
- Meet the ±5 ms budget at the point the click is dispatched to the audio engine, and keep the audio buffer small enough that output quantization does not dominate.

**Non-Goals:**
- Running the scheduler off the UI isolate or in native code (that is option B/C, left for later).
- Compensating for constant output latency (the visual pulse may lead the sound by the device's fixed output latency).
- Background audio configuration (iOS background mode, Android foreground service) — v1.1.

## Template sibling

| New piece | Modeled on | Why |
|---|---|---|
| `IMetronomeFacade` / `MetronomeFacadeImp` | `IMetricsFacade` / `MetricsFacadeImp` | Same facade-over-data-source layering the project uses for features. |
| `IMetronomeDataSource` / `MetronomeDataSourceImp` | `PlaygroundDataSourceImp` | Thin wrapper over a single audio call, registered with `@...(as: Interface)`. |
| `MetronomeBloc` (+ freezed events/state) | `PlaygroundBloc` | Freezed event union, `on<…>` handlers, a broadcast beat stream exposed beside the state (`onPulse`). |
| Tempo persistence in the bloc | `ThemeCubit.fromJson` / `toJson` | Same hydrated pattern, including `try/catch` returning `null` on bad data. |
| `BeatTimeline` + `BeatScheduler` | `PlaygroundBloc._onRealDeal` / `_tickTock` | Same absolute-schedule idea (beat n at stopwatch time n × interval), rewritten as testable classes with one-shot timers instead of 15 ms polling. |
| Practice-screen pulse | `_SonarPulse` in `playground.dart` | Same ripple-per-event widget, re-created in `lib/presentation/metronome/` (playground stays untouched). |

## Reuse

| Existing | Path | Used for |
|---|---|---|
| `SoLoud` | `flutter_soloud` package | Audio init, `loadMem`, `play`. |
| `HydratedBloc` storage | set up in `main_dev.dart` / `main_prod.dart` | Persisting the tempo. |
| `MultiBlocProvider` in `App` | `lib/app.dart` | Providing the metronome bloc app-wide. |
| `ScaffoldWithNavBar` | `lib/presentation/dashboard/scaffold_with_nav_bar.dart` | Hosting the indicator. |
| `MetronomeCard` | `lib/presentation/dashboard/widgets/metronome_card.dart` | Reworked in place (already placed in `home_screen.dart`). |
| `SessionScreen` | `lib/presentation/dashboard/session_screen.dart` | Hosts the full metronome. |
| `context.colorScheme` / theme extensions | `lib/presentation/theme/extensions/app_theme_extensions.dart` | Colors for card, dots, pulse and pill (no theme changes). |
| `metronome` translation section | `lib/i18n/en.i18n.json`, `es.i18n.json` | Extended with new keys. |

## New pieces

**Domain (`lib/domain/metronome/`)**
- `tempo.dart` — `minBpm = 1`, `maxBpm = 300`, `defaultBpm = 120`, `clampBpm(int)`, `isValidBpm(int)`. Pure. (`lib/domain/constants.dart` is left as is; the bloc stops using `twoBeatsPerSecondValue`.)
- `beat_timeline.dart` — pure class: anchor time + interval; `timeOfBeat(n)`, `nextBeatAfter(now)`, `retempo(lastBeatTime, newBpm)`. All values in microseconds.
- `click_sound.dart` — pure function returning WAV bytes for a short click (see D4).
- `i_metronome_facade.dart` — replaced: `Future<void> start(int bpm)`, `void setBpm(int bpm)`, `void stop()`, `Stream<int> get beats`, `Stream<void> get interruptions`.
- `i_metronome_data_source.dart` — `Future<void> init()`, `void playClick()`, `Future<void> release()`, `Stream<void> get interruptions`, `Future<void> dispose()`.
- `metronome_failure.dart` — freezed failure (`audioUnavailable`).

**Infra (`lib/infra/metronome/`)**
- `beat_scheduler.dart` — drives a `BeatTimeline` with an injected `Clock` (`Duration elapsed()`) and `TimerFactory` (`Timer Function(Duration, void Function())`); emits beat indices. Pure Dart, no Flutter.
- `metronome_facade_imp.dart` — `@LazySingleton(as: IMetronomeFacade)`; owns the scheduler and calls the data source on each beat.
- `metronome_data_source_imp.dart` — `@LazySingleton(as: IMetronomeDataSource)`; wraps `SoLoud` and the audio-session interruption streams.

**Application (`lib/application/metronome/`)**
- `MetronomeBloc` — **Bloc** (the project default; no Cubit in this change). `HydratedBloc<MetronomeEvent, MetronomeState>`, `@lazySingleton`.
  - Events: `started`, `stopped`, `tempoSet(bpm)`, `tempoStepped(delta)`, `appBackgrounded`, `audioInterrupted`, `failureShown`.
  - State: `bpm`, `isRunning`, `MetronomeFailure? failure`.
  - `Stream<int> get beats` forwards `facade.beats` (never stored in state).

**Presentation**
- `lib/presentation/metronome/metronome_routes.dart` — pure `isMetronomeRoute(String path)` over `{'/home', '/session'}` (exact match).
- `lib/presentation/metronome/hold_repeat.dart` — pure `repeatDelay(int repeatIndex)` (see D7) plus a small gesture wrapper for `-`/`+`.
- `lib/presentation/metronome/beat_dots.dart`, `metronome_pulse.dart`, `metronome_indicator.dart`, `metronome_full_view.dart`.
- `lib/presentation/metronome/metronome_lifecycle_listener.dart` — widget with an `AppLifecycleListener` that adds `appBackgrounded` on `hidden`/`paused`.
- `MetronomeCard` reworked; `SessionScreen` shows `MetronomeFullView`; `ScaffoldWithNavBar` overlays `MetronomeIndicator`.

```
 presentation   MetronomeCard   MetronomeFullView   MetronomeIndicator   LifecycleListener
                     \                 |                   /                  /
                      +---- state (bpm, isRunning, failure) / beats stream --+
                                       |
 application                     MetronomeBloc (HydratedBloc, bpm only persisted)
                                       |
 domain                          IMetronomeFacade        BeatTimeline, tempo, click_sound (pure)
                                       |
 infra                     MetronomeFacadeImp --- BeatScheduler(Clock, TimerFactory)
                                       |
                           MetronomeDataSourceImp --- SoLoud, audio_session
```

## Decisions

**D1. Scheduling: one-shot timer per beat against an absolute timeline.**
The scheduler keeps a monotonic `Stopwatch`. After each beat it computes the next beat's absolute time from the timeline and arms a single `Timer` for `target - now`. When it fires it plays the click, emits the beat index, then re-arms from the timeline, never from "now + interval", so lateness never accumulates.
*Alternatives:* `Timer.periodic(interval)` — accumulates drift (rejected, prototype v2). Polling every 15 ms as in the prototype — up to 15 ms quantization and constant wakeups (rejected). Native or buffer-rendered clicks — more precise but more complex; out of scope per the explore decision.

**D2. Late timers: play once, never burst.**
If a timer fires late but before the following beat's time, the beat plays immediately. If the delay passed one or more whole beats, the missed beats are skipped (not played as a burst) and the scheduler re-arms for the next beat on the original timeline. The spec's "no skipped or doubled beats" scenario covers brief delays (shorter than one interval), which this satisfies; a multi-beat stall resynchronizing silently is the musically correct outcome.
*Alternative:* play all missed beats at once — audible machine-gun effect (rejected).

**D3. Tempo change re-anchors at the last played beat.**
`retempo(lastBeatTime, newBpm)` makes the new anchor the last beat with the new interval, so the next beat is at `lastBeatTime + newInterval`, as the spec requires. If that time is already past (e.g. 1 → 300 BPM long after the last click), the beat plays now and the timeline anchors there. The beat index keeps counting so the dots don't reset.
*Alternative:* restart the timeline at "now" — produces an immediate extra click (rejected by spec).

**D4. Click sound: synthesized in code, loaded with `loadMem`** (resolves proposal open question 2).
`click_sound.dart` builds a 16-bit mono 44.1 kHz WAV: about 15 ms of a 1.5 kHz sine with a fast exponential decay and a 1 ms attack to avoid a pop. It's loaded once with `SoLoud.loadMem(..., mode: LoadMode.memory)` at first start.
*Why over a bundled file:* no asset licensing, no `pubspec.yaml` `assets:` section, and the bytes are a pure function that can be unit-tested (header, length, peak level). This supersedes the proposal's line about adding an asset to `pubspec.yaml`.
*Alternative:* bundled `.wav` asset — better sound-design control later; easy to switch to because the data source only needs bytes.

**D5. Audio buffer: 256 frames at 44.1 kHz (~5.8 ms), measured on device.**
SoLoud is initialized lazily on the first start with `bufferSize: 256` (default 2048 ≈ 46 ms). Each click can land up to one buffer late, so the buffer size is part of the jitter budget. The ±5 ms budget is defined as dispatch timing: |time `playClick()` is called − scheduled time| ≤ 5 ms. This is what the fake-clock tests and the on-device measurement task check. A device spike task measures underruns; if 256 is stable on the test devices, try 128 (~2.9 ms). For that check, `BeatScheduler` reports each beat's dispatch error to an optional callback; in debug builds only, the facade feeds it to a pure `DispatchErrorRecorder` (beats, max |error|, mean |error|, beats over 5 ms) and prints one summary line on stop. Nothing is logged per beat, so the measurement doesn't add jank, and release builds don't record at all.
*Alternative:* default buffer — would make jitter ~46 ms (rejected).

**D6. One engine, one bloc, both `@lazySingleton`.**
The facade and data source are `@LazySingleton(as: …)` because they own the audio device and scheduler. Metrics uses `@Injectable` factories; that would give each consumer its own engine and break the single-metronome rule. The bloc is `@lazySingleton`, matching `ThemeCubit` / `MetricsCubit`, and is provided once at the root in `app.dart`. Any `getIt<MetronomeBloc>()` therefore returns the same instance, and no screen provides its own.
*Alternative:* `@injectable` bloc — a second `getIt` call would create a divergent bloc over the shared engine (rejected).

**D7. Hold-to-repeat curve** (resolves proposal open question 4).
First repeat after 400 ms, then repeat delays of 150 ms, decreasing by 15 ms per repeat down to a 40 ms floor. 120 → 300 takes about 8 s and the first few repeats stay controllable. Each repeat dispatches `tempoStepped(±1)`. It stops on release, cancel, or when the bloc reports a bound. `repeatDelay(n)` is a pure function.

**D8. Lifecycle and interruptions.**
`MetronomeLifecycleListener` (placed under the providers in `app.dart`) adds `appBackgrounded` on `AppLifecycleState.hidden` or `paused`, not on `inactive`, so pulling down the notification shade or Control Center doesn't stop the beat. Audio interruptions come from the `audio_session` package (G-1): the session is configured as `playback` (so the iOS silent switch does not mute the metronome), activated on start (requesting Android audio focus) and deactivated on every stop (`release()`), so music the metronome paused can resume. Its `interruptionEventStream` `begin` events are forwarded as `audioInterrupted`, except `duck` events (e.g. a notification sound), which share the output rather than take it over. Neither event resumes playback.
*Alternative without G-1:* lifecycle only. A full-screen incoming call still backgrounds the app, but Android audio-focus loss (another app playing, heads-up call) would not stop it and the spec's interruption requirement would be only partly met. The iOS silent switch would also mute clicks.

**D9. Persistence: bpm only.**
`toJson` writes `{'bpm': state.bpm}`. `fromJson` returns `null` (→ default 120) when the value is missing, not an int, or outside 1–300, matching `ThemeCubit`'s `try/catch` style. `isRunning` and `failure` are never written, so the app always opens stopped.

**D10. Start failure surfaces locally, not in the shell.**
If `facade.start` throws, the bloc emits `isRunning: false, failure: audioUnavailable`. The card and the full view each wrap themselves in a `BlocListener` that shows a SnackBar and dispatches `failureShown`. Start can only be triggered from those two surfaces, so the shell (whose approval covers only the indicator) needs no listener. A later start retries `init()`.

**D11. Indicator visibility and motion.**
`ScaffoldWithNavBar`'s body becomes a `Stack` of the `navigationShell` and a bottom-aligned `MetronomeIndicator`. It floats over the content, so nothing reflows. Visibility = `state.isRunning && !isMetronomeRoute(currentPath)`, with the path read from `GoRouter.of(context).routerDelegate` as a listenable (the tab index alone can't tell `/home` from `/home/playground`). Motion uses implicit `AnimatedSlide` (offset 0 → 0.5 of its height) + `AnimatedOpacity` with 250 ms and a single `easeInOutCubic` curve for both directions (switching curves mid-animation makes implicit animations recompute their start value on the new curve, which visibly jumps). Implicit animations reverse from their current value, which gives the spec's mid-transition behavior. If `MediaQuery.disableAnimationsOf(context)` is true, the slide offset is fixed at 0 (fade only). When hidden it's wrapped in `IgnorePointer` and excluded from semantics.
*Alternative:* `AnimatedSwitcher` — mounts/unmounts the child, which makes reversing mid-way and beat-cue subscription messier (rejected).

**D12. Beat-driven visuals subscribe to the stream directly.**
Dots, pulse and the indicator cue listen to `bloc.beats` with `StreamBuilder`/listeners. Dot index = `beat % 4`, cleared when `!isRunning`. Only those small widgets rebuild per beat.

## Database impact

None. No tables or columns change; `schemaVersion` stays as is; no migration. The tempo is stored in HydratedBloc storage.

## Risks / Trade-offs

- [UI-thread jank delays timers beyond 5 ms] → One-shot timers re-armed from the absolute timeline keep drift at zero even when individual beats are late. The on-device measurement task (debug-only logging of dispatch error) checks real jitter during heavy transitions. If it fails, that's the trigger to revisit option B/C.
- [256-frame buffer underruns on low-end Android (crackle)] → Measure on the test devices. Fall back to 512 (~11.6 ms) and record the effective jitter honestly, rather than hiding crackle.
- [Visual pulse leads the audio by fixed output latency (tens of ms on some Android devices)] → Accepted for v1. A constant offset could be added later without changing the timeline.
- [`audio_session` not approved (G-1)] → Implement lifecycle-only stopping (D8 alternative) and flag the interruption requirement as partially met before archiving.
- [Singleton bloc closed by `BlocProvider(create:)` on app teardown] → Same as the existing cubits. It only happens when the whole app is torn down (and in widget tests, which build their own instances).
- [Indicator covers the bottom of scrolling content] → Accepted (spec: the indicator doesn't reflow content). Screens can add bottom padding later if needed.
- [Synthesized click sounds thin] → The data source only takes bytes, so a bundled asset can replace it without other changes.

## Migration Plan

No data migration. Ship behind no flag: the static card is replaced in place. Rollback is reverting the change; persisted HydratedBloc key `MetronomeBloc` is ignored by older builds.

## Test plan

All tests avoid real audio, platform channels and the file system: the data source and storage are mocked with `@GenerateNiceMocks`.

| Target | File | Approx. tests |
|---|---|---|
| Tempo bounds/clamp | `test/domain/metronome/tempo_test.dart` | 4 |
| Timeline math (beat n times at 1/120/300 BPM, 1 200-beat no-drift, retempo, past-due next) | `test/domain/metronome/beat_timeline_test.dart` | 10 |
| Click WAV (RIFF header, sample count, peak ≤ 0 dBFS, no DC at start) | `test/domain/metronome/click_sound_test.dart` | 3 |
| Scheduler with fake `Clock` + fake `TimerFactory` (beat 0 immediate, exactly-once, ±5 ms dispatch, late-fire D2, stop cancels, retempo D3) | `test/infra/metronome/beat_scheduler_test.dart` | 8 |
| Facade (init once, retry after failure, playClick per beat, interruptions forwarded) | `test/infra/metronome/metronome_facade_imp_test.dart` | 6 |
| Bloc (default/first run, clamp at bounds, step, start ok/fail, stop, background stop, interruption stop, failureShown, toJson bpm only, fromJson invalid → null) | `test/application/metronome/metronome_bloc_test.dart` | 14 |
| Hold-repeat curve | `test/presentation/metronome/hold_repeat_test.dart` | 3 |
| Route rule | `test/presentation/metronome/metronome_routes_test.dart` | 5 |
| Card widget (controls, no slider, bounds disabled, tap ±1, hold repeat, dots cycle/cleared, failure SnackBar) | `test/presentation/dashboard/widgets/metronome_card_test.dart` | 8 |
| Full view (slider → bpm, pulse per beat, none when stopped) | `test/presentation/metronome/metronome_full_view_test.dart` | 5 |
| Indicator (shown/hidden per route & state, stop tap, reduce motion = no slide, reverse mid-transition, semantics labels) | `test/presentation/metronome/metronome_indicator_test.dart` | 8 |

Manual on-device check (not automated, because it needs real audio): log dispatch error per beat for 10 minutes at 120 BPM and through tab switches at 300 BPM on one iOS and one Android device, and record max |error| and any underruns.

## Gated actions

| ID | Action | What can break | Approved |
|---|---|---|---|
| G-1 | Add `audio_session` to `pubspec.yaml` dependencies | New native plugin: iOS/Android build, audio-session behavior of the playground's SoLoud usage. | ☑ |
| G-2 | Change `lib/infra/core/register_module.dart`: register `SoLoud` as a synchronous `@lazySingleton` (`SoLoud.instance`) instead of `Future<SoLoud>` | Shared DI module; anything resolving the async registration (nothing today) would stop compiling. | ☑ |
| G-3 | Edit `lib/presentation/dashboard/scaffold_with_nav_bar.dart` to overlay the indicator (body becomes a `Stack`) | Shared shell for all tabs: layout, nav bar, back behavior. | ☑ (approved in proposal, indicator work only) |
| G-4 | Edit `lib/app.dart`: add the `MetronomeBloc` provider and `MetronomeLifecycleListener` | App root: provider order, startup. | ☑ |
| G-5 | Add `mockito` to `dev_dependencies` | Test build only. Pre-approved by project rules; listed for visibility. | ☑ (pre-approved) |

No platform files (Info.plist, AndroidManifest, Gradle, Podfile) change in v1, and no files are deleted or moved.

## Open Questions

- Whether 128 frames is stable enough to replace 256 (D5), answered by the device measurement. It doesn't change the specs or the tasks.
