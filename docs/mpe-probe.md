# MPE probe

**The question:** can a Max for Live MIDI effect send per-note MPE (each note on its own channel, with its own pitch bend, Slide and Pressure) to an MPE instrument on Push 3 Standalone? If yes, PitchBender switches to per-note MPE output (see the reasoning below). If no, it keeps one channel-wide pitch bend.

## The probe device

`src/probes/mpe_probe.maxpat`, built with:

```bash
python3 scripts/build_amxd.py --src src/probes/mpe_probe.maxpat --out "build/probes/MPE Probe.amxd"
```

- **MPE on:** the device's MPE flag (`is_mpe`) is set, and it uses no object classes beyond the ones that already passed the Push probes.
- **Each placeholder note-on:** the device plays **Note** for 2 steps on the next member channel (3, 4, … 16, 2, 3 …). Before the note-on it sends, on that channel: a pitch bend of **Bend** semitones (14-bit, scaled by **PB Range**, default 48 each way), **Slide** (CC74) and **Pressure** (channel pressure). Every byte is written by the probe itself, straight to `midiout`.
- **Alternate On:** every second note has no bend, so you can hear whether a ringing release tail keeps its own pitch.
- **Channels:** *Fixed 2* puts every note on channel 2, which behaves like one shared bend. It's the comparison case.
- **Pass-through:** everything else passes through, including pitch bend on the master channel.
- **Console:** `mpeprobe: loaded` when the device loads, then `mpeprobe: note_ch_bend P C V` for each note (pitch, channel, bend value; 8192 = no bend).
- **Transport:** keep it playing (the 2-step length runs in ticks).

## Tests

Setup: a MIDI track with **Meld** and the probe directly on the track, before Meld. Make a clip with a placeholder note every 4 steps. Give Meld a sustained sound with a **long release** (about 1 s) so tails overlap the next note. Check Meld's MPE / per-note pitch-bend range: it should be 48 to match PB Range.

| Test | What to check | Result |
|---|---|---|
| M1 Load (Push) | On a fresh Push standalone track, the probe loads with no "missing or incompatible Max objects" message, and bank **Probe** shows Note, Bend, Slide, Pressure, Alternate, Channels and PB Range. | Pass |
| M2 Per-note pitch | Bend +7: every note plays a fifth above Note. Bend +12: exactly an octave (tune against a reference). | Pass (+7 = G2, +12 = C3 from C2) |
| M3 Tails keep their pitch | Alternate On, Channels Rotate. While a bent note's release tail rings, the next (unbent) note starts. The tail stays a fifth up, and the new note is at Note. Then switch Channels to **Fixed 2**: the tail should now jump down when the next note starts. That difference is the reason for MPE. | Pass |
| M4 Slide and Pressure | In Meld's modulation matrix, map MPE Slide to filter cutoff and MPE Pressure to something audible (or watch the mod meters). Turning the Slide and Pressure dials changes the next notes. | Pass |
| M5 Master bend | With notes playing, move Push's touch strip (or a pitch-bend envelope in the clip). All notes bend on top of their per-note bend. | Pass |
| M6 Same in Live | Repeat M2–M4 in Live on the computer. | Pass |

If M2 fails everywhere (no per-note bend at all), Live may not treat the probe as MPE from the saved flag. Open it in the device editor, look for an MPE option in the patcher or device inspector, turn it on and save. Then extract it back with `--extract` so we can see what changed.

**Result (2026-11-10, Push 3 Standalone and Live, with Meld): all pass.** The first probe build had a wiring bug (PB Range, Alternate and Channels never reached the patch, so any bend went to full scale). After the fix (`9ad00b6`), M1–M6 passed. PitchBender switches to per-note MPE output from v4.1.

## Why MPE (decided 2026-11-10, confirmed by this probe)

- **Release tails:** with one channel-wide bend, every trigger has to reset the bend before its note-on, which drags the previous note's release tail with it. Per-note bend leaves each tail at its own pitch.
- **Incoming bend:** it can stay on the master channel and the instrument adds it to each note's bend, so the device stops merging, offsetting and clamping it (most of Stage 6).
- **CCs:** CC A and CC B become MPE Slide (CC74) and Pressure. That drops the CC Number setup parameters and the incoming-CC collision rule (most of Stage 7). They're mapped inside the instrument instead.
- **Bend range:** MPE's standard per-note range is ±48, which settles the Bend Range default.
- **What stays:** the envelope engine (clock, curves, latching) carries over unchanged. Only the output moves to the note's own channel.
- **Cost:** MPE instruments only (Meld is fine; Operator and non-MPE plug-ins lose the pitch movement), plus a channel rotation for the device's own notes.
