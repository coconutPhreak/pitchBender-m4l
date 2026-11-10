# Testing PitchBender

This file covers building the device, loading it in Live and on Push, and the checks for each build stage. Each stage has a GitHub issue that is closed once all of its tests pass on Push 3 Standalone.

## Build and load

1. Build the device from the patcher source:

   ```bash
   python3 scripts/build_amxd.py
   ```

   This writes `build/PitchBender.amxd`. The build refuses to run if a patch cord points at a missing box or inlet, if a Push bank names an unknown parameter, or if an object class hasn't passed the Push standalone probes.
2. In Live, make a MIDI track and load an **MPE** bass instrument on it (Meld, Drift, Wavetable, or an MPE plug-in in MPE mode). Since v4.1 the device's output is per-note MPE, so non-MPE instruments (e.g. Operator) won't follow the pitch envelope.
3. Drag `build/PitchBender.amxd` onto the track, *before* the instrument. Put it directly on the track, not inside a rack, because the clip-stop check watches the track's clip slots.
4. The device should show Note (C1), Velocity (100), Length (1 step), Attack (20 %), Peak (0 st), A Curve (0), Decay (30 %), End (0 st), D Curve (0), Envelope (On), Bend Rng (48 st) and Scale (On). Under Peak and End, small labels show their target note.
5. Bend Range is the MPE per-note bend range **each way** (default 48, the MPE standard). It must match the instrument's per-note (MPE) bend range, or every pitch lands off.

After every rebuild, drag the new `PitchBender.amxd` in again to replace the old one.

### If you edit the patch in Live's device editor

Save from the device editor without freezing, then copy the changes back into the source so they end up in git:

```bash
python3 scripts/build_amxd.py --extract build/PitchBender.amxd
```

### Console output for bug reports

In the device editor (patching view), turn on the **Debug** toggle (right side, next to `print pitchbender`). The Max console then prints:

- `pitchbender: note P V` for each note-on the device sends
- `pitchbender: note P 0` for each note-off
- `pitchbender: bend N` for each pitch-bend value sent (since v4): 8192 is centre, 16383 is +Bend Range, 1 is −Bend Range. Each note sends its starting bend on its own channel; after that only changes are sent, so a held pitch prints nothing.
- `pitchbender: timer_ticks N` (transport playing) or `pitchbender: timer_ms N` (stopped): the Trigger Length timer for that note
- `pitchbender: end timer` when the timer ends a note, and `pitchbender: end kill` at each new trigger, transport stop, clip stop or device off. A note-off right after `end kill` means the note was cut, not timed out.

Always printed (no Debug needed, since v5): `pitchbender: scale_intervals …` and `pitchbender: scale_mode N` as Live reports them, and `pitchbender: scale_notes_root_mask N R M` after each scale change (N = scale notes found in MIDI 0–127, R = root, M = scale mask).

Paste the console output back, along with any red error lines that appear when the device loads.

## Load check (do this first)

- **L1:** Load the device. The Max console prints `pitchbender: loaded v5` with no red errors, and the controls show the defaults above. If `loaded` doesn't appear, the patch didn't start: paste the console output back.

## Stage 1: note trigger and stuck-note safety ([#1](https://github.com/coconutPhreak/pitchBender-m4l/issues/1))

v1.3 tested in Live (with Meld, directly on the track) and on Push 3 Standalone on 2026-11-10 (L1, S1.1–S1.12, P1, P1a): all pass.

Use a clip with placeholder notes at different pitches, lengths and velocities. Turn on Debug.

