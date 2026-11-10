# pitchBender-m4l

A mono Max for Live MIDI effect for bass lines. Each placeholder note in a clip triggers the device, which plays its own note and can add a two-stage pitch-bend envelope and two static CCs. You can p-lock every value per step from Push 3, and the device must run in **Push 3 Standalone**.

- **Device type:** Max for Live MIDI Effect (`.amxd`). Put it before an instrument whose pitch-bend range matches the device's Bend Range.
- **Mono only:** notes never overlap.
- **Scale-aware:** pitch values follow the Live 12 project scale. A switch turns this off so values are plain semitones.
- **Standard Max objects only:** no externals.

Full spec: [Pitch Envelope MIDI Effect — Spec](https://claude.ai/artifact/BATfd7L6FMhTEnKPRnYNxy)

## Layout

- `device/`: the `.amxd` device and its patchers
- `docs/`: notes and hardware test logs

## Build order

Test each stage on Push 3 Standalone before you start the next. Each stage has a GitHub issue, closed by the commit that finishes it.

- [ ] Stage 1 (#1): swallow the placeholder note, send Note for Trigger Length, prevent stuck notes
- [ ] Stage 2 (#2): p-lock latch test, and tune the deferral
- [ ] Stage 3 (#3): check whether a step p-lock covers only its own step or holds until the next breakpoint
- [ ] Stage 4 (#4): envelope (Attack, Peak, Decay, End, curves) as pitch bend, in semitones only
- [ ] Stage 5 (#5): scale awareness (check that Live API scale reads work in standalone)
- [ ] Stage 6 (#6): incoming bend offset and Bend Amount
- [ ] Stage 7 (#7): CC A and CC B
- [ ] Stage 8 (#8): CPU check on Push with the full device and a bass instrument running

## Open questions

- [ ] Which synced values Trigger Length offers
- [ ] Bend Range default: 48 in total (±24), or ±48
- [ ] Whether the target bass instruments support the chosen bend range
