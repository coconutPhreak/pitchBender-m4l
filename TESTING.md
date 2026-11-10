# Testing PitchBender

This file covers building the device, loading it in Live and on Push, and the checks for each build stage. Each stage has a GitHub issue that is closed once all of its tests pass on Push 3 Standalone.

## Build and load

1. Build the device from the patcher source:

   ```bash
   python3 scripts/build_amxd.py
   ```

   This writes `build/PitchBender.amxd`. The build refuses to run if a patch cord points at a missing box or inlet, if a Push bank names an unknown parameter, or if an object class hasn't passed the Push standalone probes.
2. In Live, make a MIDI track and load a bass instrument on it (Operator or Drift is fine).
3. Drag `build/PitchBender.amxd` onto the track, *before* the instrument. Put it directly on the track, not inside a rack, because the clip-stop check watches the track's clip slots.
4. The device should show Note (C1), Velocity (100), Length (1 step) and Latch Delay (1 ms).

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
- `pitchbender: timer_ticks N` (transport playing) or `pitchbender: timer_ms N` (stopped): the Trigger Length timer for that note
- `pitchbender: end timer` when the timer ends a note, and `pitchbender: end kill` at each new trigger, transport stop, clip stop or device off. A note-off right after `end kill` means the note was cut, not timed out.

Paste the console output back, along with any red error lines that appear when the device loads.

## Load check (do this first)

- **L1:** Load the device. The Max console prints `pitchbender: loaded v2` with no red errors, and the controls show the defaults above. If `loaded` doesn't appear, the patch didn't start: paste the console output back.

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

## Stage 2: p-lock latch and deferral ([#2](https://github.com/coconutPhreak/pitchBender-m4l/issues/2))

The device reads its parameters once per trigger. A step's p-lock has to land *before* that read, or the step plays the previous step's value. **Latch Delay** (bank Setup, encoder 5) sets how long the device waits after a placeholder note before reading: Off (no wait), Next tick (the next scheduler pass, 0 ms), 1, 2, 5 or 10 ms. It's a temporary test parameter. After tuning, the best value becomes fixed and the parameter goes away.

Setup: a 1-bar clip with a placeholder note on every step (16 notes, each 1 step long). Length 1 step. Turn on Debug.

- **S2.1 Live clip envelope:** in the clip's envelope editor, choose PitchBender → Note and draw a step automation value of 43 (G1) on step 5 only, leaving the rest at 36. With each Latch Delay setting, from Off upwards, check the console for step 5: it should show `note 43 100` on step 5 itself, not on step 6. Record which settings get it right.
- **S2.2 Push p-lock:** on Push standalone, hold step 5 and turn the Note encoder to G1. With each Latch Delay setting, check by ear (or with Debug in Live via Control Mode) that step 5 plays G1 and step 4 doesn't.
- **S2.3 Neighbouring locks:** p-lock steps 5 and 6 to different notes (G1, A♯1). Each step plays its own value, with no smearing between them.
- **S2.4 Other parameters:** p-lock Velocity (bank Perform) and Length on step 9. Step 9 takes both values on its own trigger.
- **S2.5 Timing:** with the chosen setting, the notes still sit on the grid by ear (10 ms would be audible as a slight lag; 1–2 ms shouldn't be).
- **S2.6 Fast steps:** at 1/32 placeholders and a high tempo (e.g. 170 BPM), every step still plays and the locks still land.

Report the smallest Latch Delay that passes S2.1–S2.4 in Live **and** on Push. That value gets fixed.

What happens on the step *after* a lock (does it hold G1 or go back to C1) is Stage 3 ([#3](https://github.com/coconutPhreak/pitchBender-m4l/issues/3)); just note what you see.

## Push 3

- **P1 Load on standalone:** on a fresh Push standalone track, load the device. It loads with no "missing or incompatible Max objects" message. Bank **Pitch** shows Note and Length on encoders 1–2. Bank **Perform** shows Velocity on encoder 1. Bank **Setup** shows Latch Delay on encoder 5 (since v2).
- **P1a Stage 1 on Push:** repeat S1.1, S1.3, S1.5 and S1.6 on Push standalone with a step-sequenced clip.

### If Push standalone says "This device contains missing or incompatible Max objects"

Every object class in the patch already passed retrig-m4l's probes, but some combinations can still break. Note which test failed and what the device showed (which parameters appeared), and paste back any console output.
