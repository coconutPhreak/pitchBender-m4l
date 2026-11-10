#!/usr/bin/env python3
"""Build a Max for Live MIDI effect (.amxd) from a .maxpat, or extract one back.

    python3 scripts/build_amxd.py                       # src/pitchbender.maxpat -> build/PitchBender.amxd
    python3 scripts/build_amxd.py --extract build/PitchBender.amxd   # -> src/pitchbender.maxpat

An unfrozen .amxd is the patcher JSON with a small binary header (matching the
devices that ship with Live 12):

    "ampf" <u32 4> "mmmm"            device type: mmmm = MIDI effect
    "meta" <u32 4> <u32 0>
    "ptch" <u32 len> <JSON + NUL>    len counts the trailing NUL

Building straight to .amxd keeps device-level settings (Push banks in
"parameterbanks", presentation mode, device width) that a copy and paste into
Live's device editor would drop.

Extract only works on unfrozen devices. Save from the device editor without
freezing before extracting.
"""
import argparse
import json
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_SRC = ROOT / "src" / "pitchbender.maxpat"
DEFAULT_OUT = ROOT / "build" / "PitchBender.amxd"


# Object classes that passed retrig-m4l's Push 3 standalone probes (scripts/make_probes.py there).
# A new class must pass a probe on a fresh Push standalone track before it goes in this list.
# `moses` is known bad: it breaks the first load on a fresh Push standalone track.
ALLOWED = {
    "*", "+", "coll", "delay", "expr", "f", "gate", "i", "live.observer", "live.path", "live.thisdevice",
    "live.banks", "midiformat", "midiin", "midiout", "midiparse", "p", "pack", "prepend", "print", "random",
    "sel", "stripnote", "t", "translate", "unpack", "uzi", "inlet", "outlet",
}
UI = {"comment", "message", "toggle", "live.comment", "live.dial", "live.menu", "live.toggle", "live.numbox"}


def check_patch(patcher: dict, where: str = "patcher") -> None:
    """Refuse to build on wiring or object errors that Max would only show as a broken device."""
    errs = []
    boxes = {b["box"]["id"]: b["box"] for b in patcher["boxes"]}
    for bid, bx in boxes.items():
        cls = bx["maxclass"] if bx["maxclass"] != "newobj" else bx.get("text", "").split(" ")[0]
        if cls not in ALLOWED | UI:
            errs.append(f"{bid}: object class '{cls}' has not passed the Push standalone probes")
        if "patcher" in bx:
            check_patch(bx["patcher"], f"{where}/{bid}")
    for ln in patcher["lines"]:
        (s, so), (d, di) = ln["patchline"]["source"], ln["patchline"]["destination"]
        if s not in boxes or d not in boxes:
            errs.append(f"line {s}:{so} -> {d}:{di}: unknown box")
            continue
        if so >= boxes[s].get("numoutlets", 0):
            errs.append(f"line {s}:{so} -> {d}:{di}: {s} has only {boxes[s].get('numoutlets', 0)} outlets")
        if di >= boxes[d].get("numinlets", 0):
            errs.append(f"line {s}:{so} -> {d}:{di}: {d} has only {boxes[d].get('numinlets', 0)} inlets")
    if where == "patcher":
        params = {k: v for k, v in patcher.get("parameters", {}).items() if isinstance(v, list)}
        longnames = {v[0] for v in params.values()}
        for k, v in params.items():
            box = boxes.get(k)
            name = box and box.get("saved_attribute_attributes", {}).get("valueof", {}).get("parameter_longname")
            if name != v[0]:
                errs.append(f"parameters[{k}] = {v[0]!r}, but the box's parameter_longname is {name!r}")
        for bank in patcher.get("parameters", {}).get("parameterbanks", {}).values():
            for n in bank["parameters"]:
                if n != "-" and n not in longnames:
                    errs.append(f"bank {bank['name']!r}: unknown parameter {n!r}")
    if errs:
        sys.exit(f"{where}: refusing to build:\n  " + "\n  ".join(errs))


def build(src: Path, out: Path) -> None:
    text = src.read_text(encoding="utf-8")
    check_patch(json.loads(text)["patcher"])  # also fails early on broken JSON
    payload = text.encode("utf-8") + b"\x00"
    header = (b"ampf" + struct.pack("<I", 4) + b"mmmm"
              + b"meta" + struct.pack("<I", 4) + struct.pack("<I", 0)
              + b"ptch" + struct.pack("<I", len(payload)))
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(header + payload)
    print(f"built {out.relative_to(ROOT) if out.is_relative_to(ROOT) else out} ({len(header) + len(payload)} bytes)")


def extract(amxd: Path, out: Path) -> None:
    data = amxd.read_bytes()
    if data[:4] != b"ampf":
        sys.exit(f"{amxd}: not an .amxd file")
    i = data.find(b"ptch")
    if i < 0:
        sys.exit(f"{amxd}: no ptch chunk")
    (n,) = struct.unpack("<I", data[i + 4:i + 8])
    body = data[i + 8:i + 8 + n]
    if not body.startswith(b"{"):
        sys.exit(f"{amxd}: device is frozen; save it unfrozen from the device editor first")
    text = body.rstrip(b"\x00").decode("utf-8")
    json.loads(text)
    out.write_text(text if text.endswith("\n") else text + "\n", encoding="utf-8")
    print(f"extracted {amxd} -> {out}")


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--extract", metavar="AMXD", type=Path, help="write the device's patcher back to src/")
    ap.add_argument("--src", type=Path, default=DEFAULT_SRC)
    ap.add_argument("--out", type=Path, default=DEFAULT_OUT)
    a = ap.parse_args()
    if a.extract:
        extract(a.extract, a.src)
    else:
        build(a.src, a.out)


if __name__ == "__main__":
    main()
