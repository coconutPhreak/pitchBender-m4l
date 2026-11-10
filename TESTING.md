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
4. The device should show Note (C1), Velocity (100) and Length (1 step).

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

- **L1:** Load the device. The Max console prints `pitchbender: loaded v2.1` with no red errors, and the controls show the defaults above. If `loaded` doesn't appear, the patch didn't start: paste the console output back.

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

This tests Push's behaviour, not the device's. The device plays whatever value the automation holds when each step triggers, so the question is: does a Push step p-lock cover **only its own step**, or does it **hold until the next breakpoint**? Write the answers in [docs/plock-scope.md](docs/plock-scope.md).

Setup (Push 3 Standalone): a fresh 1-bar clip with a placeholder note on every step (16 notes, each 1 step long), no automation yet. Note at C1, Length 1 step, Velocity 100. Use Debug in Live via Control Mode if you can; otherwise listen.

- **S3.1 Single lock:** hold step 5 and turn Note to G1. Play two loops. What do steps 1–4 and 6–16 play: C1, or G1?
- **S3.2 Envelope shape:** open the clip in Live (Control Mode, or copy the Set to the computer) and look at the Note envelope. Is it a step covering only step 5, or a breakpoint that stays at G1?
- **S3.3 Two locks:** also lock step 9 to A♯1. What do steps 6–8 and 10–16 play?
- **S3.4 Knob after locking:** with no step held, turn the Note encoder while the clip plays. Do the unlocked steps follow it, and do the locked steps keep their values? Does Live show the parameter as overridden (an automation re-enable button lit)?
- **S3.5 Other parameters:** lock Velocity and Length on step 13. Same questions as S3.1 for those two.
- **S3.6 Clearing a lock:** remove step 5's lock (hold step 5 and delete its automation). Does step 5 go back to the unlocked value?

Stage 3 is done once each question has an answer in docs/plock-scope.md. If locks hold until the next breakpoint, a later stage may need to change how the device handles unlocked steps; we'd decide that from the results.

## Push 3

- **P1 Load on standalone:** on a fresh Push standalone track, load the device. It loads with no "missing or incompatible Max objects" message. Bank **Pitch** shows Note and Length on encoders 1–2. Bank **Perform** shows Velocity on encoder 1.
- **P1a Stage 1 on Push:** repeat S1.1, S1.3, S1.5 and S1.6 on Push standalone with a step-sequenced clip.

### If Push standalone says "This device contains missing or incompatible Max objects"

Every object class in the patch already passed retrig-m4l's probes, but some combinations can still break. Note which test failed and what the device showed (which parameters appeared), and paste back any console output.
