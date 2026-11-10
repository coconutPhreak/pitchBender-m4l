# PitchBender – Max for Live device

A mono Max for Live MIDI effect for bass lines. Each placeholder note triggers the device's own note, plus a two-stage pitch-bend envelope and two static CCs. You can p-lock every value per step from Push 3, and the device must run in Push 3 Standalone. The spec is a Claude Doc: https://claude.ai/artifact/BATfd7L6FMhTEnKPRnYNxy (read it with the Claude Docs connector). If a decision changes, update it there.

## Hard constraints

- MIDI effect on the track, before the instrument. Mono: the device owns its note-offs.
- All controls are automatable `live.*` parameters in the Push bank layout from the spec's Parameters table (`parameters.parameterbanks`). The setup parameters are not automatable.
- Native Max objects only: no externals, no `node.script`, no `moses` (it breaks the first load on Push standalone; found in retrig-m4l). `scripts/build_amxd.py` keeps an allowlist of object classes that passed retrig-m4l's Push standalone probes (`../retrig-m4l/scripts/make_probes.py`). A new class must pass a probe before it goes on that list.
- Timing runs on the Max scheduler (`delay` in ticks while playing, ms when stopped), not JS.
- Keep CPU and UI light: Push standalone.

## Workflow

- Claude can't run Max or Live. The user tests in Live and on Push and pastes Max console output back.
- Patcher source is `src/pitchbender.maxpat` (JSON). `python3 scripts/build_amxd.py` builds `build/PitchBender.amxd` (git-ignored). Build straight to `.amxd`: Push banks and device width live at patcher level, and pasting into the device editor loses them. `--extract` brings device-editor edits back into `src/`.
- `TESTING.md` lists the tests for each stage. Build stages are GitHub issues #1–#8. Close an issue (with "Closes #N" in a commit) and tick its README box only after the user confirms its tests pass on Push.
- The license is added at the very end of the project.
- Commit in small steps with clear messages.
