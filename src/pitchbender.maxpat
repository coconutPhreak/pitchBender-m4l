{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 0,
   "revision": 4,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   60.0,
   100.0,
   1300.0,
   800.0
  ],
  "openrect": [
   0.0,
   0.0,
   356.0,
   169.0
  ],
  "bglocked": 0,
  "openinpresentation": 1,
  "default_fontsize": 10.0,
  "default_fontface": 0,
  "default_fontname": "Arial Bold",
  "gridonopen": 1,
  "gridsize": [
   15.0,
   15.0
  ],
  "gridsnaponopen": 1,
  "objectsnaponopen": 1,
  "statusbarvisible": 2,
  "toolbarvisible": 1,
  "boxanimatetime": 500,
  "enablehscroll": 1,
  "enablevscroll": 1,
  "devicewidth": 356.0,
  "description": "Mono pitch-envelope MIDI effect for bass lines, with per-note MPE output.",
  "digest": "",
  "tags": "",
  "style": "",
  "subpatcher_template": "",
  "title": "PitchBender",
  "boxes": [
   {
    "box": {
     "id": "c-title",
     "maxclass": "comment",
     "text": "PITCHBENDER v4.1 (Stage 4, MPE): placeholder notes trigger the device's own Note for Trigger Length. All timing in the Max scheduler, no JS. Only object classes that passed retrig-m4l's Push standalone probes.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      4.0,
      900.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-in",
     "maxclass": "comment",
     "text": "1. MIDI in. Everything except notes goes straight through midiformat. Placeholder notes are swallowed: only their note-on is used, as a trigger.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      30.0,
      620.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "midiin",
     "maxclass": "newobj",
     "text": "midiin",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      20.0,
      54.0,
      54.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "parse",
     "maxclass": "newobj",
     "text": "midiparse",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "int",
      "int",
      "int",
      "int"
     ],
     "patching_rect": [
      20.0,
      84.0,
      120.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "format",
     "maxclass": "newobj",
     "text": "midiformat",
     "numinlets": 7,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      20.0,
      700.0,
      280.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "midiout",
     "maxclass": "newobj",
     "text": "midiout",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      20.0,
      730.0,
      61.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-trig",
     "maxclass": "comment",
     "text": "2. Note-on only (stripnote drops placeholder note-offs: the device owns its note-offs). Pitch and velocity of the placeholder are ignored.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      120.0,
      620.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "unp-in",
     "maxclass": "newobj",
     "text": "unpack 0 0",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      20.0,
      144.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "strip",
     "maxclass": "newobj",
     "text": "stripnote",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      20.0,
      174.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-trig",
     "maxclass": "newobj",
     "text": "t b b b b b",
     "numinlets": 1,
     "numoutlets": 5,
     "outlettype": [
      "bang",
      "bang",
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      20.0,
      210.0,
      130.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-trig2",
     "maxclass": "comment",
     "text": "Right to left: (3) kill the sounding note, (2) Trigger Length: start the note timer and the pitch envelope, whose first bend goes out before the note-on, (1) velocity, (0) Note -> note-on. Parameters are read here, at the trigger (latched for this note). No deferral: Stage 2 found a step's p-lock always lands before its note.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      140.0,
      210.0,
      620.0,
      48.0
     ],
     "linecount": 3,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-note",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Note",
     "patching_rect": [
      700.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Note",
       "parameter_shortname": "Note",
       "parameter_type": 1,
       "parameter_unitstyle": 8,
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        36
       ],
       "parameter_annotation_name": "The note the device plays on each trigger"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-length",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Trigger Length",
     "patching_rect": [
      780.0,
      60.0,
      70.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      110.0,
      113.0,
      70.0,
      15.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Trigger Length",
       "parameter_shortname": "Length",
       "parameter_type": 2,
       "parameter_enum": [
        "1/32",
        "1 step",
        "2 steps",
        "3 steps",
        "4 steps",
        "6 steps",
        "8 steps",
        "12 steps",
        "16 steps",
        "32 steps"
       ],
       "parameter_mmax": 9.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_annotation_name": "How long the device's note lasts (1 step = 1/16, synced to Live's tempo)"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-velocity",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Velocity",
     "patching_rect": [
      880.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      92.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Velocity",
       "parameter_shortname": "Velocity",
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": 1.0,
       "parameter_mmax": 127.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        100
       ],
       "parameter_annotation_name": "Velocity of the device's note (the placeholder's velocity is ignored)"
      }
     }
    }
   },
   {
    "box": {
     "id": "lbl-length",
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Length",
     "patching_rect": [
      780.0,
      40.0,
      50.0,
      18.0
     ],
     "presentation": 1,
     "presentation_rect": [
      110.0,
      95.0,
      70.0,
      18.0
     ],
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "lbl-title",
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "text": "PITCHBENDER v4.1",
     "patching_rect": [
      700.0,
      20.0,
      100.0,
      18.0
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      2.0,
      120.0,
      18.0
     ],
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "i-vel",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      300.0,
      250.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-note",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      220.0,
      250.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-len",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      20.0,
      250.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-pitch",
     "maxclass": "newobj",
     "text": "t i i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      220.0,
      290.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pack-on",
     "maxclass": "newobj",
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      220.0,
      330.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-on",
     "maxclass": "comment",
     "text": "3. Note-on. The sounding pitch is stored in i-sound, so the note-off always ends the pitch that started, even if Note changes while it sounds.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      300.0,
      290.0,
      380.0,
      34.0
     ],
     "linecount": 2,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-len",
     "maxclass": "comment",
     "text": "4. Trigger Length timer: a delay in ticks while the transport plays (locked to tempo), in ms at the current tempo when it is stopped.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      370.0,
      620.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "coll-len",
     "maxclass": "newobj",
     "text": "coll ---len",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      20.0,
      394.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0,
     "saved_object_attributes": {
      "embed": 1,
      "precision": 6
     },
     "coll_data": {
      "count": 10,
      "data": [
       {
        "key": 0,
        "value": [
         60
        ]
       },
       {
        "key": 1,
        "value": [
         120
        ]
       },
       {
        "key": 2,
        "value": [
         240
        ]
       },
       {
        "key": 3,
        "value": [
         360
        ]
       },
       {
        "key": 4,
        "value": [
         480
        ]
       },
       {
        "key": 5,
        "value": [
         720
        ]
       },
       {
        "key": 6,
        "value": [
         960
        ]
       },
       {
        "key": 7,
        "value": [
         1440
        ]
       },
       {
        "key": 8,
        "value": [
         1920
        ]
       },
       {
        "key": 9,
        "value": [
         3840
        ]
       }
      ]
     }
    }
   },
   {
    "box": {
     "id": "gate-time",
     "maxclass": "newobj",
     "text": "gate 2 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      20.0,
      430.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "translate",
     "maxclass": "newobj",
     "text": "translate ticks ms @listen 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20.0,
      466.0,
      170.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-dly-ms",
     "maxclass": "message",
     "text": "delaytime $1, bang",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20.0,
      500.0,
      142.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-dly-ticks",
     "maxclass": "message",
     "text": "delaytime $1 ticks, bang",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200.0,
      500.0,
      184.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "dly",
     "maxclass": "newobj",
     "text": "delay 100",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      20.0,
      540.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-off",
     "maxclass": "comment",
     "text": "5. Flush: note-off for the sounding pitch (-1 = nothing sounding), then mark nothing sounding. The timer ending flushes; kill also stops the timer.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      360.0,
      520.0,
      420.0,
      34.0
     ],
     "linecount": 2,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-kill",
     "maxclass": "newobj",
     "text": "t b b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      400.0,
      400.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-stop",
     "maxclass": "message",
     "text": "stop",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      460.0,
      440.0,
      44.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-sound",
     "maxclass": "newobj",
     "text": "i -1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      400.0,
      580.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-sound",
     "maxclass": "newobj",
     "text": "sel -1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      400.0,
      610.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-flush",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      400.0,
      640.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-none",
     "maxclass": "message",
     "text": "-1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      520.0,
      640.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pack-off",
     "maxclass": "newobj",
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      400.0,
      670.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-api",
     "maxclass": "comment",
     "text": "6. Stuck-note safety via the Live API: kill on transport stop, when this track's clip stops (playing_slot_index < 0), and when the device is turned off. Transport state also picks ticks or ms.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      700.0,
      160.0,
      560.0,
      34.0
     ],
     "linecount": 2,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "thisdev",
     "maxclass": "newobj",
     "text": "live.thisdevice",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "int",
      "int"
     ],
     "patching_rect": [
      700.0,
      200.0,
      100.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dev",
     "maxclass": "newobj",
     "text": "t b b b b",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "bang",
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      700.0,
      230.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-path",
     "maxclass": "message",
     "text": "path live_set",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      700.0,
      264.0,
      107.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-prop",
     "maxclass": "message",
     "text": "property is_playing",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      820.0,
      264.0,
      149.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "lpath",
     "maxclass": "newobj",
     "text": "live.path",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      700.0,
      294.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "observer",
     "maxclass": "newobj",
     "text": "live.observer",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      820.0,
      324.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-play",
     "maxclass": "newobj",
     "text": "t i i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      820.0,
      354.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "plus-state",
     "maxclass": "newobj",
     "text": "+ 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      880.0,
      384.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-stop",
     "maxclass": "newobj",
     "text": "sel 0",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      820.0,
      384.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-path2",
     "maxclass": "message",
     "text": "path this_device canonical_parent",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      960.0,
      264.0,
      247.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-prop2",
     "maxclass": "message",
     "text": "property playing_slot_index",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1000.0,
      294.0,
      205.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "lpath2",
     "maxclass": "newobj",
     "text": "live.path",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      960.0,
      324.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "observer2",
     "maxclass": "newobj",
     "text": "live.observer",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      1000.0,
      354.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-clipstop",
     "maxclass": "newobj",
     "text": "expr $i1 < 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1000.0,
      384.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-clipstop",
     "maxclass": "newobj",
     "text": "sel 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      1000.0,
      414.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-devoff",
     "maxclass": "newobj",
     "text": "sel 0",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      760.0,
      414.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-dbg",
     "maxclass": "comment",
     "text": "Debug: turn on to print note-ons (P V), note-offs (P 0), each pitch-bend value sent (bend N, 8192 = centre), the timer setting, and what ended each note to the Max console.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      700.0,
      600.0,
      420.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "dbg-toggle",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      700.0,
      624.0,
      20.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "id": "prepend",
     "maxclass": "newobj",
     "text": "prepend note",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      760.0,
      624.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-dbg",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      700.0,
      660.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "print",
     "maxclass": "newobj",
     "text": "print pitchbender",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      700.0,
      690.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "banks",
     "maxclass": "newobj",
     "text": "live.banks",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900.0,
      690.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-init",
     "maxclass": "newobj",
     "text": "t b b b b",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "bang",
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      960.0,
      200.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-loaded",
     "maxclass": "message",
     "text": "loaded v4.1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1080.0,
      230.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "print-load",
     "maxclass": "newobj",
     "text": "print pitchbender",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1080.0,
      260.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-init",
     "maxclass": "comment",
     "text": "At load: send every parameter's value into the latches (a 0 velocity would make every note-on a note-off), then print 'loaded'.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1180.0,
      200.0,
      300.0,
      34.0
     ],
     "linecount": 2,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-vel",
     "maxclass": "newobj",
     "text": "expr max(1, min(127, $i1))",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300.0,
      280.0,
      160.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pre-tms",
     "maxclass": "newobj",
     "text": "prepend timer_ms",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      860.0,
      560.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pre-tticks",
     "maxclass": "newobj",
     "text": "prepend timer_ticks",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      980.0,
      560.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-end-timer",
     "maxclass": "message",
     "text": "end timer",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      860.0,
      590.0,
      79.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-end-kill",
     "maxclass": "message",
     "text": "end kill",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      980.0,
      590.0,
      72.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-attack",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Attack",
     "patching_rect": [
      1400.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      56.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Attack",
       "parameter_shortname": "Attack",
       "parameter_type": 0,
       "parameter_unitstyle": 5,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        20.0
       ],
       "parameter_annotation_name": "Time from note-on to Peak, as a % of Trigger Length"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-peak",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Peak",
     "patching_rect": [
      1460.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      106.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Peak",
       "parameter_shortname": "Peak",
       "parameter_type": 1,
       "parameter_unitstyle": 7,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Pitch the attack rises (or falls) to, in semitones from Note"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-acurve",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Attack Curve",
     "patching_rect": [
      1520.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      156.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Attack Curve",
       "parameter_shortname": "A Curve",
       "parameter_type": 0,
       "parameter_unitstyle": 1,
       "parameter_mmin": -100.0,
       "parameter_mmax": 100.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_annotation_name": "Attack shape: -100 fast start, 0 linear, +100 slow start and fast snap"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-decay",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Decay",
     "patching_rect": [
      1580.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      206.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Decay",
       "parameter_shortname": "Decay",
       "parameter_type": 0,
       "parameter_unitstyle": 5,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        30.0
       ],
       "parameter_annotation_name": "Time from Peak to End, as a % of Trigger Length"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-end",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "End",
     "patching_rect": [
      1640.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      256.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "End",
       "parameter_shortname": "End",
       "parameter_type": 1,
       "parameter_unitstyle": 7,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Pitch the decay settles at and holds, in semitones from Note"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-dcurve",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Decay Curve",
     "patching_rect": [
      1700.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      306.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Decay Curve",
       "parameter_shortname": "D Curve",
       "parameter_type": 0,
       "parameter_unitstyle": 1,
       "parameter_mmin": -100.0,
       "parameter_mmax": 100.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_annotation_name": "Decay shape: -100 fast start, 0 linear, +100 slow start and fast snap"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-bendrange",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Bend Range",
     "patching_rect": [
      1760.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      56.0,
      92.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Bend Range",
       "parameter_shortname": "Bend Rng",
       "parameter_type": 1,
       "parameter_unitstyle": 7,
       "parameter_mmin": 1.0,
       "parameter_mmax": 96.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        48
       ],
       "parameter_annotation_name": "Per-note pitch-bend range each way, in semitones (MPE standard 48). Must match the instrument's MPE bend range.",
       "parameter_invisible": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-envelope",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "parameter_enable": 1,
     "varname": "Envelope",
     "patching_rect": [
      1820.0,
      60.0,
      15.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      216.0,
      113.0,
      15.0,
      15.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Envelope",
       "parameter_shortname": "Envelope",
       "parameter_type": 2,
       "parameter_mmax": 1.0,
       "parameter_enum": [
        "Off",
        "On"
       ],
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_annotation_name": "Pitch envelope on or off for this trigger"
      }
     }
    }
   },
   {
    "box": {
     "id": "lbl-envelope",
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Envelope",
     "patching_rect": [
      1820.0,
      40.0,
      60.0,
      18.0
     ],
     "presentation": 1,
     "presentation_rect": [
      200.0,
      95.0,
      60.0,
      18.0
     ],
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "f-att",
     "maxclass": "newobj",
     "text": "f",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1400.0,
      160.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "f-dec",
     "maxclass": "newobj",
     "text": "f",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1460.0,
      160.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "f-peak",
     "maxclass": "newobj",
     "text": "f",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1520.0,
      160.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "f-end",
     "maxclass": "newobj",
     "text": "f",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1580.0,
      160.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "f-acrv",
     "maxclass": "newobj",
     "text": "f",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1640.0,
      160.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "f-dcrv",
     "maxclass": "newobj",
     "text": "f",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1700.0,
      160.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-envon",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      1760.0,
      160.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-range",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      1820.0,
      160.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-env",
     "maxclass": "comment",
     "text": "7. Pitch envelope (Stage 4). Started from the Trigger Length lookup, so its first bend goes out before the note-on. (4) U = Trigger Length in clock units (ticks while playing, ms when stopped), (3) clock step 1 tick / 1 ms, (2) latch the envelope parameters, (1) reset the step counter, (0) send the x = 0 value and start the clock.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400.0,
      200.0,
      760.0,
      48.0
     ],
     "linecount": 3,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-env",
     "maxclass": "newobj",
     "text": "t b b b b i",
     "numinlets": 1,
     "numoutlets": 5,
     "outlettype": [
      "bang",
      "bang",
      "bang",
      "bang",
      "int"
     ],
     "patching_rect": [
      1400.0,
      250.0,
      130.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-U",
     "maxclass": "newobj",
     "text": "t i i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      1800.0,
      290.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "translate2",
     "maxclass": "newobj",
     "text": "translate ticks ms @listen 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1860.0,
      320.0,
      170.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-U",
     "maxclass": "newobj",
     "text": "expr ($i2 > 0) * $i1 + ($i2 == 0) * $f3",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1800.0,
      350.0,
      285.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-envmode",
     "maxclass": "newobj",
     "text": "gate 2 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      1700.0,
      290.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-env-ms",
     "maxclass": "message",
     "text": "delaytime 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1700.0,
      320.0,
      93.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-env-ticks",
     "maxclass": "message",
     "text": "delaytime 1 ticks",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1700.0,
      350.0,
      135.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-latch",
     "maxclass": "newobj",
     "text": "t b b b b b b b b",
     "numinlets": 1,
     "numoutlets": 8,
     "outlettype": [
      "bang",
      "bang",
      "bang",
      "bang",
      "bang",
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      1400.0,
      400.0,
      196.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-y",
     "maxclass": "newobj",
     "text": "expr $i8 * (($f1 < $f2 / max(100., $f2 + $f3)) * $f4 * pow(min($f1 / max($f2 / max(100., $f2 + $f3), 0.000001), 1.), pow(2., $f6 / 50.)) + ($f1 >= $f2 / max(100., $f2 + $f3)) * ($f1 < ($f2 + $f3) / max(100., $f2 + $f3)) * ($f4 + ($f5 - $f4) * pow(min(max(($f1 - $f2 / max(100., $f2 + $f3)) / max($f3 / max(100., $f2 + $f3), 0.000001), 0.), 1.), pow(2., $f7 / 50.))) + ($f1 >= ($f2 + $f3) / max(100., $f2 + $f3)) * $f5)",
     "numinlets": 8,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1400.0,
      560.0,
      520.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-H",
     "maxclass": "newobj",
     "text": "expr max($i1, 1)",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1820.0,
      440.0,
      159.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-sum",
     "maxclass": "newobj",
     "text": "expr min(($f1 + $f2) / 100., 1.)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1600.0,
      470.0,
      236.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-sum",
     "maxclass": "newobj",
     "text": "t f f",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1600.0,
      500.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-run",
     "maxclass": "newobj",
     "text": "expr $i1 * ($f2 > 0.)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1520.0,
      500.0,
      159.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-att",
     "maxclass": "newobj",
     "text": "t f f",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1460.0,
      440.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dec",
     "maxclass": "newobj",
     "text": "t f f",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1520.0,
      440.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-loop",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1520.0,
      530.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "dly-env",
     "maxclass": "newobj",
     "text": "delay 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      1700.0,
      400.0,
      60.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-n",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      1960.0,
      470.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-n0",
     "maxclass": "message",
     "text": "0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1960.0,
      440.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-start",
     "maxclass": "newobj",
     "text": "t b b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      2040.0,
      440.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-x0",
     "maxclass": "message",
     "text": "0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2100.0,
      470.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-tick",
     "maxclass": "newobj",
     "text": "t b b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      1700.0,
      430.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "plus-n",
     "maxclass": "newobj",
     "text": "+ 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      1960.0,
      500.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-n",
     "maxclass": "newobj",
     "text": "t i i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      1960.0,
      530.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-x",
     "maxclass": "newobj",
     "text": "expr $i1 / $f2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2040.0,
      530.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-x",
     "maxclass": "newobj",
     "text": "t f f",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      2040.0,
      500.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-done",
     "maxclass": "newobj",
     "text": "expr $f1 >= $f2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2160.0,
      500.0,
      117.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-done",
     "maxclass": "newobj",
     "text": "sel 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      2160.0,
      530.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-close",
     "maxclass": "message",
     "text": "0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2160.0,
      560.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-bend",
     "maxclass": "comment",
     "text": "8. Bend out: semitones -> 14-bit (H = Bend Range (per-note range each way), clamped to +/-H), sent only when it changes, as raw bytes (status, LSB, MSB) straight to midiout, because midiformat's bend inlet is 7-bit. Transport stop resets to centre.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400.0,
      600.0,
      760.0,
      34.0
     ],
     "linecount": 2,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-bend",
     "maxclass": "newobj",
     "text": "expr int(8192. + max(min($f1 / $f2, 1.), -1.) * 8191. + 0.5)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1400.0,
      640.0,
      432.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-bv",
     "maxclass": "newobj",
     "text": "t i i i",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "int",
      "int"
     ],
     "patching_rect": [
      1400.0,
      670.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-centre",
     "maxclass": "message",
     "text": "8192",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1600.0,
      640.0,
      44.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-chg",
     "maxclass": "newobj",
     "text": "expr $i1 != $i2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1520.0,
      700.0,
      117.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-bend",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1400.0,
      730.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-bo",
     "maxclass": "newobj",
     "text": "t i i i",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "int",
      "int"
     ],
     "patching_rect": [
      1400.0,
      760.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-st",
     "maxclass": "newobj",
     "text": "expr $i1 * 0 + 223 + $i2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1600.0,
      790.0,
      180.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-lsb",
     "maxclass": "newobj",
     "text": "expr $i1 % 128",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1500.0,
      790.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-msb",
     "maxclass": "newobj",
     "text": "expr $i1 / 128",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1400.0,
      790.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-ch1",
     "maxclass": "message",
     "text": "2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1700.0,
      760.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pre-bend",
     "maxclass": "newobj",
     "text": "prepend bend",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1500.0,
      730.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-init2",
     "maxclass": "newobj",
     "text": "t b b b b b b b b b",
     "numinlets": 1,
     "numoutlets": 9,
     "outlettype": [
      "bang",
      "bang",
      "bang",
      "bang",
      "bang",
      "bang",
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      1880.0,
      120.0,
      218.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-chn",
     "maxclass": "newobj",
     "text": "i 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      200.0,
      1000.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "plus-chn",
     "maxclass": "newobj",
     "text": "+ 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      200.0,
      1030.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-chn",
     "maxclass": "newobj",
     "text": "t i i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      200.0,
      1060.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-chn",
     "maxclass": "newobj",
     "text": "expr ($i1 % 15) + 2",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200.0,
      1090.0,
      145.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-onst",
     "maxclass": "newobj",
     "text": "expr 143 + $i1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      320.0,
      1120.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-offst",
     "maxclass": "newobj",
     "text": "expr 127 + $i1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420.0,
      1120.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-last",
     "maxclass": "message",
     "text": "-1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      520.0,
      1120.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-on-go",
     "maxclass": "newobj",
     "text": "t b b b",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      200.0,
      1200.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-on-b0",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      200.0,
      1230.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-on-b1",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      250.0,
      1230.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-on-b2",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      300.0,
      1230.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-off-go",
     "maxclass": "newobj",
     "text": "t b b b",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      400.0,
      1200.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-off-b0",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      400.0,
      1230.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-off-b1",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      450.0,
      1230.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-off-b2",
     "maxclass": "newobj",
     "text": "i 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      500.0,
      1230.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "unp-on",
     "maxclass": "newobj",
     "text": "unpack 0 0",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      200.0,
      1150.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "unp-off",
     "maxclass": "newobj",
     "text": "unpack 0 0",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      400.0,
      1150.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-onp",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      300.0,
      1170.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-offp",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      500.0,
      1170.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-mpe",
     "maxclass": "comment",
     "text": "9. MPE (v4.1). Each trigger takes the next member channel (2-16, rotating), so a ringing release tail keeps its own pitch. The device's note-on, note-off and pitch bend go out as raw bytes on that channel; the change filter resets per note so every note sends its starting bend. Everything else (incl. master-channel bend) passes through midiformat on its own channel.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      200.0,
      950.0,
      760.0,
      48.0
     ],
     "linecount": 3,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "midiin",
      0
     ],
     "destination": [
      "parse",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "parse",
      1
     ],
     "destination": [
      "format",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "parse",
      2
     ],
     "destination": [
      "format",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "parse",
      3
     ],
     "destination": [
      "format",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "parse",
      4
     ],
     "destination": [
      "format",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "parse",
      5
     ],
     "destination": [
      "format",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "parse",
      6
     ],
     "destination": [
      "format",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "parse",
      0
     ],
     "destination": [
      "unp-in",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-in",
      1
     ],
     "destination": [
      "strip",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-in",
      0
     ],
     "destination": [
      "strip",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-velocity",
      0
     ],
     "destination": [
      "i-vel",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-note",
      0
     ],
     "destination": [
      "i-note",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-length",
      0
     ],
     "destination": [
      "i-len",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-note",
      0
     ],
     "destination": [
      "t-pitch",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-pitch",
      0
     ],
     "destination": [
      "pack-on",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-len",
      0
     ],
     "destination": [
      "coll-len",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "coll-len",
      0
     ],
     "destination": [
      "gate-time",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-time",
      0
     ],
     "destination": [
      "translate",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "translate",
      0
     ],
     "destination": [
      "m-dly-ms",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-time",
      1
     ],
     "destination": [
      "m-dly-ticks",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-dly-ms",
      0
     ],
     "destination": [
      "dly",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-dly-ticks",
      0
     ],
     "destination": [
      "dly",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-trig",
      4
     ],
     "destination": [
      "t-kill",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-kill",
      1
     ],
     "destination": [
      "m-stop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-stop",
      0
     ],
     "destination": [
      "dly",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-kill",
      0
     ],
     "destination": [
      "i-sound",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dly",
      0
     ],
     "destination": [
      "i-sound",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-pitch",
      1
     ],
     "destination": [
      "i-sound",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-sound",
      0
     ],
     "destination": [
      "sel-sound",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-sound",
      1
     ],
     "destination": [
      "t-flush",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-flush",
      0
     ],
     "destination": [
      "m-none",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-none",
      0
     ],
     "destination": [
      "i-sound",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-flush",
      1
     ],
     "destination": [
      "pack-off",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "thisdev",
      0
     ],
     "destination": [
      "t-dev",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dev",
      3
     ],
     "destination": [
      "m-path",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dev",
      2
     ],
     "destination": [
      "m-prop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-path",
      0
     ],
     "destination": [
      "lpath",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lpath",
      0
     ],
     "destination": [
      "observer",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-prop",
      0
     ],
     "destination": [
      "observer",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "observer",
      0
     ],
     "destination": [
      "t-play",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-play",
      1
     ],
     "destination": [
      "plus-state",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "plus-state",
      0
     ],
     "destination": [
      "gate-time",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-play",
      0
     ],
     "destination": [
      "sel-stop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-stop",
      0
     ],
     "destination": [
      "t-kill",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dev",
      1
     ],
     "destination": [
      "m-path2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dev",
      0
     ],
     "destination": [
      "m-prop2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-path2",
      0
     ],
     "destination": [
      "lpath2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lpath2",
      0
     ],
     "destination": [
      "observer2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-prop2",
      0
     ],
     "destination": [
      "observer2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "observer2",
      0
     ],
     "destination": [
      "expr-clipstop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-clipstop",
      0
     ],
     "destination": [
      "sel-clipstop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-clipstop",
      0
     ],
     "destination": [
      "t-kill",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "thisdev",
      1
     ],
     "destination": [
      "sel-devoff",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-devoff",
      0
     ],
     "destination": [
      "t-kill",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-on",
      0
     ],
     "destination": [
      "prepend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-off",
      0
     ],
     "destination": [
      "prepend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dbg-toggle",
      0
     ],
     "destination": [
      "gate-dbg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "prepend",
      0
     ],
     "destination": [
      "gate-dbg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-dbg",
      0
     ],
     "destination": [
      "print",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "thisdev",
      0
     ],
     "destination": [
      "t-init",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init",
      3
     ],
     "destination": [
      "obj-length",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init",
      2
     ],
     "destination": [
      "obj-velocity",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init",
      1
     ],
     "destination": [
      "obj-note",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init",
      0
     ],
     "destination": [
      "m-loaded",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-loaded",
      0
     ],
     "destination": [
      "print-load",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-vel",
      0
     ],
     "destination": [
      "expr-vel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-vel",
      0
     ],
     "destination": [
      "pack-on",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "translate",
      0
     ],
     "destination": [
      "pre-tms",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pre-tms",
      0
     ],
     "destination": [
      "gate-dbg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-time",
      1
     ],
     "destination": [
      "pre-tticks",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pre-tticks",
      0
     ],
     "destination": [
      "gate-dbg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dly",
      0
     ],
     "destination": [
      "m-end-timer",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-end-timer",
      0
     ],
     "destination": [
      "gate-dbg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-kill",
      0
     ],
     "destination": [
      "m-end-kill",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-end-kill",
      0
     ],
     "destination": [
      "gate-dbg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "format",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "strip",
      0
     ],
     "destination": [
      "t-trig",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-attack",
      0
     ],
     "destination": [
      "f-att",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-decay",
      0
     ],
     "destination": [
      "f-dec",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-peak",
      0
     ],
     "destination": [
      "f-peak",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-end",
      0
     ],
     "destination": [
      "f-end",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-acurve",
      0
     ],
     "destination": [
      "f-acrv",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-dcurve",
      0
     ],
     "destination": [
      "f-dcrv",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-envelope",
      0
     ],
     "destination": [
      "i-envon",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-bendrange",
      0
     ],
     "destination": [
      "i-range",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-trig",
      2
     ],
     "destination": [
      "i-len",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-trig",
      1
     ],
     "destination": [
      "i-vel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-trig",
      0
     ],
     "destination": [
      "i-note",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "coll-len",
      0
     ],
     "destination": [
      "t-env",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-env",
      4
     ],
     "destination": [
      "t-U",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-U",
      1
     ],
     "destination": [
      "translate2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "translate2",
      0
     ],
     "destination": [
      "expr-U",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-U",
      0
     ],
     "destination": [
      "expr-U",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "observer",
      0
     ],
     "destination": [
      "expr-U",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-env",
      3
     ],
     "destination": [
      "gate-envmode",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "plus-state",
      0
     ],
     "destination": [
      "gate-envmode",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-envmode",
      0
     ],
     "destination": [
      "m-env-ms",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-envmode",
      1
     ],
     "destination": [
      "m-env-ticks",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-env",
      2
     ],
     "destination": [
      "t-latch",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-latch",
      7
     ],
     "destination": [
      "i-range",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-range",
      0
     ],
     "destination": [
      "expr-H",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-latch",
      6
     ],
     "destination": [
      "f-acrv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f-acrv",
      0
     ],
     "destination": [
      "expr-y",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-latch",
      5
     ],
     "destination": [
      "f-dcrv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f-dcrv",
      0
     ],
     "destination": [
      "expr-y",
      6
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-latch",
      4
     ],
     "destination": [
      "f-peak",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f-peak",
      0
     ],
     "destination": [
      "expr-y",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-latch",
      3
     ],
     "destination": [
      "f-end",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f-end",
      0
     ],
     "destination": [
      "expr-y",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-latch",
      2
     ],
     "destination": [
      "f-dec",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f-dec",
      0
     ],
     "destination": [
      "t-dec",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dec",
      1
     ],
     "destination": [
      "expr-y",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dec",
      0
     ],
     "destination": [
      "expr-sum",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-latch",
      1
     ],
     "destination": [
      "f-att",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f-att",
      0
     ],
     "destination": [
      "t-att",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-att",
      1
     ],
     "destination": [
      "expr-y",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-att",
      0
     ],
     "destination": [
      "expr-sum",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-sum",
      0
     ],
     "destination": [
      "t-sum",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-latch",
      0
     ],
     "destination": [
      "i-envon",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-envon",
      0
     ],
     "destination": [
      "expr-y",
      7
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-envon",
      0
     ],
     "destination": [
      "expr-run",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-run",
      0
     ],
     "destination": [
      "gate-loop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-env-ms",
      0
     ],
     "destination": [
      "dly-env",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-env-ticks",
      0
     ],
     "destination": [
      "dly-env",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-loop",
      0
     ],
     "destination": [
      "dly-env",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-stop",
      0
     ],
     "destination": [
      "dly-env",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-env",
      1
     ],
     "destination": [
      "m-n0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-n0",
      0
     ],
     "destination": [
      "i-n",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-env",
      0
     ],
     "destination": [
      "t-start",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-start",
      1
     ],
     "destination": [
      "m-x0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-x0",
      0
     ],
     "destination": [
      "expr-y",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-start",
      0
     ],
     "destination": [
      "gate-loop",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dly-env",
      0
     ],
     "destination": [
      "t-tick",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-tick",
      1
     ],
     "destination": [
      "i-n",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-n",
      0
     ],
     "destination": [
      "plus-n",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "plus-n",
      0
     ],
     "destination": [
      "t-n",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-n",
      1
     ],
     "destination": [
      "i-n",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-n",
      0
     ],
     "destination": [
      "expr-x",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-U",
      0
     ],
     "destination": [
      "expr-x",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-x",
      0
     ],
     "destination": [
      "t-x",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sum",
      1
     ],
     "destination": [
      "expr-done",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sum",
      0
     ],
     "destination": [
      "expr-run",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-x",
      1
     ],
     "destination": [
      "expr-done",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-done",
      0
     ],
     "destination": [
      "sel-done",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-done",
      0
     ],
     "destination": [
      "m-close",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-close",
      0
     ],
     "destination": [
      "gate-loop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-x",
      0
     ],
     "destination": [
      "expr-y",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-tick",
      0
     ],
     "destination": [
      "gate-loop",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-y",
      0
     ],
     "destination": [
      "expr-bend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-H",
      0
     ],
     "destination": [
      "expr-bend",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-bend",
      0
     ],
     "destination": [
      "t-bv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-stop",
      0
     ],
     "destination": [
      "m-centre",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-centre",
      0
     ],
     "destination": [
      "t-bv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bv",
      2
     ],
     "destination": [
      "expr-chg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-chg",
      0
     ],
     "destination": [
      "gate-bend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bv",
      1
     ],
     "destination": [
      "gate-bend",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bv",
      0
     ],
     "destination": [
      "expr-chg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-bend",
      0
     ],
     "destination": [
      "t-bo",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bo",
      2
     ],
     "destination": [
      "expr-st",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bo",
      1
     ],
     "destination": [
      "expr-lsb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bo",
      0
     ],
     "destination": [
      "expr-msb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-st",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-lsb",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-msb",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ch1",
      0
     ],
     "destination": [
      "expr-st",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-bend",
      0
     ],
     "destination": [
      "pre-bend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pre-bend",
      0
     ],
     "destination": [
      "gate-dbg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "thisdev",
      0
     ],
     "destination": [
      "t-init2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      1
     ],
     "destination": [
      "obj-attack",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      2
     ],
     "destination": [
      "obj-decay",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      3
     ],
     "destination": [
      "obj-peak",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      4
     ],
     "destination": [
      "obj-end",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      5
     ],
     "destination": [
      "obj-acurve",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      6
     ],
     "destination": [
      "obj-dcurve",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      7
     ],
     "destination": [
      "obj-envelope",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      8
     ],
     "destination": [
      "obj-bendrange",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init2",
      0
     ],
     "destination": [
      "m-ch1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-trig",
      3
     ],
     "destination": [
      "i-chn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-chn",
      0
     ],
     "destination": [
      "plus-chn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "plus-chn",
      0
     ],
     "destination": [
      "t-chn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-chn",
      1
     ],
     "destination": [
      "i-chn",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-chn",
      0
     ],
     "destination": [
      "expr-chn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-chn",
      0
     ],
     "destination": [
      "expr-st",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-chn",
      0
     ],
     "destination": [
      "expr-onst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-chn",
      0
     ],
     "destination": [
      "expr-offst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ch1",
      0
     ],
     "destination": [
      "expr-onst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ch1",
      0
     ],
     "destination": [
      "expr-offst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-chn",
      0
     ],
     "destination": [
      "m-last",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-last",
      0
     ],
     "destination": [
      "expr-chg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-on-go",
      2
     ],
     "destination": [
      "s-on-b0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-on-b0",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-on-go",
      1
     ],
     "destination": [
      "s-on-b1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-on-b1",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-on-go",
      0
     ],
     "destination": [
      "s-on-b2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-on-b2",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-off-go",
      2
     ],
     "destination": [
      "s-off-b0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-off-b0",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-off-go",
      1
     ],
     "destination": [
      "s-off-b1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-off-b1",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-off-go",
      0
     ],
     "destination": [
      "s-off-b2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-off-b2",
      0
     ],
     "destination": [
      "midiout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-onst",
      0
     ],
     "destination": [
      "s-on-b0",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-offst",
      0
     ],
     "destination": [
      "s-off-b0",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-on",
      0
     ],
     "destination": [
      "unp-on",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-off",
      0
     ],
     "destination": [
      "unp-off",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-on",
      1
     ],
     "destination": [
      "s-on-b2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-on",
      0
     ],
     "destination": [
      "t-onp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-onp",
      1
     ],
     "destination": [
      "s-on-b1",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-onp",
      0
     ],
     "destination": [
      "s-on-go",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-off",
      0
     ],
     "destination": [
      "t-offp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-offp",
      1
     ],
     "destination": [
      "s-off-b1",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-offp",
      0
     ],
     "destination": [
      "s-off-go",
      0
     ]
    }
   }
  ],
  "parameters": {
   "obj-note": [
    "Note",
    "Note",
    0
   ],
   "obj-length": [
    "Trigger Length",
    "Length",
    0
   ],
   "obj-velocity": [
    "Velocity",
    "Velocity",
    0
   ],
   "parameterbanks": {
    "0": {
     "index": 0,
     "name": "Pitch",
     "parameters": [
      "Note",
      "Trigger Length",
      "Attack",
      "Peak",
      "Attack Curve",
      "Decay",
      "End",
      "Decay Curve"
     ]
    },
    "1": {
     "index": 1,
     "name": "Perform",
     "parameters": [
      "Velocity",
      "Envelope",
      "-",
      "-",
      "-",
      "-",
      "-",
      "-"
     ]
    },
    "2": {
     "index": 2,
     "name": "Setup",
     "parameters": [
      "-",
      "-",
      "Bend Range",
      "-",
      "-",
      "-",
      "-",
      "-"
     ]
    }
   },
   "inherited_shortname": 1,
   "obj-attack": [
    "Attack",
    "Attack",
    0
   ],
   "obj-peak": [
    "Peak",
    "Peak",
    0
   ],
   "obj-acurve": [
    "Attack Curve",
    "A Curve",
    0
   ],
   "obj-decay": [
    "Decay",
    "Decay",
    0
   ],
   "obj-end": [
    "End",
    "End",
    0
   ],
   "obj-dcurve": [
    "Decay Curve",
    "D Curve",
    0
   ],
   "obj-bendrange": [
    "Bend Range",
    "Bend Rng",
    0
   ],
   "obj-envelope": [
    "Envelope",
    "Envelope",
    0
   ]
  },
  "dependency_cache": [],
  "latency": 0,
  "is_mpe": 1,
  "project": {
   "version": 1,
   "creationdate": 3590052786,
   "modificationdate": 3590052786,
   "viewrect": [
    0.0,
    0.0,
    300.0,
    500.0
   ],
   "autoorganize": 1,
   "hideprojectwindow": 1,
   "showdependencies": 1,
   "autolocalize": 0,
   "contents": {
    "patchers": {}
   },
   "layout": {},
   "searchpath": {},
   "detailsvisible": 0,
   "amxdtype": 1835887981,
   "readonly": 0,
   "devpathtype": 0,
   "devpath": ".",
   "sortmode": 0,
   "viewmode": 0
  },
  "autosave": 0
 }
}
