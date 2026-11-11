# pitchBender-m4l

A mono Max for Live MIDI effect for bass lines. Each placeholder note in a clip triggers the device, which plays its own note with a two-stage pitch-bend envelope (slides, drops and 303-style glides) plus per-note Slide and Pressure and a Breath CC. Every value can be p-locked per step from Push 3, and the device runs in **Push 3 Standalone**. Its output is per-note **MPE**, so each note keeps its own pitch through its release tail.

- **Device type:** Max for Live MIDI Effect (`.amxd`), MPE-enabled.
- **Instrument:** an MPE instrument after the device: Meld, Drift, Wavetable, or a plug-in in MPE mode. Its per-note pitch-bend range must match the device's **Bend Range** (default 48). Non-MPE instruments (e.g. Operator) won't follow the pitch envelope.
- **Mono:** one note at a time. The device ignores the placeholder's pitch, length and velocity and plays its own.
- **Scale-aware:** with Live 12's Scale Mode on, Note snaps to the project scale, and Peak and End count in scale degrees.
- **Standard Max objects only:** no externals, no JavaScript.

Full spec: [Pitch Envelope MIDI Effect — Spec](https://claude.ai/artifact/BATfd7L6FMhTEnKPRnYNxy)

## Quick start

1. Put PitchBender on a MIDI track, then an MPE instrument such as Meld after it. Check that the instrument's per-note bend range matches Bend Range (48).
2. Make a clip with notes wherever you want the bass to play. Their pitch doesn't matter: each one triggers the device's Note.
3. Set Note, Length and the envelope (Peak, End, Tilt Env). On Push, hold a step and turn an encoder to p-lock that step (for example, Peak +7 for a slide up a fifth on one note).

## Controls

Push banks, in encoder order.

| Bank | Control | Range | Default | What it does |
|---|---|---|---|---|
| Pitch | Note | MIDI note | C1 | The note played on each trigger. Snaps down to the scale when Scale is on. |
| Pitch | Length | 1/64 (0.25 step) to 32 steps | 1/16 (1 step) | How long the note lasts, synced to tempo. |
| Pitch | Velocity | 1–127 | 100 | Velocity of the device's note. |
| Pitch | Peak | ±24 | 0 | Where the attack goes (and where a falling ramp starts), in scale degrees from Note (semitones with Scale off). The label shows the target note. |
| Pitch | End | ±24 | 0 | Where the decay settles and holds, through the note's release, until the next note. Not used at Tilt +100 and above. |
| Pitch | Tilt Env | −200 to +200 | 0 | Envelope shape. −100 falling ramp (starts at Peak, falls to End over the whole note), 0 triangle (half up, half down), +100 rising ramp (rises to Peak over the whole note and holds it). Beyond ±100 the ramp overshoots up to 200 % of Length: the note ends partway through and its pitch holds where it got to. |
| Pitch | A Curve | −100 to +100 | 0 | Attack shape: −100 fast start, 0 straight, +100 slow start with a fast snap (the classic slide). |
| Pitch | D Curve | −100 to +100 | 0 | Decay shape, like A Curve. |
| Perform | Envelope | Off / On | On | Pitch envelope on or off (p-lock it so only some steps slide). |
| Perform | Slide | 0–127 | 64 | Per-note MPE Slide (CC74), e.g. mapped to cutoff in the instrument. With S Depth 0 it's a static value; otherwise it's where the Slide envelope ends (its offset). Also on bank Slide Env. |
| Perform | Pressure | 0–127 | 0 | Per-note MPE Pressure. Map it in the instrument. |
| Perform | Breath | 0–127 | 0 | Breath Controller (CC2) on the MPE master channel, sent with each note. Map it in the instrument. A ringing release tail takes the next note's value. |
| Perform | Bend Amt | 0–100 % | 100 % | Scales incoming pitch bend (touch strip, clip, earlier device) on the MPE master channel before it passes through; applies at once. The instrument's own (master) pitch-bend range sets how far a full bend goes. |
| Slide Env | Slide | 0–127 | 64 | Same control as on Perform: the envelope's offset (end value). |
| Slide Env | S Depth | −127 to +127 | 0 | Envelope depth: each note's Slide starts at Slide + Depth (the starting cutoff) and moves to Slide. Negative = rising. 0 = no envelope. |
| Slide Env | S Rel | 0–400 % of Length | 100 % | Release time. 100 % lands exactly at the note's end. Above 100 % overshoots: the note ends mid-release and Slide holds where it got to. 0 % = straight to Slide. |
| Slide Env | S Curve | −100 to +100 | 0 | Release shape: −100 fast drop and slow tail (classic filter decay), 0 straight, +100 slow start and fast end. |
| Setup | Bend Rng | 1–96 semitones | 48 | Per-note bend range each way. Must match the instrument. |
| Setup | Scale | Off / On | On | Follow Live's scale (when Live's Scale Mode is on), or use plain semitones. |

