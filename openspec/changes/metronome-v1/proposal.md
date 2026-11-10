# Proposal

## Why

Musicians practicing with ensayo have no way to keep time inside the app: the dashboard's metronome card is a static mockup and the Session tab is empty, so they have to switch to a separate metronome app mid-practice. This change delivers a working, steady BPM metronome that can be started from the dashboard in one tap, continues seamlessly into the practice screen, and stays visible and stoppable from anywhere in the app while it plays.

## What Changes

- **One shared metronome** for the whole app: a single playback engine and a single piece of state (tempo, running/stopped). Every surface controls and reflects the same metronome; entering the practice screen never creates a second one.
- **Steady timing**: beats are scheduled against an absolute timeline (beat *n* at start + *n* × beat interval), so they never drift over time. Each click has a defined jitter budget (target: within ±5 ms of its scheduled time), set in the design.
- **Tempo**: 1–300 BPM inclusive, adjusted in 1 BPM steps. The last tempo is remembered between app launches; the running state is not (the app always opens stopped).
- **Offline click sound**: the click plays from a sound shipped with the app; nothing is downloaded.
- **Dashboard metronome card** (compact): replaces the current static card. Shows the tempo, `-` / play-stop / `+` controls (tap = 1 BPM, hold = repeat with acceleration), and four dots that cycle with the beat (no accent). No slider.
- **Practice-screen metronome** (full): on the Session tab, the same metronome with a wide tempo slider and a pulse animation in sync with the beat.
- **"Now playing" indicator**: a small pill above the bottom navigation bar showing the tempo and a stop control. It appears only while the metronome is running and the current screen is not a metronome screen (dashboard root or practice screen). It slides and fades in/out, and only fades when the system's reduce-motion setting is on.
- **Lifecycle**: the metronome stops when the app goes to the background (including screen lock) or when audio is interrupted (e.g. a phone call). Coming back shows it stopped at the same tempo.
- The existing `MetronomeBloc` skeleton (empty handlers, singleton registration, non-functional init) is replaced by the real implementation.
- All new user-facing text is added to the translation files in English and Spanish.

## Out of scope

- Playback with the screen locked or the app in the background (planned as a follow-up, v1.1: iOS background audio mode, Android foreground service).
- Time signatures, accented downbeats, subdivisions, tap tempo, custom click sounds, volume control.
- Linking the tempo used to practice logs, songs or progress statistics.
- Hiding the indicator when the dashboard card is merely scrolled off-screen (visibility is decided by the current route only).
- Changes to the playground screen and its prototype bloc; they stay as they are.
- Any web or desktop platform work.

## Capabilities

### New Capabilities
- `metronome`: the shared metronome's behavior — tempo range and adjustment, start/stop, timing guarantees (no drift, jitter budget), offline click sound, tempo persistence, stopping on background/interruption, and how the dashboard card and the practice screen present and control it.
- `metronome-indicator`: the app-wide "now playing" indicator — when it is shown or hidden based on running state and current route, its controls, and its enter/exit transitions including reduce-motion behavior.

### Modified Capabilities
- None (the project has no existing specs).

## Impact

**Database impact:** none. No Drift tables change; no migration. The remembered tempo uses the existing HydratedBloc storage, not the database.

**Layers touched:**
- **Domain** — metronome engine interface (start, stop, set tempo, beat stream) and tempo bounds/default constants (`lib/domain/constants.dart` already holds the 120 BPM default).
- **Infra** — SoLoud-backed engine implementation owning audio initialization, the bundled click and the beat scheduler; registered as the single engine instance via Injectable.
- **Application** — `lib/application/metronome/`: the `MetronomeBloc` rewritten (tempo, running state, persistence, lifecycle/interruption handling); beats are exposed as a stream, not as per-beat state.
- **Presentation** — dashboard `MetronomeCard` reworked; `SessionScreen` gains the full metronome; `ScaffoldWithNavBar` hosts the indicator; `app.dart` provides the metronome bloc app-wide alongside the existing theme and metrics providers.

**Existing features affected:** dashboard (Home tab) metronome card; Session tab; bottom navigation shell; app-level bloc providers; translations (`lib/i18n/en.i18n.json`, `es.i18n.json`, which already have a `metronome` section).

**Dependencies and assets:** `flutter_soloud` is already a dependency. `audio_session` is added for audio-interruption handling, and `mockito` as a dev dependency (see design.md, Gated actions). The click sound is synthesized in code at runtime (design.md D4), so no asset is added and `pubspec.yaml` gets no `assets:` section.

**Tests:** unit tests for the bloc (mocked engine) and the beat-schedule math (fake clock); widget tests for the card, the practice-screen metronome and the indicator's show/hide rules. No test touches real audio output.

## Open questions

1. **Indicator inside `ScaffoldWithNavBar`** — this modifies a shared widget, which the project requires approval for before implementation. **Resolved:** approved by the user, for the indicator work only; it does not extend to other shared-widget or theme changes.
2. **Click sound source** — a bundled audio file vs. a click synthesized in code at startup. Both are offline. **Non-blocking** (decide in design).
3. **Route of the full metronome** — the Session tab root (`/session`); if the practice view later moves to a sub-route, the indicator's metronome-route list must follow. **Non-blocking** (accepted).
4. **Hold-to-repeat acceleration curve** — initial delay, repeat rate and how it speeds up. **Non-blocking** (decide in design).
