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
   706.0,
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
  "devicewidth": 706.0,
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
     "text": "PITCHBENDER v1.1 (Tilt Env, MPE): placeholder notes trigger the device's own Note for Trigger Length. All timing in the Max scheduler, no JS. Only object classes that passed retrig-m4l's Push standalone probes.",
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
      20.0,
      210.0,
      210.0,
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
     "text": "Right to left: (8) kill the sounding note, (7) next MPE channel, (6) Trigger Length: note timer and pitch envelope, whose first bend goes out now, (5) Slide envelope start (latched, v7), (4) Pressure, (3) Breath, (2) velocity, (1) Note -> note-on, (0) Slide start value and Pressure again, after the note-on (v6.2: with overlapping notes the instrument ignored values sent before the note-on). Parameters are read here (latched for this note). No deferral: Stage 2 found a step's p-lock always lands before its note.",
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
        "1/64",
        "1/32",
        "0.750",
        "1/16",
        "1.25",
        "1.50",
        "1.75",
        "1/8",
        "2.25",
        "2.50",
        "2.75",
        "3.00",
        "3.25",
        "3.50",
        "3.75",
        "1/4",
        "4.25",
        "4.50",
        "4.75",
        "5.00",
        "5.25",
        "5.50",
        "5.75",
        "6.00",
        "6.25",
        "6.50",
        "6.75",
        "7.00",
        "7.25",
        "7.50",
        "7.75",
        "1/2",
        "8.50",
        "9.00",
        "9.50",
        "10.0",
        "10.5",
        "11.0",
        "11.5",
        "12.0",
        "12.5",
        "13.0",
        "13.5",
        "14.0",
        "14.5",
        "15.0",
        "15.5",
        "1/1",
        "17.0",
        "18.0",
        "19.0",
        "20.0",
        "21.0",
        "22.0",
        "23.0",
        "24.0",
        "25.0",
        "26.0",
        "27.0",
        "28.0",
        "29.0",
        "30.0",
        "31.0",
        "32.0"
       ],
       "parameter_mmax": 63.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        3
       ],
       "parameter_annotation_name": "How long the device's note lasts, in steps (1/16 = 1 step), synced to Live's tempo: 0.25-8 in 0.25 steps, 8-16 in 0.5, 16-32 in 1"
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
     "text": "PITCHBENDER v1.1",
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
      "count": 64,
      "data": [
       {
        "key": 0,
        "value": [
         30
        ]
       },
       {
        "key": 1,
        "value": [
         60
        ]
       },
       {
        "key": 2,
        "value": [
         90
        ]
       },
       {
        "key": 3,
        "value": [
         120
        ]
       },
       {
        "key": 4,
        "value": [
         150
        ]
       },
       {
        "key": 5,
        "value": [
         180
        ]
       },
       {
        "key": 6,
        "value": [
         210
        ]
       },
       {
        "key": 7,
        "value": [
         240
        ]
       },
       {
        "key": 8,
        "value": [
         270
        ]
       },
       {
        "key": 9,
        "value": [
         300
        ]
       },
       {
        "key": 10,
        "value": [
         330
        ]
       },
       {
        "key": 11,
        "value": [
         360
        ]
       },
       {
        "key": 12,
        "value": [
         390
        ]
       },
       {
        "key": 13,
        "value": [
         420
        ]
       },
       {
        "key": 14,
        "value": [
         450
        ]
       },
       {
        "key": 15,
        "value": [
         480
        ]
       },
       {
        "key": 16,
        "value": [
         510
        ]
       },
       {
        "key": 17,
        "value": [
         540
        ]
       },
       {
        "key": 18,
        "value": [
         570
        ]
       },
       {
        "key": 19,
        "value": [
         600
        ]
       },
       {
        "key": 20,
        "value": [
         630
        ]
       },
       {
        "key": 21,
        "value": [
         660
        ]
       },
       {
        "key": 22,
        "value": [
         690
        ]
       },
       {
        "key": 23,
        "value": [
         720
        ]
       },
       {
        "key": 24,
        "value": [
         750
        ]
       },
       {
        "key": 25,
        "value": [
         780
        ]
       },
       {
        "key": 26,
        "value": [
         810
        ]
       },
       {
        "key": 27,
        "value": [
         840
        ]
       },
       {
        "key": 28,
        "value": [
         870
        ]
       },
       {
        "key": 29,
        "value": [
         900
        ]
       },
       {
        "key": 30,
        "value": [
         930
        ]
       },
       {
        "key": 31,
        "value": [
         960
        ]
       },
       {
        "key": 32,
        "value": [
         1020
        ]
       },
       {
        "key": 33,
        "value": [
         1080
        ]
       },
       {
        "key": 34,
        "value": [
         1140
        ]
       },
       {
        "key": 35,
        "value": [
         1200
        ]
       },
       {
        "key": 36,
        "value": [
         1260
        ]
       },
       {
        "key": 37,
        "value": [
         1320
        ]
       },
       {
        "key": 38,
        "value": [
         1380
        ]
       },
       {
        "key": 39,
        "value": [
         1440
        ]
       },
       {
        "key": 40,
        "value": [
         1500
        ]
       },
       {
        "key": 41,
        "value": [
         1560
        ]
       },
       {
        "key": 42,
        "value": [
         1620
        ]
       },
       {
        "key": 43,
        "value": [
         1680
        ]
       },
       {
        "key": 44,
        "value": [
         1740
        ]
       },
       {
        "key": 45,
        "value": [
         1800
        ]
       },
       {
        "key": 46,
        "value": [
         1860
        ]
       },
       {
        "key": 47,
        "value": [
         1920
        ]
       },
       {
        "key": 48,
        "value": [
         2040
        ]
       },
       {
        "key": 49,
        "value": [
         2160
        ]
       },
       {
        "key": 50,
        "value": [
         2280
        ]
       },
       {
        "key": 51,
        "value": [
         2400
        ]
       },
       {
        "key": 52,
        "value": [
         2520
        ]
       },
       {
        "key": 53,
        "value": [
         2640
        ]
       },
       {
        "key": 54,
        "value": [
         2760
        ]
       },
       {
        "key": 55,
        "value": [
         2880
        ]
       },
       {
        "key": 56,
        "value": [
         3000
        ]
       },
       {
        "key": 57,
        "value": [
         3120
        ]
       },
       {
        "key": 58,
        "value": [
         3240
        ]
       },
       {
        "key": 59,
        "value": [
         3360
        ]
       },
       {
        "key": 60,
        "value": [
         3480
        ]
       },
       {
        "key": 61,
        "value": [
         3600
        ]
       },
       {
        "key": 62,
        "value": [
         3720
        ]
       },
       {
        "key": 63,
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
     "text": "Debug: turn on to print note-ons (P V), note-offs (P 0), each pitch-bend value sent (bend N, 8192 = centre), each Slide value sent (slide N), every incoming pitch bend with its channel (in_bend_ch_val C V), the timer setting, and what ended each note to the Max console.",
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
     "text": "loaded v1.1",
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
       "parameter_unitstyle": 0,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Pitch the attack rises (or falls) to, in scale degrees from Note (semitones with Scale off or Live's scale mode off)"
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
      256.0,
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
      156.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "End",
       "parameter_shortname": "End",
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Pitch the decay settles at and holds, in scale degrees from Note (semitones with Scale off or Live's scale mode off)"
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
      6.0,
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
       "parameter_annotation_name": "Per-note pitch-bend range each way, in semitones (MPE standard 48). Must match the instrument's MPE bend range. Setup value: avoid p-locking it."
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
     "text": "expr $i8 * (($f1 < $f2 / 100.) * $f4 * pow(min($f1 / max($f2 / 100., 0.000001), 1.), pow(2., $f6 / 50.)) + ($f1 >= $f2 / 100.) * ($f1 < ($f2 + $f3) / 100.) * ($f4 + ($f5 - $f4) * pow(min(max(($f1 - $f2 / 100.) / max($f3 / 100., 0.000001), 0.), 1.), pow(2., $f7 / 50.))) + ($f1 >= ($f2 + $f3) / 100.) * (($f3 > 0.) * $f5 + ($f3 <= 0.) * $f4))",
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
     "text": "t b b b b b b b b b b",
     "numinlets": 1,
     "numoutlets": 10,
     "outlettype": [
      "bang",
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
   },
   {
    "box": {
     "id": "c-scale",
     "maxclass": "comment",
     "text": "10. Scale awareness (Stage 5). Live API: live_set root_note, scale_intervals, scale_mode. On every scale change, uzi walks MIDI notes 0-127 and fills ---scl (index -> scale note, ascending) and ---idx (MIDI note -> index of the nearest scale note at or below it). With Scale on, Live's scale mode on and a scale loaded: Note snaps down to scl[idx[Note]], and Peak/End are degrees from it: scl[idx + degree] - snapped (clamped to the table). Otherwise plain semitones. The same calculation feeds the trigger (latched into the envelope and note-on) and the Peak/End note labels.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2400.0,
      40.0,
      900.0,
      62.0
     ],
     "linecount": 4,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-scale",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "parameter_enable": 1,
     "varname": "Scale",
     "patching_rect": [
      2400.0,
      140.0,
      15.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      282.0,
      113.0,
      15.0,
      15.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Scale",
       "parameter_shortname": "Scale",
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
       "parameter_annotation_name": "On: Note snaps to Live's scale and Peak/End are scale degrees. Off: plain semitones. Setup value: avoid p-locking it."
      }
     }
    }
   },
   {
    "box": {
     "id": "lbl-scale",
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Scale",
     "patching_rect": [
      2400.0,
      120.0,
      40.0,
      18.0
     ],
     "presentation": 1,
     "presentation_rect": [
      270.0,
      95.0,
      40.0,
      18.0
     ],
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "lbl-peaknote",
     "maxclass": "comment",
     "text": "-",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2600.0,
      120.0,
      44.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0,
     "presentation": 1,
     "presentation_rect": [
      106.0,
      70.0,
      44.0,
      18.0
     ],
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "lbl-endnote",
     "maxclass": "comment",
     "text": "-",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2600.0,
      120.0,
      44.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0,
     "presentation": 1,
     "presentation_rect": [
      256.0,
      70.0,
      44.0,
      18.0
     ],
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "t-sinit",
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
      2400.0,
      180.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-obs-root",
     "maxclass": "message",
     "text": "property root_note",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2400.0,
      210.0,
      142.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obs-root",
     "maxclass": "newobj",
     "text": "live.observer",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      2400.0,
      240.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-obs-ivl",
     "maxclass": "message",
     "text": "property scale_intervals",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2560.0,
      210.0,
      184.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obs-ivl",
     "maxclass": "newobj",
     "text": "live.observer",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      2560.0,
      240.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-obs-mode",
     "maxclass": "message",
     "text": "property scale_mode",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2720.0,
      210.0,
      149.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obs-mode",
     "maxclass": "newobj",
     "text": "live.observer",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      2720.0,
      240.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-ivl",
     "maxclass": "newobj",
     "text": "t b l b",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "",
      "bang"
     ],
     "patching_rect": [
      2560.0,
      270.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-mask0",
     "maxclass": "message",
     "text": "0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2560.0,
      300.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "acc-mask",
     "maxclass": "newobj",
     "text": "+ 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      2560.0,
      370.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "unp-ivl",
     "maxclass": "newobj",
     "text": "unpack 0 0 0 0 0 0 0 0 0 0 0 0",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "int",
      "int",
      "int",
      "int",
      "int",
      "int",
      "int",
      "int",
      "int",
      "int",
      "int",
      "int"
     ],
     "patching_rect": [
      2560.0,
      330.0,
      300.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-bit",
     "maxclass": "newobj",
     "text": "expr int(pow(2, $i1 % 12))",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2560.0,
      350.0,
      194.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-in",
     "maxclass": "newobj",
     "text": "expr ($i2 / int(pow(2, ($i1 - $i3 + 120) % 12))) % 2",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2600.0,
      500.0,
      376.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "rb",
     "maxclass": "newobj",
     "text": "t b",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      2560.0,
      400.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-root",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      2400.0,
      270.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-rb",
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
      2400.0,
      430.0,
      108.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-clear",
     "maxclass": "message",
     "text": "clear",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2400.0,
      460.0,
      51.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "coll-scl",
     "maxclass": "newobj",
     "text": "coll ---scl",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      2400.0,
      660.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "coll-idx",
     "maxclass": "newobj",
     "text": "coll ---idx",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      2540.0,
      660.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-cnt",
     "maxclass": "newobj",
     "text": "i 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      2800.0,
      560.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-cnt0",
     "maxclass": "message",
     "text": "0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2800.0,
      460.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "uzi",
     "maxclass": "newobj",
     "text": "uzi 128",
     "numinlets": 2,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      "int"
     ],
     "patching_rect": [
      2480.0,
      460.0,
      60.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-p",
     "maxclass": "newobj",
     "text": "expr $i1 - 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2480.0,
      490.0,
      96.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-p",
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
      2480.0,
      520.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pack-scl",
     "maxclass": "newobj",
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2400.0,
      630.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-in",
     "maxclass": "newobj",
     "text": "sel 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      2600.0,
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
     "id": "t-ci",
     "maxclass": "newobj",
     "text": "t i i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      2800.0,
      590.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-ci",
     "maxclass": "newobj",
     "text": "gate 2 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      2800.0,
      620.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "plus-cnt",
     "maxclass": "newobj",
     "text": "+ 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      2880.0,
      650.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-add",
     "maxclass": "message",
     "text": "2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2660.0,
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
     "id": "m-read",
     "maxclass": "message",
     "text": "1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2700.0,
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
     "id": "t-add",
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
      2600.0,
      560.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-pi",
     "maxclass": "newobj",
     "text": "t i b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "bang"
     ],
     "patching_rect": [
      2480.0,
      680.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pack-idx",
     "maxclass": "newobj",
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2540.0,
      630.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-last",
     "maxclass": "newobj",
     "text": "expr max($i1 - 1, 0)",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2800.0,
      680.0,
      152.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-cnt",
     "maxclass": "newobj",
     "text": "t b b i",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      "int"
     ],
     "patching_rect": [
      2960.0,
      560.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-cnt2",
     "maxclass": "newobj",
     "text": "i 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      2960.0,
      520.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-act",
     "maxclass": "newobj",
     "text": "expr ($i1 != 0) * ($i2 != 0) * ($i3 > 0) + 1",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2960.0,
      740.0,
      320.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dS",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      3100.0,
      200.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dM",
     "maxclass": "newobj",
     "text": "t b b i",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      "int"
     ],
     "patching_rect": [
      2720.0,
      270.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-bang",
     "maxclass": "message",
     "text": "bang",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2780.0,
      740.0,
      44.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-sN",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      3300.0,
      800.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-sP",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      3400.0,
      800.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-sE",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      3460.0,
      800.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "disp",
     "maxclass": "newobj",
     "text": "t b",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      3300.0,
      770.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-scl",
     "maxclass": "newobj",
     "text": "gate 2 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      3300.0,
      830.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "o-note",
     "maxclass": "newobj",
     "text": "t i",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      3300.0,
      1000.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "o-peak",
     "maxclass": "newobj",
     "text": "t i",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      3400.0,
      1000.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "o-end",
     "maxclass": "newobj",
     "text": "t i",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      3500.0,
      1000.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-plain",
     "maxclass": "newobj",
     "text": "t b b i",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      "int"
     ],
     "patching_rect": [
      3300.0,
      870.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "coll-idx-r",
     "maxclass": "newobj",
     "text": "coll ---idx",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      3600.0,
      830.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-i0",
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
      3600.0,
      860.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "coll-scl-n",
     "maxclass": "newobj",
     "text": "coll ---scl",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      3600.0,
      900.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-sn",
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
      3600.0,
      930.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-pk",
     "maxclass": "newobj",
     "text": "expr $i1 - $i2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3740.0,
      960.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-en",
     "maxclass": "newobj",
     "text": "expr $i1 - $i2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3880.0,
      960.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-clP",
     "maxclass": "newobj",
     "text": "expr max(0, min($i1 + $i2, $i3 - 1))",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3740.0,
      870.0,
      264.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-clE",
     "maxclass": "newobj",
     "text": "expr max(0, min($i1 + $i2, $i3 - 1))",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3880.0,
      870.0,
      264.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "coll-scl-p",
     "maxclass": "newobj",
     "text": "coll ---scl",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      3740.0,
      900.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "coll-scl-e",
     "maxclass": "newobj",
     "text": "coll ---scl",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      3880.0,
      900.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dN",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      3300.0,
      740.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dP",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      3400.0,
      740.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dE",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      3500.0,
      740.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-onote",
     "maxclass": "newobj",
     "text": "gate 2 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      3300.0,
      1030.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-opeak",
     "maxclass": "newobj",
     "text": "gate 2 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      3400.0,
      1030.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-oend",
     "maxclass": "newobj",
     "text": "gate 2 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      3500.0,
      1030.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-ctx",
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
      3100.0,
      1080.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-ctx2",
     "maxclass": "message",
     "text": "2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3180.0,
      1110.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-ctx1",
     "maxclass": "message",
     "text": "1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3100.0,
      1110.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-dpk",
     "maxclass": "newobj",
     "text": "expr max(0, min(127, $i1 + $i2))",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3400.0,
      1070.0,
      236.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-den",
     "maxclass": "newobj",
     "text": "expr max(0, min(127, $i1 + $i2))",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3500.0,
      1070.0,
      236.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "coll-names",
     "maxclass": "newobj",
     "text": "coll ---names",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      3400.0,
      1100.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0,
     "saved_object_attributes": {
      "embed": 1,
      "precision": 6
     },
     "coll_data": {
      "count": 128,
      "data": [
       {
        "key": 0,
        "value": [
         "C-2"
        ]
       },
       {
        "key": 1,
        "value": [
         "C#-2"
        ]
       },
       {
        "key": 2,
        "value": [
         "D-2"
        ]
       },
       {
        "key": 3,
        "value": [
         "D#-2"
        ]
       },
       {
        "key": 4,
        "value": [
         "E-2"
        ]
       },
       {
        "key": 5,
        "value": [
         "F-2"
        ]
       },
       {
        "key": 6,
        "value": [
         "F#-2"
        ]
       },
       {
        "key": 7,
        "value": [
         "G-2"
        ]
       },
       {
        "key": 8,
        "value": [
         "G#-2"
        ]
       },
       {
        "key": 9,
        "value": [
         "A-2"
        ]
       },
       {
        "key": 10,
        "value": [
         "A#-2"
        ]
       },
       {
        "key": 11,
        "value": [
         "B-2"
        ]
       },
       {
        "key": 12,
        "value": [
         "C-1"
        ]
       },
       {
        "key": 13,
        "value": [
         "C#-1"
        ]
       },
       {
        "key": 14,
        "value": [
         "D-1"
        ]
       },
       {
        "key": 15,
        "value": [
         "D#-1"
        ]
       },
       {
        "key": 16,
        "value": [
         "E-1"
        ]
       },
       {
        "key": 17,
        "value": [
         "F-1"
        ]
       },
       {
        "key": 18,
        "value": [
         "F#-1"
        ]
       },
       {
        "key": 19,
        "value": [
         "G-1"
        ]
       },
       {
        "key": 20,
        "value": [
         "G#-1"
        ]
       },
       {
        "key": 21,
        "value": [
         "A-1"
        ]
       },
       {
        "key": 22,
        "value": [
         "A#-1"
        ]
       },
       {
        "key": 23,
        "value": [
         "B-1"
        ]
       },
       {
        "key": 24,
        "value": [
         "C0"
        ]
       },
       {
        "key": 25,
        "value": [
         "C#0"
        ]
       },
       {
        "key": 26,
        "value": [
         "D0"
        ]
       },
       {
        "key": 27,
        "value": [
         "D#0"
        ]
       },
       {
        "key": 28,
        "value": [
         "E0"
        ]
       },
       {
        "key": 29,
        "value": [
         "F0"
        ]
       },
       {
        "key": 30,
        "value": [
         "F#0"
        ]
       },
       {
        "key": 31,
        "value": [
         "G0"
        ]
       },
       {
        "key": 32,
        "value": [
         "G#0"
        ]
       },
       {
        "key": 33,
        "value": [
         "A0"
        ]
       },
       {
        "key": 34,
        "value": [
         "A#0"
        ]
       },
       {
        "key": 35,
        "value": [
         "B0"
        ]
       },
       {
        "key": 36,
        "value": [
         "C1"
        ]
       },
       {
        "key": 37,
        "value": [
         "C#1"
        ]
       },
       {
        "key": 38,
        "value": [
         "D1"
        ]
       },
       {
        "key": 39,
        "value": [
         "D#1"
        ]
       },
       {
        "key": 40,
        "value": [
         "E1"
        ]
       },
       {
        "key": 41,
        "value": [
         "F1"
        ]
       },
       {
        "key": 42,
        "value": [
         "F#1"
        ]
       },
       {
        "key": 43,
        "value": [
         "G1"
        ]
       },
       {
        "key": 44,
        "value": [
         "G#1"
        ]
       },
       {
        "key": 45,
        "value": [
         "A1"
        ]
       },
       {
        "key": 46,
        "value": [
         "A#1"
        ]
       },
       {
        "key": 47,
        "value": [
         "B1"
        ]
       },
       {
        "key": 48,
        "value": [
         "C2"
        ]
       },
       {
        "key": 49,
        "value": [
         "C#2"
        ]
       },
       {
        "key": 50,
        "value": [
         "D2"
        ]
       },
       {
        "key": 51,
        "value": [
         "D#2"
        ]
       },
       {
        "key": 52,
        "value": [
         "E2"
        ]
       },
       {
        "key": 53,
        "value": [
         "F2"
        ]
       },
       {
        "key": 54,
        "value": [
         "F#2"
        ]
       },
       {
        "key": 55,
        "value": [
         "G2"
        ]
       },
       {
        "key": 56,
        "value": [
         "G#2"
        ]
       },
       {
        "key": 57,
        "value": [
         "A2"
        ]
       },
       {
        "key": 58,
        "value": [
         "A#2"
        ]
       },
       {
        "key": 59,
        "value": [
         "B2"
        ]
       },
       {
        "key": 60,
        "value": [
         "C3"
        ]
       },
       {
        "key": 61,
        "value": [
         "C#3"
        ]
       },
       {
        "key": 62,
        "value": [
         "D3"
        ]
       },
       {
        "key": 63,
        "value": [
         "D#3"
        ]
       },
       {
        "key": 64,
        "value": [
         "E3"
        ]
       },
       {
        "key": 65,
        "value": [
         "F3"
        ]
       },
       {
        "key": 66,
        "value": [
         "F#3"
        ]
       },
       {
        "key": 67,
        "value": [
         "G3"
        ]
       },
       {
        "key": 68,
        "value": [
         "G#3"
        ]
       },
       {
        "key": 69,
        "value": [
         "A3"
        ]
       },
       {
        "key": 70,
        "value": [
         "A#3"
        ]
       },
       {
        "key": 71,
        "value": [
         "B3"
        ]
       },
       {
        "key": 72,
        "value": [
         "C4"
        ]
       },
       {
        "key": 73,
        "value": [
         "C#4"
        ]
       },
       {
        "key": 74,
        "value": [
         "D4"
        ]
       },
       {
        "key": 75,
        "value": [
         "D#4"
        ]
       },
       {
        "key": 76,
        "value": [
         "E4"
        ]
       },
       {
        "key": 77,
        "value": [
         "F4"
        ]
       },
       {
        "key": 78,
        "value": [
         "F#4"
        ]
       },
       {
        "key": 79,
        "value": [
         "G4"
        ]
       },
       {
        "key": 80,
        "value": [
         "G#4"
        ]
       },
       {
        "key": 81,
        "value": [
         "A4"
        ]
       },
       {
        "key": 82,
        "value": [
         "A#4"
        ]
       },
       {
        "key": 83,
        "value": [
         "B4"
        ]
       },
       {
        "key": 84,
        "value": [
         "C5"
        ]
       },
       {
        "key": 85,
        "value": [
         "C#5"
        ]
       },
       {
        "key": 86,
        "value": [
         "D5"
        ]
       },
       {
        "key": 87,
        "value": [
         "D#5"
        ]
       },
       {
        "key": 88,
        "value": [
         "E5"
        ]
       },
       {
        "key": 89,
        "value": [
         "F5"
        ]
       },
       {
        "key": 90,
        "value": [
         "F#5"
        ]
       },
       {
        "key": 91,
        "value": [
         "G5"
        ]
       },
       {
        "key": 92,
        "value": [
         "G#5"
        ]
       },
       {
        "key": 93,
        "value": [
         "A5"
        ]
       },
       {
        "key": 94,
        "value": [
         "A#5"
        ]
       },
       {
        "key": 95,
        "value": [
         "B5"
        ]
       },
       {
        "key": 96,
        "value": [
         "C6"
        ]
       },
       {
        "key": 97,
        "value": [
         "C#6"
        ]
       },
       {
        "key": 98,
        "value": [
         "D6"
        ]
       },
       {
        "key": 99,
        "value": [
         "D#6"
        ]
       },
       {
        "key": 100,
        "value": [
         "E6"
        ]
       },
       {
        "key": 101,
        "value": [
         "F6"
        ]
       },
       {
        "key": 102,
        "value": [
         "F#6"
        ]
       },
       {
        "key": 103,
        "value": [
         "G6"
        ]
       },
       {
        "key": 104,
        "value": [
         "G#6"
        ]
       },
       {
        "key": 105,
        "value": [
         "A6"
        ]
       },
       {
        "key": 106,
        "value": [
         "A#6"
        ]
       },
       {
        "key": 107,
        "value": [
         "B6"
        ]
       },
       {
        "key": 108,
        "value": [
         "C7"
        ]
       },
       {
        "key": 109,
        "value": [
         "C#7"
        ]
       },
       {
        "key": 110,
        "value": [
         "D7"
        ]
       },
       {
        "key": 111,
        "value": [
         "D#7"
        ]
       },
       {
        "key": 112,
        "value": [
         "E7"
        ]
       },
       {
        "key": 113,
        "value": [
         "F7"
        ]
       },
       {
        "key": 114,
        "value": [
         "F#7"
        ]
       },
       {
        "key": 115,
        "value": [
         "G7"
        ]
       },
       {
        "key": 116,
        "value": [
         "G#7"
        ]
       },
       {
        "key": 117,
        "value": [
         "A7"
        ]
       },
       {
        "key": 118,
        "value": [
         "A#7"
        ]
       },
       {
        "key": 119,
        "value": [
         "B7"
        ]
       },
       {
        "key": 120,
        "value": [
         "C8"
        ]
       },
       {
        "key": 121,
        "value": [
         "C#8"
        ]
       },
       {
        "key": 122,
        "value": [
         "D8"
        ]
       },
       {
        "key": 123,
        "value": [
         "D#8"
        ]
       },
       {
        "key": 124,
        "value": [
         "E8"
        ]
       },
       {
        "key": 125,
        "value": [
         "F8"
        ]
       },
       {
        "key": 126,
        "value": [
         "F#8"
        ]
       },
       {
        "key": 127,
        "value": [
         "G8"
        ]
       }
      ]
     }
    }
   },
   {
    "box": {
     "id": "coll-names2",
     "maxclass": "newobj",
     "text": "coll ---names",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      3500.0,
      1100.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-setpk",
     "maxclass": "message",
     "text": "set $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3400.0,
      1130.0,
      58.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-seten",
     "maxclass": "message",
     "text": "set $1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3500.0,
      1130.0,
      58.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pack-sc",
     "maxclass": "newobj",
     "text": "pack 0 0 0",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2960.0,
      800.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pre-sc",
     "maxclass": "newobj",
     "text": "prepend scale_notes_root_mask",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2960.0,
      830.0,
      190.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pre-ivl",
     "maxclass": "newobj",
     "text": "prepend scale_intervals",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2700.0,
      300.0,
      150.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pre-mode",
     "maxclass": "newobj",
     "text": "prepend scale_mode",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2880.0,
      300.0,
      130.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-slide",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Slide",
     "patching_rect": [
      4200.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      356.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slide",
       "parameter_shortname": "Slide",
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        64
       ],
       "parameter_annotation_name": "Per-note MPE Slide (CC74): the value the Slide envelope ends on (its offset); with S Depth 0, the static Slide value"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-pressure",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Pressure",
     "patching_rect": [
      4260.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Pressure",
       "parameter_shortname": "Pressure",
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Per-note MPE Pressure sent with each note; map it in the instrument"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-bendamt",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Bend Amount",
     "patching_rect": [
      4320.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      506.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Bend Amount",
       "parameter_shortname": "Bend Amt",
       "parameter_type": 0,
       "parameter_unitstyle": 5,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        100.0
       ],
       "parameter_annotation_name": "Scales incoming pitch bend (touch strip, clip, earlier device) before it passes through"
      }
     }
    }
   },
   {
    "box": {
     "id": "c-s7",
     "maxclass": "comment",
     "text": "11. Slide and Pressure (Stage 7): per-note MPE, sent on the new note's channel after its starting bend and before the note-on (latched at the trigger). Turning either knob also sends the new value at once, on the current note's channel.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      4200.0,
      40.0,
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
     "id": "s-cc-go",
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
      4200.0,
      240.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-cc-b0",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4200.0,
      270.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-cc-b1",
     "maxclass": "newobj",
     "text": "i 74",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4250.0,
      270.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-cc-b2",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4300.0,
      270.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-pr-go",
     "maxclass": "newobj",
     "text": "t b b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      4400.0,
      240.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-pr-b0",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4400.0,
      270.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-pr-b1",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4450.0,
      270.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-ccst",
     "maxclass": "newobj",
     "text": "expr 175 + $i1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4200.0,
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
     "id": "expr-prst",
     "maxclass": "newobj",
     "text": "expr 207 + $i1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4400.0,
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
     "id": "i-slide",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4200.0,
      150.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dpress",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      4400.0,
      120.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-press",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4400.0,
      150.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-opress",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      4400.0,
      175.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-s6",
     "maxclass": "comment",
     "text": "12. (Replaced in v7.1: see 16. Incoming MIDI.)",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      4600.0,
      40.0,
      700.0,
      34.0
     ],
     "linecount": 2,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-clamp",
     "maxclass": "comment",
     "text": "13. Clamp label: at each trigger, if the latched Peak or End (in semitones) is beyond +/- Bend Range, show CLAMPED.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      4600.0,
      160.0,
      700.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-clamp",
     "maxclass": "newobj",
     "text": "expr (abs($i1) > $f3) + (abs($i2) > $f3) > 0",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4600.0,
      190.0,
      320.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-clamp",
     "maxclass": "newobj",
     "text": "sel 0 1",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      ""
     ],
     "patching_rect": [
      4600.0,
      220.0,
      60.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-unclamp",
     "maxclass": "message",
     "text": "set",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4600.0,
      250.0,
      37.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-clamp",
     "maxclass": "message",
     "text": "set CLAMPED",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4660.0,
      250.0,
      93.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "lbl-clamp",
     "maxclass": "comment",
     "text": "",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      4600.0,
      280.0,
      60.0,
      20.0
     ],
     "linecount": 1,
     "fontname": "Arial Bold",
     "fontsize": 10.0,
     "presentation": 1,
     "presentation_rect": [
      356.0,
      113.0,
      70.0,
      18.0
     ],
     "textcolor": [
      0.9,
      0.3,
      0.2,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "t-init3",
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
      4800.0,
      340.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-breath",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Breath",
     "patching_rect": [
      4800.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      456.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Breath",
       "parameter_shortname": "Breath",
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Breath Controller (CC2) on the MPE master channel, sent with each note; map it in the instrument"
      }
     }
    }
   },
   {
    "box": {
     "id": "s-br-go",
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
      4200.0,
      460.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-br-b0",
     "maxclass": "newobj",
     "text": "i 176",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4200.0,
      490.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-br-b1",
     "maxclass": "newobj",
     "text": "i 2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4250.0,
      490.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-br-b2",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4300.0,
      490.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-dbreath",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      4200.0,
      400.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-breath",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      4200.0,
      420.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-obreath",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      4200.0,
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
     "id": "c-breath",
     "maxclass": "comment",
     "text": "14. Breath (CC2) on the MPE master channel (channel 1), latched per trigger and sent after Pressure, before the note-on; turning the knob sends at once. Master channel, not per note: MPE defines only pitch, Slide and Pressure per note.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      4200.0,
      360.0,
      700.0,
      34.0
     ],
     "linecount": 2,
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-senv",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "linecount": 3,
     "patching_rect": [
      5200.0,
      40.0,
      900.0,
      48.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0,
     "text": "15. Slide envelope (v7): per note, CC74 starts at Slide + S Depth and moves to Slide (the offset) over S Release (% of Length, up to 400 %: past 100 % the note ends mid-release and Slide holds there), shaped like the pitch curves: y = x^(2^(c/50)). Latched at the trigger, sent before and again after the note-on, then by its own clock (same tick/ms unit as the pitch envelope), only when the value changes. Kills stop it."
    }
   },
   {
    "box": {
     "id": "obj-sdepth",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Slide Depth",
     "patching_rect": [
      5200.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      556.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slide Depth",
       "parameter_shortname": "S Depth",
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": -127.0,
       "parameter_mmax": 127.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Slide envelope depth: the note starts at Slide + Depth and moves to Slide. 0 = no envelope"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-srel",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Slide Release",
     "patching_rect": [
      5260.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      606.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slide Release",
       "parameter_shortname": "S Rel",
       "parameter_type": 0,
       "parameter_unitstyle": 5,
       "parameter_mmin": 0.0,
       "parameter_mmax": 400.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        100.0
       ],
       "parameter_annotation_name": "Slide envelope time as % of Length. 100 % ends exactly at the note's end; above 100 % the note ends mid-release"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-scrv",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Slide Curve",
     "patching_rect": [
      5320.0,
      60.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      656.0,
      22.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slide Curve",
       "parameter_shortname": "S Curve",
       "parameter_type": 0,
       "parameter_unitstyle": 1,
       "parameter_mmin": -100.0,
       "parameter_mmax": 100.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_annotation_name": "Slide envelope shape: -100 fast drop and slow tail, 0 linear, +100 slow start and fast end"
      }
     }
    }
   },
   {
    "box": {
     "id": "i-sdepth",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      5200.0,
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
     "id": "f-srel",
     "maxclass": "newobj",
     "text": "f",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      5260.0,
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
     "id": "f-scrv",
     "maxclass": "newobj",
     "text": "f",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      5320.0,
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
     "id": "expr-sv",
     "maxclass": "newobj",
     "text": "expr max(0, min(127, int($f2 + ($f3 - $f2) * (($f4 <= 0.) + ($f4 > 0.) * pow(min($f1 / max($f4, 0.000001), 1.), pow(2., $f5 / 50.))) + 0.5)))",
     "numinlets": 5,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5200.0,
      440.0,
      520.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-sst",
     "maxclass": "newobj",
     "text": "expr max(0, min(127, $i1 + $i2))",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5200.0,
      260.0,
      236.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-sstart",
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
      5200.0,
      200.0,
      130.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-srun",
     "maxclass": "newobj",
     "text": "expr ($f1 > 0.) * ($i2 != 0)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5500.0,
      290.0,
      208.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-sl3",
     "maxclass": "newobj",
     "text": "t i i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      5260.0,
      230.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-srel",
     "maxclass": "newobj",
     "text": "t f f f",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "float",
      "float",
      "float"
     ],
     "patching_rect": [
      5320.0,
      230.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-Rv",
     "maxclass": "newobj",
     "text": "expr $f1 / 100.",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5320.0,
      260.0,
      117.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-Rend",
     "maxclass": "newobj",
     "text": "expr min($f1 / 100., 1.)",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5400.0,
      260.0,
      180.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-sdone",
     "maxclass": "newobj",
     "text": "expr $f1 >= $f2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5600.0,
      520.0,
      117.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-sloop",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5500.0,
      330.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-s0",
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
      5200.0,
      300.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-sn",
     "maxclass": "newobj",
     "text": "i 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      5700.0,
      370.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-sn0",
     "maxclass": "message",
     "text": "0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5700.0,
      340.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-slast",
     "maxclass": "message",
     "text": "-1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5760.0,
      340.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-schg",
     "maxclass": "newobj",
     "text": "expr $i1 != $i2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5320.0,
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
     "id": "m-sx0",
     "maxclass": "message",
     "text": "0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5260.0,
      340.0,
      30.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "dly-sl",
     "maxclass": "newobj",
     "text": "delay 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      5500.0,
      370.0,
      60.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-stick",
     "maxclass": "newobj",
     "text": "t b b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      5500.0,
      400.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "plus-sn",
     "maxclass": "newobj",
     "text": "+ 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      5700.0,
      400.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-scn",
     "maxclass": "newobj",
     "text": "t i i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      5700.0,
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
     "id": "expr-sx",
     "maxclass": "newobj",
     "text": "expr $i1 / $f2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5600.0,
      460.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-sx",
     "maxclass": "newobj",
     "text": "t f f",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      5600.0,
      490.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-sdone",
     "maxclass": "newobj",
     "text": "sel 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      5600.0,
      550.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "m-sclose",
     "maxclass": "message",
     "text": "0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5600.0,
      580.0,
      23.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-sv",
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
      5200.0,
      470.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-ssend",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5200.0,
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
     "id": "t-ssend",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      5200.0,
      560.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-slv",
     "maxclass": "newobj",
     "text": "i 64",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      5260.0,
      590.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-slv",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      5260.0,
      620.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pre-slide",
     "maxclass": "newobj",
     "text": "prepend slide",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      5400.0,
      560.0,
      90.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-init4",
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
      5800.0,
      160.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-inb",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "linecount": 3,
     "patching_rect": [
      6400.0,
      40.0,
      900.0,
      48.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0,
     "text": "16. Incoming MIDI (v7.1). Pitch bend is read from the raw bytes (exact 14-bit; midiparse's 7-bit bend output is unused): status 0xE0-0xEF sets the channel, then LSB, MSB (running status allowed). Only MPE master-channel (1) bend is passed on, scaled by Bend Amount around centre, as raw bytes on channel 1; Bend Amount re-applies at once. Other pass-through (poly pressure, CCs, program, channel pressure) is also gated to channel 1: per-note expression on the placeholders' member channels is dropped, so it can't land on the device's own notes."
    }
   },
   {
    "box": {
     "id": "t-byte",
     "maxclass": "newobj",
     "text": "t i i i i",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "int",
      "int",
      "int",
      "int"
     ],
     "patching_rect": [
      6400.0,
      120.0,
      108.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-bsch",
     "maxclass": "newobj",
     "text": "expr (($i1 >= 224) && ($i1 < 240)) * ($i1 - 223)",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6660.0,
      150.0,
      348.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-bsch",
     "maxclass": "newobj",
     "text": "sel 0",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      6660.0,
      180.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-bch",
     "maxclass": "newobj",
     "text": "i 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      6660.0,
      210.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-bval",
     "maxclass": "newobj",
     "text": "expr ($i1 < 128) * ($i2 == 2) * ($i1 * 128 + $i3 + 1) - 1",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6400.0,
      180.0,
      411.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-bns",
     "maxclass": "newobj",
     "text": "expr ($i1 >= 224) * ($i1 < 240) + ($i1 < 128) * (($i2 == 1) * 2 + ($i2 == 2))",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6520.0,
      210.0,
      520.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-bval",
     "maxclass": "newobj",
     "text": "sel -1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      6400.0,
      210.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-bin",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      6400.0,
      240.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pack-bin",
     "maxclass": "newobj",
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6400.0,
      300.0,
      70.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "unp-bin",
     "maxclass": "newobj",
     "text": "unpack 0 0",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      6400.0,
      330.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "pre-inb",
     "maxclass": "newobj",
     "text": "prepend in_bend_ch_val",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6600.0,
      330.0,
      150.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-ismaster",
     "maxclass": "newobj",
     "text": "expr $i1 == 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6400.0,
      390.0,
      103.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-binv",
     "maxclass": "newobj",
     "text": "i 8192",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      6500.0,
      360.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-ismaster",
     "maxclass": "newobj",
     "text": "sel 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      6400.0,
      420.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-mbraw",
     "maxclass": "newobj",
     "text": "i 8192",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      6400.0,
      480.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-mbset",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      6400.0,
      450.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-mb",
     "maxclass": "newobj",
     "text": "expr max(0, min(16383, int(8192. + ($i1 - 8192) * $f2 / 100. + 0.5)))",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6400.0,
      510.0,
      495.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-bamt",
     "maxclass": "newobj",
     "text": "t b f",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "float"
     ],
     "patching_rect": [
      6600.0,
      480.0,
      64.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-mbo",
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
      6400.0,
      540.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-mb-b0",
     "maxclass": "newobj",
     "text": "expr $i1 * 0 + 224",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6400.0,
      570.0,
      138.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-mb-b1",
     "maxclass": "newobj",
     "text": "expr $i1 % 128",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6600.0,
      570.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-mb-b2",
     "maxclass": "newobj",
     "text": "expr $i1 / 128",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      6800.0,
      570.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-pch1",
     "maxclass": "newobj",
     "text": "expr $i1 == 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      7000.0,
      120.0,
      103.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-p1",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      7060.0,
      160.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-p2",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      7120.0,
      160.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-p3",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      7180.0,
      160.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "gate-p4",
     "maxclass": "newobj",
     "text": "gate 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      7240.0,
      160.0,
      50.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-tilt",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Tilt Env",
     "patching_rect": [
      1400.0,
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
       "parameter_longname": "Tilt Env",
       "parameter_shortname": "Tilt Env",
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": -200.0,
       "parameter_mmax": 200.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Envelope shape: -100 falling ramp (no attack), 0 triangle, +100 rising ramp (no decay). Beyond +/-100 the ramp overshoots up to 200 % of Length and the note ends partway through it"
      }
     }
    }
   },
   {
    "box": {
     "id": "t-tilt",
     "maxclass": "newobj",
     "text": "t f f",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1400.0,
      120.0,
      60.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-tatt",
     "maxclass": "newobj",
     "text": "expr max(0., min(100., 50. + $f1 / 2.)) + max(0., $f1 - 100.)",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1400.0,
      150.0,
      439.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-tdec",
     "maxclass": "newobj",
     "text": "expr max(0., min(100., 50. - $f1 / 2.)) + max(0., -$f1 - 100.)",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1400.0,
      180.0,
      446.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-tilt",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "linecount": 2,
     "fontname": "Arial Bold",
     "fontsize": 10.0,
     "patching_rect": [
      1400.0,
      210.0,
      700.0,
      34.0
     ],
     "text": "Tilt Env (v1.1): -100..+100 morphs falling ramp -> triangle -> rising ramp (Attack + Decay = 100 %). Beyond +/-100 the ramp stretches to 200 % of Length; the envelope stops at the note's end and holds where it got to."
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
      8
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
      6
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
      4
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
      5
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
      6
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
      7
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
      8
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
      9
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
      "t-trig",
      7
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
   },
   {
    "patchline": {
     "source": [
      "thisdev",
      0
     ],
     "destination": [
      "t-sinit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sinit",
      2
     ],
     "destination": [
      "m-obs-root",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-obs-root",
      0
     ],
     "destination": [
      "obs-root",
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
      "obs-root",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sinit",
      1
     ],
     "destination": [
      "m-obs-ivl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-obs-ivl",
      0
     ],
     "destination": [
      "obs-ivl",
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
      "obs-ivl",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sinit",
      0
     ],
     "destination": [
      "m-obs-mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-obs-mode",
      0
     ],
     "destination": [
      "obs-mode",
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
      "obs-mode",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obs-ivl",
      0
     ],
     "destination": [
      "t-ivl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ivl",
      2
     ],
     "destination": [
      "m-mask0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-mask0",
      0
     ],
     "destination": [
      "acc-mask",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ivl",
      1
     ],
     "destination": [
      "unp-ivl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      0
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      1
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      2
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      3
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      4
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      5
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      6
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      7
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      8
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      9
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      10
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-ivl",
      11
     ],
     "destination": [
      "expr-bit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-bit",
      0
     ],
     "destination": [
      "acc-mask",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "acc-mask",
      0
     ],
     "destination": [
      "acc-mask",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-mask0",
      0
     ],
     "destination": [
      "expr-in",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "acc-mask",
      0
     ],
     "destination": [
      "expr-in",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ivl",
      0
     ],
     "destination": [
      "rb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obs-root",
      0
     ],
     "destination": [
      "t-root",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-root",
      1
     ],
     "destination": [
      "expr-in",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-root",
      0
     ],
     "destination": [
      "rb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rb",
      0
     ],
     "destination": [
      "t-rb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-rb",
      3
     ],
     "destination": [
      "m-clear",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-clear",
      0
     ],
     "destination": [
      "coll-scl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-clear",
      0
     ],
     "destination": [
      "coll-idx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-rb",
      2
     ],
     "destination": [
      "m-cnt0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-cnt0",
      0
     ],
     "destination": [
      "i-cnt",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-rb",
      1
     ],
     "destination": [
      "uzi",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "uzi",
      2
     ],
     "destination": [
      "expr-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-p",
      0
     ],
     "destination": [
      "t-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-p",
      2
     ],
     "destination": [
      "pack-scl",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-p",
      1
     ],
     "destination": [
      "expr-in",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-in",
      0
     ],
     "destination": [
      "sel-in",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-cnt",
      0
     ],
     "destination": [
      "t-ci",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ci",
      0
     ],
     "destination": [
      "gate-ci",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-ci",
      1
     ],
     "destination": [
      "plus-cnt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "plus-cnt",
      0
     ],
     "destination": [
      "i-cnt",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-ci",
      1
     ],
     "destination": [
      "pack-scl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-scl",
      0
     ],
     "destination": [
      "coll-scl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-in",
      0
     ],
     "destination": [
      "t-add",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-add",
      2
     ],
     "destination": [
      "m-add",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-add",
      0
     ],
     "destination": [
      "gate-ci",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-add",
      1
     ],
     "destination": [
      "i-cnt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-add",
      0
     ],
     "destination": [
      "m-read",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-read",
      0
     ],
     "destination": [
      "gate-ci",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-p",
      0
     ],
     "destination": [
      "t-pi",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-pi",
      1
     ],
     "destination": [
      "i-cnt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-ci",
      0
     ],
     "destination": [
      "expr-last",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-last",
      0
     ],
     "destination": [
      "pack-idx",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-pi",
      0
     ],
     "destination": [
      "pack-idx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-idx",
      0
     ],
     "destination": [
      "coll-idx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "plus-cnt",
      0
     ],
     "destination": [
      "i-cnt2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-cnt0",
      0
     ],
     "destination": [
      "i-cnt2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-rb",
      0
     ],
     "destination": [
      "i-cnt2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-cnt2",
      0
     ],
     "destination": [
      "t-cnt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-scale",
      0
     ],
     "destination": [
      "t-dS",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dS",
      1
     ],
     "destination": [
      "expr-act",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obs-mode",
      0
     ],
     "destination": [
      "t-dM",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dM",
      2
     ],
     "destination": [
      "expr-act",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dM",
      1
     ],
     "destination": [
      "m-bang",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-cnt",
      2
     ],
     "destination": [
      "expr-act",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-cnt",
      1
     ],
     "destination": [
      "m-bang",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-bang",
      0
     ],
     "destination": [
      "expr-act",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "disp",
      0
     ],
     "destination": [
      "i-sN",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dS",
      0
     ],
     "destination": [
      "disp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dM",
      0
     ],
     "destination": [
      "disp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-cnt",
      0
     ],
     "destination": [
      "disp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-act",
      0
     ],
     "destination": [
      "gate-scl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-sN",
      0
     ],
     "destination": [
      "gate-scl",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-scl",
      0
     ],
     "destination": [
      "t-plain",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-plain",
      2
     ],
     "destination": [
      "o-note",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-plain",
      1
     ],
     "destination": [
      "i-sP",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-sP",
      0
     ],
     "destination": [
      "o-peak",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-plain",
      0
     ],
     "destination": [
      "i-sE",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-sE",
      0
     ],
     "destination": [
      "o-end",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-scl",
      1
     ],
     "destination": [
      "coll-idx-r",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "coll-idx-r",
      0
     ],
     "destination": [
      "t-i0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-i0",
      2
     ],
     "destination": [
      "coll-scl-n",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "coll-scl-n",
      0
     ],
     "destination": [
      "t-sn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sn",
      2
     ],
     "destination": [
      "expr-pk",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sn",
      1
     ],
     "destination": [
      "expr-en",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sn",
      0
     ],
     "destination": [
      "o-note",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-i0",
      1
     ],
     "destination": [
      "expr-clP",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-i0",
      0
     ],
     "destination": [
      "expr-clE",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-cnt",
      2
     ],
     "destination": [
      "expr-clP",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-cnt",
      2
     ],
     "destination": [
      "expr-clE",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-clP",
      0
     ],
     "destination": [
      "coll-scl-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "coll-scl-p",
      0
     ],
     "destination": [
      "expr-pk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-pk",
      0
     ],
     "destination": [
      "o-peak",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-clE",
      0
     ],
     "destination": [
      "coll-scl-e",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "coll-scl-e",
      0
     ],
     "destination": [
      "expr-en",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-en",
      0
     ],
     "destination": [
      "o-end",
      0
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
      "t-dN",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dN",
      1
     ],
     "destination": [
      "i-sN",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dN",
      0
     ],
     "destination": [
      "disp",
      0
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
      "t-dP",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dP",
      1
     ],
     "destination": [
      "i-sP",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dP",
      1
     ],
     "destination": [
      "expr-clP",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dP",
      0
     ],
     "destination": [
      "disp",
      0
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
      "t-dE",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dE",
      1
     ],
     "destination": [
      "i-sE",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dE",
      1
     ],
     "destination": [
      "expr-clE",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dE",
      0
     ],
     "destination": [
      "disp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "o-note",
      0
     ],
     "destination": [
      "gate-onote",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "o-peak",
      0
     ],
     "destination": [
      "gate-opeak",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "o-end",
      0
     ],
     "destination": [
      "gate-oend",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-onote",
      1
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
      "gate-opeak",
      1
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
      "gate-oend",
      1
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
      4
     ],
     "destination": [
      "t-ctx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ctx",
      2
     ],
     "destination": [
      "m-ctx2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ctx",
      1
     ],
     "destination": [
      "i-sN",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ctx",
      0
     ],
     "destination": [
      "m-ctx1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ctx2",
      0
     ],
     "destination": [
      "gate-onote",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ctx1",
      0
     ],
     "destination": [
      "gate-onote",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ctx2",
      0
     ],
     "destination": [
      "gate-opeak",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ctx1",
      0
     ],
     "destination": [
      "gate-opeak",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ctx2",
      0
     ],
     "destination": [
      "gate-oend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-ctx1",
      0
     ],
     "destination": [
      "gate-oend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-onote",
      0
     ],
     "destination": [
      "expr-dpk",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-onote",
      0
     ],
     "destination": [
      "expr-den",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-opeak",
      0
     ],
     "destination": [
      "expr-dpk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-oend",
      0
     ],
     "destination": [
      "expr-den",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-dpk",
      0
     ],
     "destination": [
      "coll-names",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-den",
      0
     ],
     "destination": [
      "coll-names2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "coll-names",
      0
     ],
     "destination": [
      "m-setpk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "coll-names2",
      0
     ],
     "destination": [
      "m-seten",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-setpk",
      0
     ],
     "destination": [
      "lbl-peaknote",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-seten",
      0
     ],
     "destination": [
      "lbl-endnote",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-root",
      1
     ],
     "destination": [
      "pack-sc",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "acc-mask",
      0
     ],
     "destination": [
      "pack-sc",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-mask0",
      0
     ],
     "destination": [
      "pack-sc",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-cnt",
      2
     ],
     "destination": [
      "pack-sc",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-sc",
      0
     ],
     "destination": [
      "pre-sc",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pre-sc",
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
      "t-ivl",
      1
     ],
     "destination": [
      "pre-ivl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pre-ivl",
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
      "obs-mode",
      0
     ],
     "destination": [
      "pre-mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pre-mode",
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
      "t-init2",
      1
     ],
     "destination": [
      "obj-scale",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-cc-go",
      2
     ],
     "destination": [
      "s-cc-b0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-cc-b0",
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
      "s-cc-go",
      1
     ],
     "destination": [
      "s-cc-b1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-cc-b1",
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
      "s-cc-go",
      0
     ],
     "destination": [
      "s-cc-b2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-cc-b2",
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
      "s-pr-go",
      1
     ],
     "destination": [
      "s-pr-b0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-pr-b0",
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
      "s-pr-go",
      0
     ],
     "destination": [
      "s-pr-b1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-pr-b1",
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
      "expr-chn",
      0
     ],
     "destination": [
      "expr-ccst",
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
      "expr-ccst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-ccst",
      0
     ],
     "destination": [
      "s-cc-b0",
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
      "expr-prst",
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
      "expr-prst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-prst",
      0
     ],
     "destination": [
      "s-pr-b0",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-pressure",
      0
     ],
     "destination": [
      "t-dpress",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dpress",
      1
     ],
     "destination": [
      "i-press",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dpress",
      0
     ],
     "destination": [
      "i-press",
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
      "i-press",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-press",
      0
     ],
     "destination": [
      "t-opress",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-opress",
      1
     ],
     "destination": [
      "s-pr-b1",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-opress",
      0
     ],
     "destination": [
      "s-pr-go",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-oend",
      1
     ],
     "destination": [
      "expr-clamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-opeak",
      1
     ],
     "destination": [
      "expr-clamp",
      1
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
      "expr-clamp",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-clamp",
      0
     ],
     "destination": [
      "sel-clamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-clamp",
      0
     ],
     "destination": [
      "m-unclamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-clamp",
      1
     ],
     "destination": [
      "m-clamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-unclamp",
      0
     ],
     "destination": [
      "lbl-clamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-clamp",
      0
     ],
     "destination": [
      "lbl-clamp",
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
      "t-init3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init3",
      3
     ],
     "destination": [
      "obj-bendamt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init3",
      2
     ],
     "destination": [
      "obj-slide",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init3",
      1
     ],
     "destination": [
      "obj-pressure",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-br-go",
      2
     ],
     "destination": [
      "s-br-b0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-br-b0",
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
      "s-br-go",
      1
     ],
     "destination": [
      "s-br-b1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-br-b1",
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
      "s-br-go",
      0
     ],
     "destination": [
      "s-br-b2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-br-b2",
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
      "obj-breath",
      0
     ],
     "destination": [
      "t-dbreath",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dbreath",
      1
     ],
     "destination": [
      "i-breath",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dbreath",
      0
     ],
     "destination": [
      "i-breath",
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
      "i-breath",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-breath",
      0
     ],
     "destination": [
      "t-obreath",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-obreath",
      1
     ],
     "destination": [
      "s-br-b2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-obreath",
      0
     ],
     "destination": [
      "s-br-go",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init3",
      0
     ],
     "destination": [
      "obj-breath",
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
      "i-press",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-sdepth",
      0
     ],
     "destination": [
      "i-sdepth",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-srel",
      0
     ],
     "destination": [
      "f-srel",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-scrv",
      0
     ],
     "destination": [
      "f-scrv",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-slide",
      0
     ],
     "destination": [
      "i-slide",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-trig",
      5
     ],
     "destination": [
      "t-sstart",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sstart",
      4
     ],
     "destination": [
      "i-sdepth",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-sdepth",
      0
     ],
     "destination": [
      "expr-sst",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-sdepth",
      0
     ],
     "destination": [
      "expr-srun",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sstart",
      3
     ],
     "destination": [
      "i-slide",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-slide",
      0
     ],
     "destination": [
      "t-sl3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sl3",
      1
     ],
     "destination": [
      "expr-sv",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sl3",
      0
     ],
     "destination": [
      "expr-sst",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-sst",
      0
     ],
     "destination": [
      "expr-sv",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sstart",
      2
     ],
     "destination": [
      "f-srel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f-srel",
      0
     ],
     "destination": [
      "t-srel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-srel",
      2
     ],
     "destination": [
      "expr-Rv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-Rv",
      0
     ],
     "destination": [
      "expr-sv",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-srel",
      1
     ],
     "destination": [
      "expr-Rend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-Rend",
      0
     ],
     "destination": [
      "expr-sdone",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-srel",
      0
     ],
     "destination": [
      "expr-srun",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sstart",
      1
     ],
     "destination": [
      "f-scrv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f-scrv",
      0
     ],
     "destination": [
      "expr-sv",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-srun",
      0
     ],
     "destination": [
      "gate-sloop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sstart",
      0
     ],
     "destination": [
      "t-s0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-s0",
      2
     ],
     "destination": [
      "m-sn0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-sn0",
      0
     ],
     "destination": [
      "i-sn",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-s0",
      2
     ],
     "destination": [
      "m-slast",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-slast",
      0
     ],
     "destination": [
      "expr-schg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-s0",
      1
     ],
     "destination": [
      "m-sx0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-sx0",
      0
     ],
     "destination": [
      "expr-sv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-s0",
      0
     ],
     "destination": [
      "gate-sloop",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-sloop",
      0
     ],
     "destination": [
      "dly-sl",
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
      "dly-sl",
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
      "dly-sl",
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
      "dly-sl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dly-sl",
      0
     ],
     "destination": [
      "t-stick",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-stick",
      1
     ],
     "destination": [
      "i-sn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-sn",
      0
     ],
     "destination": [
      "plus-sn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "plus-sn",
      0
     ],
     "destination": [
      "t-scn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-scn",
      1
     ],
     "destination": [
      "i-sn",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-scn",
      0
     ],
     "destination": [
      "expr-sx",
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
      "expr-sx",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-sx",
      0
     ],
     "destination": [
      "t-sx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sx",
      1
     ],
     "destination": [
      "expr-sdone",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-sdone",
      0
     ],
     "destination": [
      "sel-sdone",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-sdone",
      0
     ],
     "destination": [
      "m-sclose",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-sclose",
      0
     ],
     "destination": [
      "gate-sloop",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sx",
      0
     ],
     "destination": [
      "expr-sv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-stick",
      0
     ],
     "destination": [
      "gate-sloop",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-sv",
      0
     ],
     "destination": [
      "t-sv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sv",
      2
     ],
     "destination": [
      "expr-schg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-schg",
      0
     ],
     "destination": [
      "gate-ssend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sv",
      1
     ],
     "destination": [
      "gate-ssend",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sv",
      0
     ],
     "destination": [
      "expr-schg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-ssend",
      0
     ],
     "destination": [
      "t-ssend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ssend",
      1
     ],
     "destination": [
      "s-cc-b2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ssend",
      1
     ],
     "destination": [
      "i-slv",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-ssend",
      0
     ],
     "destination": [
      "s-cc-go",
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
      "i-slv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-slv",
      0
     ],
     "destination": [
      "t-slv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-slv",
      1
     ],
     "destination": [
      "s-cc-b2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-slv",
      0
     ],
     "destination": [
      "s-cc-go",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-ssend",
      0
     ],
     "destination": [
      "pre-slide",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pre-slide",
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
      "t-init4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init4",
      2
     ],
     "destination": [
      "obj-sdepth",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init4",
      1
     ],
     "destination": [
      "obj-srel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-init4",
      0
     ],
     "destination": [
      "obj-scrv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "midiin",
      0
     ],
     "destination": [
      "t-byte",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-byte",
      3
     ],
     "destination": [
      "expr-bsch",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-bsch",
      0
     ],
     "destination": [
      "sel-bsch",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-bsch",
      1
     ],
     "destination": [
      "i-bch",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-byte",
      2
     ],
     "destination": [
      "expr-bval",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-byte",
      1
     ],
     "destination": [
      "expr-bns",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-bns",
      0
     ],
     "destination": [
      "expr-bns",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-bns",
      0
     ],
     "destination": [
      "expr-bval",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-byte",
      0
     ],
     "destination": [
      "expr-bval",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-bval",
      0
     ],
     "destination": [
      "sel-bval",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-bval",
      1
     ],
     "destination": [
      "t-bin",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bin",
      1
     ],
     "destination": [
      "pack-bin",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bin",
      0
     ],
     "destination": [
      "i-bch",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-bch",
      0
     ],
     "destination": [
      "pack-bin",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-bin",
      0
     ],
     "destination": [
      "unp-bin",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-bin",
      0
     ],
     "destination": [
      "pre-inb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pre-inb",
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
      "unp-bin",
      1
     ],
     "destination": [
      "i-binv",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "unp-bin",
      0
     ],
     "destination": [
      "expr-ismaster",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-ismaster",
      0
     ],
     "destination": [
      "sel-ismaster",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-ismaster",
      0
     ],
     "destination": [
      "i-binv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-binv",
      0
     ],
     "destination": [
      "t-mbset",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-mbset",
      1
     ],
     "destination": [
      "i-mbraw",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-mbset",
      0
     ],
     "destination": [
      "i-mbraw",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-mbraw",
      0
     ],
     "destination": [
      "expr-mb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-bendamt",
      0
     ],
     "destination": [
      "t-bamt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bamt",
      1
     ],
     "destination": [
      "expr-mb",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-bamt",
      0
     ],
     "destination": [
      "i-mbraw",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-mb",
      0
     ],
     "destination": [
      "t-mbo",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-mbo",
      2
     ],
     "destination": [
      "s-mb-b0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-mb-b0",
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
      "t-mbo",
      1
     ],
     "destination": [
      "s-mb-b1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-mb-b1",
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
      "t-mbo",
      0
     ],
     "destination": [
      "s-mb-b2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-mb-b2",
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
      "parse",
      6
     ],
     "destination": [
      "expr-pch1",
      0
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
      "expr-pch1",
      0
     ],
     "destination": [
      "gate-p1",
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
      "gate-p1",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-p1",
      0
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
      "expr-pch1",
      0
     ],
     "destination": [
      "gate-p2",
      0
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
      "gate-p2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-p2",
      0
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
      "expr-pch1",
      0
     ],
     "destination": [
      "gate-p3",
      0
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
      "gate-p3",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-p3",
      0
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
      "expr-pch1",
      0
     ],
     "destination": [
      "gate-p4",
      0
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
      "gate-p4",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate-p4",
      0
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
      "obj-tilt",
      0
     ],
     "destination": [
      "t-tilt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-tilt",
      1
     ],
     "destination": [
      "expr-tatt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-tilt",
      0
     ],
     "destination": [
      "expr-tdec",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-tatt",
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
      "expr-tdec",
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
      "t-init2",
      2
     ],
     "destination": [
      "obj-tilt",
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
      "Velocity",
      "Peak",
      "End",
      "Tilt Env",
      "Attack Curve",
      "Decay Curve",
      "-"
     ]
    },
    "1": {
     "index": 1,
     "name": "Perform",
     "parameters": [
      "Trigger Length",
      "Envelope",
      "Slide",
      "Pressure",
      "Breath",
      "Bend Amount",
      "-",
      "-"
     ]
    },
    "2": {
     "index": 2,
     "name": "Slide Env",
     "parameters": [
      "Slide",
      "Slide Depth",
      "Slide Release",
      "Slide Curve",
      "-",
      "-",
      "-",
      "-"
     ]
    },
    "3": {
     "index": 3,
     "name": "Setup",
     "parameters": [
      "-",
      "-",
      "Bend Range",
      "Scale",
      "-",
      "-",
      "-",
      "-"
     ]
    }
   },
   "inherited_shortname": 1,
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
   ],
   "obj-scale": [
    "Scale",
    "Scale",
    0
   ],
   "obj-slide": [
    "Slide",
    "Slide",
    0
   ],
   "obj-pressure": [
    "Pressure",
    "Pressure",
    0
   ],
   "obj-bendamt": [
    "Bend Amount",
    "Bend Amt",
    0
   ],
   "obj-breath": [
    "Breath",
    "Breath",
    0
   ],
   "obj-sdepth": [
    "Slide Depth",
    "S Depth",
    0
   ],
   "obj-srel": [
    "Slide Release",
    "S Rel",
    0
   ],
   "obj-scrv": [
    "Slide Curve",
    "S Curve",
    0
   ],
   "obj-tilt": [
    "Tilt Env",
    "Tilt Env",
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
