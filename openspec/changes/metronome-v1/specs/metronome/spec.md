# Spec Delta

## Purpose

Gives musicians a single, steady BPM metronome inside ensayo that they can start from the dashboard and keep using on the practice screen, so they never need a separate metronome app while practicing.

## ADDED Requirements

### Requirement: Single shared metronome
The app SHALL have exactly one metronome. Every place that shows or controls the metronome SHALL show the same tempo and running state, and a change made in one place SHALL be reflected in all others without restarting the beat.

#### Scenario: Started on the dashboard, continued on the practice screen
- **WHEN** the user starts the metronome at 96 BPM on the dashboard and then opens the practice screen
- **THEN** the practice screen shows 96 BPM and running, and the beat continues without a pause, restart or second overlapping click

#### Scenario: Tempo changed on the practice screen
- **WHEN** the user changes the tempo to 100 BPM on the practice screen and returns to the dashboard
- **THEN** the dashboard shows 100 BPM

### Requirement: Tempo range and steps
The metronome tempo SHALL be a whole number of beats per minute from 1 to 300 inclusive, adjusted in steps of 1 BPM. If a change would move the tempo outside that range, then the tempo SHALL stay at the nearest bound.

#### Scenario: Increase at the upper bound
- **WHEN** the tempo is 300 BPM and the user taps increase
- **THEN** the tempo stays 300 BPM and the increase control appears disabled

#### Scenario: Decrease at the lower bound
- **WHEN** the tempo is 1 BPM and the user taps decrease
- **THEN** the tempo stays 1 BPM and the decrease control appears disabled

#### Scenario: Single step
- **WHEN** the tempo is 120 BPM and the user taps increase once
- **THEN** the tempo shows 121 BPM

### Requirement: Default tempo on first run
When the app runs for the first time, or no stored tempo can be read, the metronome SHALL show 120 BPM and be stopped.

#### Scenario: First launch
- **WHEN** the user opens the app for the first time
- **THEN** the metronome shows 120 BPM and is stopped

#### Scenario: Stored tempo unreadable
- **WHEN** the stored tempo is missing, corrupt or outside 1–300
- **THEN** the metronome shows 120 BPM and is stopped

### Requirement: Tempo is remembered offline
When the user changes the tempo, the app SHALL store it on the device so the next launch shows it. The running state SHALL NOT be stored: the app SHALL always open with the metronome stopped. Storing and restoring SHALL work with no network.

#### Scenario: Relaunch keeps tempo
- **WHEN** the user sets 84 BPM, closes the app and opens it again
- **THEN** the metronome shows 84 BPM and is stopped

#### Scenario: Offline
- **WHEN** the device has no network connection and the user changes the tempo and relaunches
- **THEN** the changed tempo is shown after relaunch

### Requirement: Start and stop
When the user starts the metronome, the first click SHALL play within 50 ms and the running state SHALL be shown. When the user stops it, no further click SHALL play after the stop and the stopped state SHALL be shown.

#### Scenario: Start
- **WHEN** the metronome is stopped and the user presses play
- **THEN** a click is heard within 50 ms and the control changes to stop

#### Scenario: Stop
- **WHEN** the metronome is running and the user presses stop
- **THEN** no click is heard after the press and the control changes to play

#### Scenario: Restart beat count
- **WHEN** the user stops and starts the metronome again
- **THEN** the beat indicator starts again from the first beat

### Requirement: Beat timing without drift
While the metronome runs at a constant tempo, beat n (counting from 0) SHALL be scheduled at start time + n × (60 000 / BPM) ms, and each click SHALL play within ±5 ms of its scheduled time, so the error never accumulates over time.

#### Scenario: Long run at 120 BPM
- **WHEN** the metronome runs at 120 BPM for 10 minutes
- **THEN** the 1 200th beat plays within ±5 ms of 600 000 ms after start

#### Scenario: Extreme tempos
- **WHEN** the metronome runs at 1 BPM and at 300 BPM
- **THEN** beats are 60 000 ms and 200 ms apart respectively, each within ±5 ms of its scheduled time

#### Scenario: No skipped or doubled beats
- **WHEN** the app briefly delays (for example during a heavy screen transition) while running
- **THEN** every scheduled beat plays exactly once, none is skipped or played twice, and later beats return to the original timeline

### Requirement: Tempo change while running
When the tempo changes while the metronome runs, the next click SHALL play one new beat interval after the last click played, and the following beats SHALL use the new tempo with the same ±5 ms limit. The change SHALL NOT produce an extra click or a gap longer than the larger of the old and new intervals.

#### Scenario: Speed up while running
- **WHEN** the metronome is running at 60 BPM and the user changes it to 120 BPM
- **THEN** the next click plays 500 ms after the last click, and beats continue every 500 ms