- **S1.1 Trigger:** each placeholder note-on plays C1 at velocity 100, whatever the placeholder's pitch and velocity. The console shows `note 36 100`, then `note 36 0` one step later.
- **S1.2 Length ignores the placeholder:** a placeholder 1 bar long, with Length at 1 step, still sounds for only 1 step.
- **S1.3 Mono:** set Length to 32 steps and put placeholders every 4 steps. Each new trigger ends the old note first: the console shows `note 36 0` right before every `note 36 100`, and the instrument never holds two notes.
- **S1.4 Note change while sounding:** with Length at 32 steps, change Note while a note sounds. The note-off is for the old pitch (the console shows the old number with 0), and nothing hangs.
- **S1.5 Transport stop:** with Length at 32 steps, stop the transport mid-note. The note ends right away.
- **S1.6 Clip stop:** in Session View, with Length at 32 steps, stop the clip (clip stop button) while the transport keeps running. The note ends right away.
- **S1.7 Device off:** with Length at 32 steps, turn the device off mid-note. Note whether the note ends or hangs.
- **S1.8 Delete and close:** with Length at 32 steps, delete the device mid-note, and separately close the Set mid-note. Note whether anything hangs. If it does, a later fix needs a new object class, which must pass a probe first.
- **S1.9 Transport stopped:** with the transport stopped, play a placeholder note from a keyboard or Push pad. The note lasts Length at the current tempo, then ends.
- **S1.10 Tempo:** change the tempo (e.g. 60 vs 180 BPM). The note length follows, staying 1 step.
- **S1.11 Pass-through:** a CC (mod wheel) and aftertouch reach the instrument unchanged. Pitch bend also passes through raw for now; merging it is Stage 6.
- **S1.12 Velocity:** set Velocity to 20, then 127. The console and the instrument follow it.

## Stage 2: p-lock latch ([#2](https://github.com/coconutPhreak/pitchBender-m4l/issues/2))

The device reads its parameters once per trigger. A step's p-lock has to land *before* that read, or the step plays the previous step's value.

v2 tested in Live and on Push 3 Standalone on 2026-11-10 (S2.1–S2.6): all pass with every Latch Delay setting, **including Off**. The step's p-lock always reaches the device before its note, as retrig-m4l also found. So v2.1 removed the deferral and the temporary Latch Delay parameter: the device reads its parameters immediately, adding no latency. If locks ever land late (for example under heavy CPU in Stage 8), a deferral can come back.

Re-run these after changes to the trigger path. Setup: a 1-bar clip with a placeholder note on every step (16 notes, each 1 step long). Length 1 step. Turn on Debug.

- **S2.1 Live clip envelope:** in the clip's envelope editor, choose PitchBender → Note and draw a step automation value of 43 (G1) on step 5 only, leaving the rest at 36. The console shows `note 43 100` on step 5 itself, not on step 6.
- **S2.2 Push p-lock:** on Push standalone, hold step 5 and turn the Note encoder to G1. Step 5 plays G1, and step 4 doesn't.
- **S2.3 Neighbouring locks:** p-lock steps 5 and 6 to different notes (G1, A♯1). Each step plays its own value, with no smearing between them.
- **S2.4 Other parameters:** p-lock Velocity (bank Perform) and Length on step 9. Step 9 takes both values on its own trigger.
- **S2.5 Timing:** the notes sit on the grid by ear.
- **S2.6 Fast steps:** at 1/32 placeholders and a high tempo (e.g. 170 BPM), every step still plays and the locks still land.

## Stage 3: p-lock scope on Push ([#3](https://github.com/coconutPhreak/pitchBender-m4l/issues/3))

Tested with v2.1 on Push 3 Standalone on 2026-11-10 (S3.1, S3.3–S3.6; S3.2 couldn't be checked): a step p-lock applies to its own step only. Turning a locked parameter by hand overrides all its locks until automation is re-enabled (Live's standard behaviour). Details in [docs/plock-scope.md](docs/plock-scope.md).

This tests Push's behaviour, not the device's. The device plays whatever value the automation holds when each step triggers, so the question is: does a Push step p-lock cover **only its own step**, or does it **hold until the next breakpoint**? Write the answers in [docs/plock-scope.md](docs/plock-scope.md).

Setup (Push 3 Standalone): a fresh 1-bar clip with a placeholder note on every step (16 notes, each 1 step long), no automation yet. Note at C1, Length 1 step, Velocity 100. Use Debug in Live via Control Mode if you can; otherwise listen.