A red **CLAMPED** label means the last note's Peak or End went beyond Bend Range, so its pitch stopped at the range limit.

## Good to know

- **P-locks cover their own step only.** Unlocked steps play the knob's value.
- **Turning a locked knob by hand overrides its locks.** That's how Live handles automation: the locks aren't lost, but they stay silenced until you press **Re-enable Automation** (in Live or on Push).
- **Values are read when each note starts.** Changing a knob, or the scale, mid-note affects the next note. Pressure, Breath and Bend Amount are the exceptions: they apply straight away. (Slide is per note since v7, so its envelope can't be overridden mid-note.)
- **Set the instrument to poly (2+ voices).** PitchBender already plays one note at a time; extra voices let a note's release tail ring at its own pitch and Slide while the next note starts. In mono mode the instrument reuses one voice for overlapping notes and can keep the old note's Slide and Pressure.
- **Avoid p-locking Bend Range and Scale.** They're setup values, automatable only because Push can't show them otherwise.
- **Place it directly on the track,** not inside a rack, so stopping a clip ends the device's note.
- **Tilt Env replaced Attack and Decay in v1.1.** Sets saved with v1.0.0 lose their Attack and Decay automation and p-locks; everything else loads as before.
- **CPU is light** on Push 3 Standalone in our tests, but it hasn't been tested alongside many other devices. If you see big CPU spikes with PitchBender in a Set, please [open an issue](https://github.com/coconutPhreak/pitchBender-m4l/issues).

## Develop

- `src/pitchbender.maxpat`: patcher source (JSON). `python3 scripts/build_amxd.py` checks it (wiring, Push banks, object classes that have passed the Push standalone probes) and builds `build/PitchBender.amxd`. `--extract` brings device-editor edits back into `src/`.
- `src/probes/`: probe devices (the MPE probe).
- `TESTING.md`: how to load and test every stage. `docs/`: test results and decisions.

## Build order

Test each stage on Push 3 Standalone before you start the next. Each stage has a GitHub issue, closed by the commit that finishes it.

- [x] Stage 1 (#1): swallow the placeholder note, send Note for Trigger Length, prevent stuck notes
- [x] Stage 2 (#2): p-lock latch test (no deferral needed)
- [x] Stage 3 (#3): a step p-lock covers only its own step (see docs/plock-scope.md)
- [x] Stage 4 (#4): envelope (Attack, Peak, Decay, End, curves) as pitch bend, per-note MPE
- [x] Stage 5 (#5): scale awareness (Live API scale reads work in standalone)
- [x] Stage 6 (#6): incoming bend with MPE (master channel) and Bend Amount
- [x] Stage 7 (#7): Slide and Pressure (per-note MPE)
- [x] Stage 8 (#8): CPU check on Push with the full device and a bass instrument running

## Decisions

- Trigger Length: 0.25–8 steps in 0.25s, 8–16 in 0.5s, 16–32 in 1s (64 values; see docs/trigger-length.md)
- Bend Range default: 48 each way (MPE per-note standard)
- Instruments: MPE only (decided 2026-11-10; see docs/mpe-probe.md)
- Bend Amount kept: it scales incoming master-channel bend (decided 2026-11-10)
- Breath (CC2) added beside Pressure, on the master channel because MPE has no per-note CC2 (2026-11-10)
- Tilt Env (v1.1, 2026-11-11) replaces Attack and Decay: −100 falling ramp, 0 triangle, +100 rising ramp, overshoot to 200 % at ±200. Velocity moved to bank Pitch
- Slide release envelope (v7, 2026-11-10): S Depth, S Rel (up to 400 %, cut off at the note's end), S Curve; Slide is its offset and now per note

## License

MIT. See [LICENSE](LICENSE).