#### Scenario: Holding a tempo control while running
- **WHEN** the user holds increase while the metronome runs
- **THEN** the beat keeps playing without extra clicks, following each new tempo as it changes

### Requirement: Offline click sound
The metronome click SHALL play from sound data stored on the device. Starting the metronome SHALL NOT require a network connection.

#### Scenario: Airplane mode
- **WHEN** the device is in airplane mode and the user starts the metronome
- **THEN** clicks play normally

### Requirement: Audio unavailable
If audio playback cannot be started, then the metronome SHALL stay stopped and the user SHALL see a short message saying the metronome could not start. This adds user-facing text.

#### Scenario: Audio fails to start
- **WHEN** the user presses play and the device audio cannot be initialized
- **THEN** the metronome shows stopped and a message says it could not start

#### Scenario: Retry after failure
- **WHEN** audio failed earlier and the user presses play again after audio becomes available
- **THEN** the metronome starts normally

### Requirement: Stop when leaving the app
When the app goes to the background or the screen locks while the metronome runs, the metronome SHALL stop, keep its tempo, and show stopped when the user returns. It SHALL NOT resume on its own.

#### Scenario: Screen locked
- **WHEN** the metronome runs at 90 BPM and the user locks the phone, then unlocks and returns to the app
- **THEN** no clicks played while locked, and the metronome shows 90 BPM and stopped

#### Scenario: Switched to another app
- **WHEN** the metronome runs and the user switches to another app
- **THEN** the clicks stop and the metronome shows stopped on return

### Requirement: Stop on audio interruption
If another audio source takes over the audio output while the metronome runs (for example an incoming call or another app starting playback), then the metronome SHALL stop and keep its tempo. It SHALL NOT resume when the interruption ends.

#### Scenario: Incoming call
- **WHEN** the metronome runs and a phone call comes in
- **THEN** the clicks stop, and after the call the metronome shows stopped at the same tempo

### Requirement: Dashboard metronome controls
The dashboard SHALL show a compact metronome with the current tempo, a decrease control, a play/stop control and an increase control, and no slider. A tap on decrease or increase SHALL change the tempo by 1 BPM. Its labels add user-facing text.

#### Scenario: Compact view
- **WHEN** the user opens the dashboard
- **THEN** the metronome shows the tempo in BPM with decrease, play and increase controls, and no slider

#### Scenario: Tap adjust
- **WHEN** the user taps decrease once at 120 BPM
- **THEN** the tempo shows 119 BPM

### Requirement: Hold to repeat with acceleration
While the user holds decrease or increase, the tempo SHALL keep changing by 1 BPM per repeat, and the repeat rate SHALL increase the longer the control is held. The repeating SHALL stop when the control is released or a tempo bound is reached.

#### Scenario: Long hold
- **WHEN** the user holds increase from 100 BPM for several seconds
- **THEN** the tempo rises by 1 BPM at a time, faster the longer it is held, and stops changing when released

#### Scenario: Hold reaches bound
- **WHEN** the user holds decrease from 5 BPM
- **THEN** the tempo stops at 1 BPM even though the control is still held

### Requirement: Beat dots
The dashboard metronome SHALL show four dots. While running, each click SHALL highlight the next dot in order (1, 2, 3, 4, then 1 again), with no dot styled as an accent. While stopped, no dot SHALL be highlighted.

#### Scenario: Cycling
- **WHEN** the metronome plays five clicks after starting
- **THEN** the highlighted dot goes 1, 2, 3, 4, 1

#### Scenario: Stopped
- **WHEN** the metronome is stopped
- **THEN** no dot is highlighted

### Requirement: Practice screen metronome
The practice screen SHALL show the full metronome: the current tempo, decrease, play/stop and increase controls, a slider covering 1–300 BPM, and a pulse animation that fires once per click. Its labels add user-facing text.

#### Scenario: Slider adjust
- **WHEN** the user drags the slider to 140
- **THEN** the tempo shows 140 BPM everywhere the metronome appears

#### Scenario: Pulse in time
- **WHEN** the metronome is running on the practice screen
- **THEN** one pulse animation starts for each click

#### Scenario: Stopped
- **WHEN** the metronome is stopped on the practice screen
- **THEN** no pulse animation plays

### Requirement: Accessible tempo controls
Each metronome control SHALL have a screen-reader label in English and Spanish, and the tempo SHALL be announced with its BPM value. This adds user-facing text.

#### Scenario: Screen reader
- **WHEN** a screen-reader user focuses the play control and then the tempo
- **THEN** they hear the control's action (play or stop) and the tempo with "BPM" in the app's language