- **S3.1 Single lock:** hold step 5 and turn Note to G1. Play two loops. What do steps 1–4 and 6–16 play: C1, or G1?
- **S3.2 Envelope shape:** open the clip in Live (Control Mode, or copy the Set to the computer) and look at the Note envelope. Is it a step covering only step 5, or a breakpoint that stays at G1?
- **S3.3 Two locks:** also lock step 9 to A♯1. What do steps 6–8 and 10–16 play?
- **S3.4 Knob after locking:** with no step held, turn the Note encoder while the clip plays. Do the unlocked steps follow it, and do the locked steps keep their values? Does Live show the parameter as overridden (an automation re-enable button lit)?
- **S3.5 Other parameters:** lock Velocity and Length on step 13. Same questions as S3.1 for those two.
- **S3.6 Clearing a lock:** remove step 5's lock (hold step 5 and delete its automation). Does step 5 go back to the unlocked value?

Stage 3 is done once each question has an answer in docs/plock-scope.md. If locks hold until the next breakpoint, a later stage may need to change how the device handles unlocked steps; we'd decide that from the results.

## Stage 4: pitch envelope as pitch bend ([#4](https://github.com/coconutPhreak/pitchBender-m4l/issues/4))

v4.2 (per-note MPE) tested in Live and on Push 3 Standalone with Meld on 2026-11-10 (L1, S4.1–S4.17, P1, P1b): all pass.

The envelope goes 0 → Peak over Attack, then Peak → End over Decay, then holds End until the next trigger. Times are % of Trigger Length. Pitches are in semitones for now; scale degrees come in Stage 5. The device sends the starting bend before each note-on. Incoming pitch bend passes through on its own (master) channel, so the instrument adds it on top of each note's bend.

Since v4.1 each note plays on its own MPE member channel (2–16, rotating) and carries its own pitch bend. Setup: placeholder notes every 4 steps, Length 4 steps (500 ms at 120 BPM), Bend Range 48 with the instrument's per-note range at 48. Use a sustained sound so the pitch movement is easy to hear. Debug on for the first few tests.

- **S4.1 Defaults are flat:** with Peak 0 and End 0, there's no audible bend. The console shows one `bend 8192` per note (its starting bend) and nothing else.
- **S4.2 Rise and fall:** Peak +12, End 0, Attack 20 %, Decay 30 %. Each note rises an octave over the first 100 ms, falls back over the next 150 ms, then holds at Note.
- **S4.3 Rise and hold:** Peak +12, End +12, Attack 50 %, Decay 0 %. Each note rises an octave over 250 ms and stays there.
- **S4.4 Downward:** Peak −12, End −5. The pitch dips an octave, then settles a fourth below Note.
- **S4.5 Curves:** with S4.2's settings, A Curve +100 gives a slow start and a fast snap into Peak (the classic slide), and −100 a fast start and a slow settle. D Curve does the same for the decay. 0 is a straight glide.
- **S4.6 Over 100 %:** Attack 80 %, Decay 80 %. Both shrink to fit, so the note reaches Peak at the halfway point and End exactly at the note-off.
- **S4.7 Zero stages:** Attack 0 % starts the note at Peak, with no slide up. Decay 0 % jumps from Peak straight to End. Both at 0 % play the note at End from the start.
- **S4.8 Envelope Off:** turn Envelope off. Notes play at Note with no bend. If the previous note held a non-zero End, the next note still plays at Note (one `bend 8192` on its own channel), while the previous note's release tail keeps its End pitch.
- **S4.9 Hold after note-off:** End +7 and a sound with a long release. The release tail stays at +7 until the next trigger.
- **S4.10 Pitch accuracy:** Peak +12, End +12. The held pitch is exactly an octave above Note (check against a reference or a tuner). Then Bend Range 24 with the instrument's per-note range at 24: still exactly an octave.
- **S4.11 Clamping:** Bend Range 12 (instrument per-note range 12) and Peak +24. The pitch stops at +12 (flat top) instead of going further. The visible "clamped" indicator comes in Stage 6.
- **S4.12 Tempo and transport:** the envelope follows tempo (60 vs 180 BPM). With the transport stopped, notes played from the keyboard still glide, timed at the current tempo.
- **S4.13 Transport stop:** stop mid-glide. The note ends and the console shows `bend 8192` (back to centre).
- **S4.14 P-locks:** p-lock Peak +12 on one step only. That step slides and the others don't. Do the same for Envelope (Off on one step).
- **S4.15 Smoothness:** a slow glide (Length 16 steps, Peak +12, Attack 100 %) sounds smooth, with no stepping.
- **S4.16 Release tails (MPE):** a sound with a long release (about 1 s), placeholders every 2 steps, Length 1 step. Alternate End between +7 and 0 with p-locks on every other step. Each note's tail keeps its own End pitch while the next note plays; nothing jumps.
- **S4.17 Master bend:** move Push's touch strip while notes play. All notes bend on top of their envelope. (Merging and Bend Amount get reworked in Stage 6.)

