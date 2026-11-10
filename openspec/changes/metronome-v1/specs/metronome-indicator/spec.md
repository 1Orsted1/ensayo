# Spec Delta

## Purpose

Keeps a running metronome visible and stoppable from any screen in ensayo that does not already show the metronome, without cluttering the screen when it is not playing.

## ADDED Requirements

### Requirement: Indicator visibility
While the metronome runs and the current screen is not a metronome screen, the app SHALL show the indicator just above the bottom navigation bar. The metronome screens SHALL be the dashboard (Home tab root) and the practice screen (Session tab root). In every other case the indicator SHALL be hidden.

#### Scenario: Running on another tab
- **WHEN** the metronome runs and the user switches to the Plan tab
- **THEN** the indicator appears above the navigation bar

#### Scenario: Back on a metronome screen
- **WHEN** the indicator is shown and the user switches to the Home tab root or the Session tab root
- **THEN** the indicator is hidden

#### Scenario: Screen inside the Home tab
- **WHEN** the metronome runs and the user opens a screen pushed inside the Home tab (not the dashboard itself)
- **THEN** the indicator is shown

#### Scenario: Stopped
- **WHEN** the metronome is stopped, on any screen
- **THEN** the indicator is not shown

#### Scenario: App opened
- **WHEN** the app is launched
- **THEN** the indicator is not shown, because the metronome always opens stopped

### Requirement: Indicator does not move content
The indicator SHALL appear over the screen without changing the layout or scroll position of the screen content beneath it.

#### Scenario: Indicator appears over a list
- **WHEN** the indicator appears while the user is viewing a scrolled list
- **THEN** the list keeps its scroll position and no content jumps

### Requirement: Indicator content and stop
The indicator SHALL show the current tempo in BPM and a stop control. When the user activates stop, the metronome SHALL stop and the indicator SHALL hide. The tempo and stop control add user-facing text, including screen-reader labels.

#### Scenario: Stop from the indicator
- **WHEN** the indicator is shown at 110 BPM and the user taps its stop control
- **THEN** the clicks stop, the indicator hides, and the metronome shows 110 BPM and stopped everywhere

#### Scenario: Tempo shown
- **WHEN** the metronome runs at 72 BPM on the Progress tab
- **THEN** the indicator reads 72 BPM

### Requirement: Indicator beat cue
While the indicator is shown, it SHALL show a small visual cue that fires once per click.

#### Scenario: Cue in time
- **WHEN** the indicator is shown and the metronome plays a click
- **THEN** the indicator's cue flashes once for that click

### Requirement: Indicator transitions
When the indicator becomes visible it SHALL slide up and fade in, and when it hides it SHALL slide down and fade out, each taking 200–300 ms. It SHALL never appear or disappear without a transition.

#### Scenario: Appearing
- **WHEN** the metronome is started and the user moves to a non-metronome screen
- **THEN** the indicator slides up and fades in over 200–300 ms

#### Scenario: Disappearing
- **WHEN** the user stops the metronome from the indicator
- **THEN** the indicator slides down and fades out over 200–300 ms

#### Scenario: Interrupted transition
- **WHEN** the indicator is mid-way through appearing and the user moves to a metronome screen
- **THEN** the indicator reverses smoothly from its current position and fades out, without jumping

### Requirement: Reduced motion
Where the device's reduce-motion or disable-animations setting is on, the indicator SHALL only fade in and out, without sliding.

#### Scenario: Reduce motion enabled
- **WHEN** reduce motion is on and the indicator appears
- **THEN** it fades in in place without sliding

### Requirement: Indicator hides when the metronome stops for any reason
When the metronome stops for any reason (user stop on any screen, app backgrounded, audio interruption, audio failure), the indicator SHALL hide with its normal transition.

#### Scenario: Stopped by an interruption
- **WHEN** the indicator is shown and a phone call stops the metronome
- **THEN** after returning to the app the indicator is not shown
