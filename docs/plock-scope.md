# P-lock scope on Push 3 (Stage 3)

These are the results of TESTING.md S3.1–S3.6: how a Push 3 step p-lock behaves on PitchBender's parameters. Tested with v2.1 on Push 3 Standalone on 2026-11-10.

| Test | Question | Result |
|---|---|---|
| S3.1 | After locking step 5 to G1, what do the other steps play? | C1: only step 5 plays G1. |
| S3.2 | What shape is the Note envelope in Live? | Not checked (the envelope couldn't be viewed). S3.1 and S3.3 show it behaves like a step covering only its own step. |
| S3.3 | With step 9 also locked to A♯1, what do steps 6–8 and 10–16 play? | C1. |
| S3.4 | Turning Note with no step held: do unlocked steps follow, and do locked steps keep their values? | Live shows the parameter as overridden, and **all** steps follow the knob, locked ones included. |
| S3.5 | Velocity and Length locked on step 13: same as Note? | Yes, same as Note. |
| S3.6 | After clearing step 5's lock, does it go back to the unlocked value? | Yes. |

## Conclusion

**A Push step p-lock applies to its own step only.** Unlocked steps play the parameter's base value, so the device needs no special handling for steps after a lock. Reading the parameters fresh on every trigger, as since Stage 1, is enough.

**Turning a locked parameter by hand overrides its locks.** This is Live's standard automation behaviour: a manual change switches that parameter's automation off, so every step follows the knob until automation is re-enabled (Live's **Re-enable Automation** button, or its equivalent on Push). It isn't a device bug, and the locks aren't lost. Two things follow:

- To change the base value of a parameter that has locks, re-enable automation afterwards, or the locks stay silenced.
- The user docs (README) should say this once the device is finished.