## Stage 5: scale awareness ([#5](https://github.com/coconutPhreak/pitchBender-m4l/issues/5))

v5 tested in Live and on Push 3 Standalone with Meld on 2026-11-10 (S5.1–S5.9): all pass. The Live API scale reads work in standalone.

With **Scale** on (bank Setup, encoder 4) and Live's Scale Mode on, Note snaps down to the nearest note of the project scale, and Peak and End are **scale degrees** counted from Note, wrapping octaves. With Scale off, or Live's Scale Mode off, everything is plain semitones as before. Pitch bend still glides continuously between targets; only the targets are in key. The labels under Peak and End show the target note in the device view (Push shows only the number).

Setup: as Stage 4 (placeholders every 4 steps, Length 4 steps, Meld per-note range 48). In Live, turn on Scale Mode and set the project scale to **C Minor**. On load, the console should show `scale_intervals 0 2 3 5 7 8 10`, `scale_mode 1` and `scale_notes_root_mask 75 0 1453`.

- **S5.1 Degrees up and down:** Note C1, Peak +2, End +2, Attack 0 %: the note plays E♭1 (label D#1). Peak +7 → C2 (an octave). Peak −1 → B♭0 (A#0).
- **S5.2 Snap:** set Note to C#1 (not in C minor). The note plays C1, and the targets count from C1.
- **S5.3 Glide:** Peak +4 (G1), End 0, Attack 30 %, Decay 30 %. The pitch glides smoothly up to G1 and back, with no stepping through scale notes.
- **S5.4 Scale change:** switch the project scale to C Major. The console prints a new `scale_notes_root_mask … 0 2741`, and Peak +2 now gives E1. Change the root to D: Peak +2 from D1 gives F#1.
- **S5.5 Change mid-note:** with Length 16 steps, change the scale while a note glides. The note already playing keeps its targets; the next note uses the new scale.
- **S5.6 Scale off:** turn Scale off. Note C#1 plays C#1, and Peak +2 is 2 semitones (D#1). Turn it back on, then turn Live's Scale Mode off: also plain semitones (the console shows `scale_mode 0`).
- **S5.7 Labels:** turning Note, Peak or End, or changing the scale, updates the labels right away, without playing.
- **S5.8 P-locks:** p-lock Peak +4 on one step in C minor: that step goes to G1, the others don't move.
- **S5.9 Push standalone:** repeat S5.1, S5.4 and S5.6 on Push 3 Standalone, changing the scale from Push's Scale menu. This is the key test: does the Live API scale reading work in standalone?

## Push 3

- **P1 Load on standalone:** on a fresh Push standalone track, load the device. It loads with no "missing or incompatible Max objects" message. Bank **Pitch** shows Note, Length, Attack, Peak, A Curve, Decay, End and D Curve on encoders 1–8. Bank **Perform** shows Velocity and Envelope on encoders 1–2. Bank **Setup** shows Bend Rng on encoder 3 and Scale on encoder 4. The console shows no `parameter ... not found` line.
- **P1a Stage 1 on Push:** repeat S1.1, S1.3, S1.5 and S1.6 on Push standalone with a step-sequenced clip.
- **P1b Stage 4 on Push:** repeat S4.2, S4.5, S4.14, S4.15 and S4.16 on Push standalone. Also play fast notes (1/16 placeholders, Length 1 step, Peak +12, Attack 50 %) on a bass instrument and check that Push's CPU meter stays reasonable and nothing glitches.

### If Push standalone says "This device contains missing or incompatible Max objects"

Every object class in the patch already passed retrig-m4l's probes, but some combinations can still break. Note which test failed and what the device showed (which parameters appeared), and paste back any console output.
