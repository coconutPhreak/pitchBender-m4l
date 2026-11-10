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
   1400.0,
   1000.0
  ],
  "openrect": [
   0.0,
   0.0,
   280.0,
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
  "devicewidth": 280.0,
  "description": "Probe: per-note MPE output (channels 2-16, bend, Slide, Pressure) from a Max for Live MIDI effect.",
  "digest": "",
  "tags": "",
  "style": "",
  "subpatcher_template": "",
  "title": "MPE Probe",
  "boxes": [
   {
    "box": {
     "id": "c-title",
     "maxclass": "comment",
     "text": "MPE PROBE: does per-note MPE output from a Max for Live MIDI effect work on Push 3 standalone? Each placeholder note-on plays Note on its own member channel (2-16, rotating) with a per-note bend, Slide (CC74) and Pressure, all as raw bytes to midiout. Device MPE flag (is_mpe) is on. Needs the transport playing for the note length (2 steps).",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      4.0,
      900.0,
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
      900.0,
      40.0,
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
       "parameter_initial_enable": 1,
       "parameter_type": 1,
       "parameter_unitstyle": 8,
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_initial": [
        48
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-bend",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Bend",
     "patching_rect": [
      960.0,
      40.0,
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
       "parameter_longname": "Bend",
       "parameter_shortname": "Bend",
       "parameter_initial_enable": 1,
       "parameter_type": 1,
       "parameter_unitstyle": 7,
       "parameter_mmin": -48.0,
       "parameter_mmax": 48.0,
       "parameter_initial": [
        7
       ],
       "parameter_annotation_name": "Per-note bend in semitones"
      }
     }
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
      1020.0,
      40.0,
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
       "parameter_longname": "Slide",
       "parameter_shortname": "Slide",
       "parameter_initial_enable": 1,
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_initial": [
        64
       ],
       "parameter_annotation_name": "Per-note Slide (CC74)"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-press",
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
      1080.0,
      40.0,
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
       "parameter_longname": "Pressure",
       "parameter_shortname": "Pressure",
       "parameter_initial_enable": 1,
       "parameter_type": 1,
       "parameter_unitstyle": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_initial": [
        100
       ],
       "parameter_annotation_name": "Per-note Pressure (channel pressure on the note's channel)"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-alt",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "parameter_enable": 1,
     "varname": "Alternate",
     "patching_rect": [
      1140.0,
      40.0,
      15.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      216.0,
      40.0,
      15.0,
      15.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Alternate",
       "parameter_shortname": "Alternate",
       "parameter_initial_enable": 1,
       "parameter_type": 2,
       "parameter_mmax": 1.0,
       "parameter_enum": [
        "Off",
        "On"
       ],
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "On: every second note has no bend, to hear whether release tails keep their own pitch"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-chmode",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "Channels",
     "patching_rect": [
      1180.0,
      40.0,
      80.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      110.0,
      80.0,
      15.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Channels",
       "parameter_shortname": "Channels",
       "parameter_initial_enable": 1,
       "parameter_type": 2,
       "parameter_enum": [
        "Rotate 2-16",
        "Fixed 2"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0
       ],
       "parameter_annotation_name": "Rotate: a new member channel per note (MPE). Fixed 2: every note on channel 2 (like one shared bend)"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-range",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "PB Range",
     "patching_rect": [
      1280.0,
      40.0,
      44.0,
      47.0
     ],
     "presentation": 1,
     "presentation_rect": [
      106.0,
      92.0,
      44.0,
      47.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "PB Range",
       "parameter_shortname": "PB Range",
       "parameter_initial_enable": 1,
       "parameter_type": 1,
       "parameter_unitstyle": 7,
       "parameter_mmin": 1.0,
       "parameter_mmax": 96.0,
       "parameter_initial": [
        48
       ],
       "parameter_annotation_name": "Per-note bend range each way (MPE default 48)"
      }
     }
    }
   },
   {
    "box": {
     "id": "lbl-alt",
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Alternate",
     "patching_rect": [
      1340.0,
      200.0,
      60.0,
      18.0
     ],
     "presentation": 1,
     "presentation_rect": [
      200.0,
      22.0,
      60.0,
      18.0
     ],
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "lbl-ch",
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Channels",
     "patching_rect": [
      1340.0,
      220.0,
      60.0,
      18.0
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      92.0,
      80.0,
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
     "text": "MPE PROBE",
     "patching_rect": [
      1340.0,
      40.0,
      60.0,
      18.0
     ],
     "presentation": 1,
     "presentation_rect": [
      200.0,
      92.0,
      80.0,
      18.0
     ],
     "textjustification": 0
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
      900.0,
      110.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-bend",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      960.0,
      110.0,
      40.0,
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
      1020.0,
      110.0,
      40.0,
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
      1080.0,
      110.0,
      40.0,
      20.0
     ],
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
      60.0,
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
      90.0,
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
      900.0,
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
      940.0,
      61.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "c-in",
     "maxclass": "comment",
     "text": "Placeholder notes are swallowed (note-on = trigger). Everything else, including master-channel bend, passes through.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      160.0,
      60.0,
      600.0,
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
      130.0,
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
      160.0,
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
      20.0,
      200.0,
      196.0,
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
     "text": "Right to left: (7) note-off for the sounding note, (6) next channel, (5) per-note bend, (4) Slide, (3) Pressure, (2) note-on, (0) start the 2-step timer. All on the new note's channel.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      240.0,
      200.0,
      640.0,
      34.0
     ],
     "linecount": 2,
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
      20.0,
      820.0,
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
      20.0,
      850.0,
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
      70.0,
      850.0,
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
      120.0,
      850.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-bend-go",
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
      500.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-bend-b0",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      200.0,
      530.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-bend-b1",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      250.0,
      530.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "s-bend-b2",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      300.0,
      530.0,
      40.0,
      20.0
     ],
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
      400.0,
      500.0,
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
      400.0,
      530.0,
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
      450.0,
      530.0,
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
      500.0,
      530.0,
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
      600.0,
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
     "id": "s-pr-b0",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      600.0,
      530.0,
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
      650.0,
      530.0,
      40.0,
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
      760.0,
      500.0,
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
      760.0,
      530.0,
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
      810.0,
      530.0,
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
     "text": "i 100",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      860.0,
      530.0,
      40.0,
      20.0
     ],
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
      20.0,
      250.0,
      64.0,
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
      90.0,
      280.0,
      44.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-snd",
     "maxclass": "newobj",
     "text": "i -1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      20.0,
      700.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "sel-snd",
     "maxclass": "newobj",
     "text": "sel -1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      20.0,
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
     "id": "t-f",
     "maxclass": "newobj",
     "text": "t b b b i",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "bang",
      "bang",
      "bang",
      "int"
     ],
     "patching_rect": [
      20.0,
      760.0,
      108.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-sch",
     "maxclass": "newobj",
     "text": "i 2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      140.0,
      760.0,
      40.0,
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
      140.0,
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
     "id": "m-none",
     "maxclass": "message",
     "text": "-1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      260.0,
      760.0,
      30.0,
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
     "text": "i 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      300.0,
      250.0,
      40.0,
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
      300.0,
      280.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "t-cn",
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
      300.0,
      310.0,
      86.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-stb",
     "maxclass": "newobj",
     "text": "expr $f1 * (1 - $i2 * (($i3 % 2) == 0))",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200.0,
      400.0,
      285.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-ch",
     "maxclass": "newobj",
     "text": "expr ($i2 == 0) * (($i1 % 15) + 2) + ($i2 == 1) * 2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300.0,
      340.0,
      369.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-sb",
     "maxclass": "newobj",
     "text": "expr 223 + $i1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200.0,
      370.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-sc",
     "maxclass": "newobj",
     "text": "expr 175 + $i1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      400.0,
      370.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-sp",
     "maxclass": "newobj",
     "text": "expr 207 + $i1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      600.0,
      370.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-so",
     "maxclass": "newobj",
     "text": "expr 143 + $i1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      760.0,
      370.0,
      110.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "expr-bv",
     "maxclass": "newobj",
     "text": "expr int(8192. + max(min($f1 / $f2, 1.), -1.) * 8191. + 0.5)",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200.0,
      430.0,
      420.0,
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
     "text": "t b i i",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "int",
      "int"
     ],
     "patching_rect": [
      200.0,
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
     "id": "expr-lsb",
     "maxclass": "newobj",
     "text": "expr $i1 % 128",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300.0,
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
     "id": "expr-msb",
     "maxclass": "newobj",
     "text": "expr $i1 / 128",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      380.0,
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
     "id": "t-sl",
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
     "id": "t-pr",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      600.0,
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
     "id": "t-on",
     "maxclass": "newobj",
     "text": "t b i",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "int"
     ],
     "patching_rect": [
      760.0,
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
     "id": "pack-dbg",
     "maxclass": "newobj",
     "text": "pack 0 0 0",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      760.0,
      600.0,
      80.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "i-note2",
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      860.0,
      430.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "prepend",
     "maxclass": "newobj",
     "text": "prepend note_ch_bend",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      760.0,
      630.0,
      130.0,
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
     "text": "print mpeprobe",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      760.0,
      660.0,
      100.0,
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
     "text": "i 240",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      20.0,
      330.0,
      40.0,
      20.0
     ],
     "fontname": "Arial Bold",
     "fontsize": 10.0
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
      360.0,
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
      390.0,
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
      420.0,
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
      150.0,
      420.0,
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
      450.0,
      70.0,
      20.0
     ],
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
      900.0,
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
      900.0,
      230.0,
      240.0,
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
      900.0,
      270.0,
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
      1020.0,
      270.0,
      149.0,
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
     "text": "loaded",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1160.0,
      270.0,
      58.0,
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
      900.0,
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
      1020.0,
      330.0,
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
      1020.0,
      360.0,
      64.0,
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
      1080.0,
      390.0,
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
      1020.0,
      390.0,
      50.0,
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
      1160.0,
      330.0,
      80.0,
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
      "obj-bend",
      0
     ],
     "destination": [
      "i-bend",
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
      "obj-press",
      0
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
      "s-bend-go",
      2
     ],
     "destination": [
      "s-bend-b0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-bend-b0",
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
      "s-bend-go",
      1
     ],
     "destination": [
      "s-bend-b1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-bend-b1",
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
      "s-bend-go",
      0
     ],
     "destination": [
      "s-bend-b2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "s-bend-b2",
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
      "t-trig",
      7
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
      "t-kill",
      0
     ],
     "destination": [
      "i-snd",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-snd",
      0
     ],
     "destination": [
      "sel-snd",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sel-snd",
      1
     ],
     "destination": [
      "t-f",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-f",
      3
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
      "t-f",
      2
     ],
     "destination": [
      "i-sch",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-sch",
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
      "t-f",
      1
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
      "t-f",
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
      "i-snd",
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
      "t-cn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-cn",
      2
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
      "t-cn",
      1
     ],
     "destination": [
      "expr-stb",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-cn",
      0
     ],
     "destination": [
      "expr-ch",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-chmode",
      0
     ],
     "destination": [
      "expr-ch",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-alt",
      0
     ],
     "destination": [
      "expr-stb",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-ch",
      0
     ],
     "destination": [
      "expr-sb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-sb",
      0
     ],
     "destination": [
      "s-bend-b0",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-ch",
      0
     ],
     "destination": [
      "expr-sc",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-sc",
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
      "expr-ch",
      0
     ],
     "destination": [
      "expr-sp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-sp",
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
      "expr-ch",
      0
     ],
     "destination": [
      "expr-so",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-so",
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
      "expr-ch",
      0
     ],
     "destination": [
      "i-sch",
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
      "i-bend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-bend",
      0
     ],
     "destination": [
      "expr-stb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-stb",
      0
     ],
     "destination": [
      "expr-bv",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-range",
      0
     ],
     "destination": [
      "expr-bv",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-bv",
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
      "expr-lsb",
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
      "s-bend-b1",
      1
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
      "expr-msb",
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
      "s-bend-b2",
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
      "s-bend-go",
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
      "t-sl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-sl",
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
      "t-sl",
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
      3
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
      "t-pr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-pr",
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
      "t-pr",
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
      "t-trig",
      2
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
      "i-note",
      0
     ],
     "destination": [
      "t-on",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-on",
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
      "t-on",
      1
     ],
     "destination": [
      "i-snd",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-on",
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
      "expr-ch",
      0
     ],
     "destination": [
      "pack-dbg",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expr-bv",
      0
     ],
     "destination": [
      "pack-dbg",
      2
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
      "i-note2",
      1
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
      "i-note2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "i-note2",
      0
     ],
     "destination": [
      "pack-dbg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pack-dbg",
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
      "prepend",
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
      "i-len",
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
      "dly",
      0
     ],
     "destination": [
      "i-snd",
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
      9
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
      8
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
      "t-dev",
      7
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
      "t-dev",
      6
     ],
     "destination": [
      "obj-bend",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t-dev",
      5
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
      "t-dev",
      4
     ],
     "destination": [
      "obj-press",
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
      "obj-alt",
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
      "obj-chmode",
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
      "obj-range",
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
      "print",
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
   }
  ],
  "parameters": {
   "obj-note": [
    "Note",
    "Note",
    0
   ],
   "obj-bend": [
    "Bend",
    "Bend",
    0
   ],
   "obj-slide": [
    "Slide",
    "Slide",
    0
   ],
   "obj-press": [
    "Pressure",
    "Pressure",
    0
   ],
   "obj-alt": [
    "Alternate",
    "Alternate",
    0
   ],
   "obj-chmode": [
    "Channels",
    "Channels",
    0
   ],
   "obj-range": [
    "PB Range",
    "PB Range",
    0
   ],
   "parameterbanks": {
    "0": {
     "index": 0,
     "name": "Probe",
     "parameters": [
      "Note",
      "Bend",
      "Slide",
      "Pressure",
      "Alternate",
      "Channels",
      "PB Range",
      "-"
     ]
    }
   },
   "inherited_shortname": 1
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
