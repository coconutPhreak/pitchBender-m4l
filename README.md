# pitchBender-m4l

A mono Max for Live MIDI effect for bass lines. Each placeholder note in a clip triggers the device, which plays its own note and can add a two-stage pitch-bend envelope and per-note Slide and Pressure, with per-note MPE output (needs an MPE instrument such as Meld). You can p-lock every value per step from Push 3, and the device must run in **Push 3 Standalone**.

- **Device type:** Max for Live MIDI Effect (`.amxd`). Put it before an MPE instrument whose per-note bend range matches the device's Bend Range.
- **Mono only:** notes never overlap.
- **Scale-aware:** pitch values follow the Live 12 project scale. A switch turns this off so values are plain semitones.
- **Standard Max objects only:** no externals.

Full spec: [Pitch Envelope MIDI Effect — Spec](https://claude.ai/artifact/BATfd7L6FMhTEnKPRnYNxy)

## Layout

- `src/pitchbender.maxpat`: patcher source (JSON)
- `scripts/build_amxd.py`: builds `build/PitchBender.amxd` from the source and checks it before building
- `TESTING.md`: how to build, load and test each stage
- `docs/`: notes and hardware test logs

## Build

```bash
python3 scripts/build_amxd.py
```

Then drag `build/PitchBender.amxd` onto a MIDI track, before the instrument. See `TESTING.md`.

## Build order

Test each stage on Push 3 Standalone before you start the next. Each stage has a GitHub issue, closed by the commit that finishes it.

- [x] Stage 1 (#1): swallow the placeholder note, send Note for Trigger Length, prevent stuck notes
- [x] Stage 2 (#2): p-lock latch test (no deferral needed)
- [x] Stage 3 (#3): a step p-lock covers only its own step (see docs/plock-scope.md)
- [x] Stage 4 (#4): envelope (Attack, Peak, Decay, End, curves) as pitch bend, in semitones only
- [ ] Stage 5 (#5): scale awareness (check that Live API scale reads work in standalone)
- [ ] Stage 6 (#6): incoming bend with MPE (master channel) and Bend Amount
- [ ] Stage 7 (#7): Slide and Pressure (per-note MPE)
- [ ] Stage 8 (#8): CPU check on Push with the full device and a bass instrument running

## Open questions

- [ ] Which synced values Trigger Length offers
- [x] Bend Range default: 48 each way (MPE per-note standard)
- [x] Instruments: MPE only (decided 2026-11-10, see docs/mpe-probe.md)
