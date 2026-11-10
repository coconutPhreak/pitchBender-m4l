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
   190.0,
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
  "devicewidth": 190.0,
  "description": "Mono pitch-envelope MIDI effect for bass lines (Stage 1: note trigger and stuck-note safety).",
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
     "text": "PITCHBENDER v1.2 (Stage 1): placeholder notes trigger the device's own Note for Trigger Length. All timing in the Max scheduler, no JS. Only object classes that passed retrig-m4l's Push standalone probes.",
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
      20.0,
      210.0,
      110.0,
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
     "text": "Right to left: (3) kill the sounding note, (2) velocity, (1) Note -> note-on, (0) start the Trigger Length timer. Parameters are read here, at the trigger (latched for this note).",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      140.0,
      210.0,
      620.0,
      34.0
     ],
     "linecount": 2,
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
      40.0,
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
      56.0,
      22.0,
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
      22.0,
      60.0,
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
     "text": "PITCHBENDER v1.2",
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
     "text": "Debug: turn on to print note-ons (P V), note-offs (P 0), the timer setting, and what ended each note (timer or kill) to the Max console.",
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
     "text": "loaded v1.2",
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
      "t-trig",
      2
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
      1
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
      "t-trig",
      0
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
      "pack-on",
      0
     ],
     "destination": [
      "format",
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
      3
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
      "pack-off",
      0
     ],
     "destination": [
      "format",
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
      "-",
      "-",
      "-",
      "-",
      "-",
      "-"
     ]
    },
    "1": {
     "index": 1,
     "name": "Perform",
     "parameters": [
      "Velocity",
      "-",
      "-",
      "-",
      "-",
      "-",
      "-",
      "-"
     ]
    }
   },
   "inherited_shortname": 1
  },
  "dependency_cache": [],
  "latency": 0,
  "is_mpe": 0,
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
