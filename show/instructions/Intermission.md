# Configuring Intermission

1. Open DMXControl 3.3.0 and load your project.
2. Assign the Stage Lights (LumiPar 12UAW5 #1–3) to a group called `Stage`.
3. Create a static scene with warm white dimmer values around 40% for the `Stage` group.
4. Set Karaoke Corner fixtures to a soft peach color using the color picker.
5. Ensure all music lights and the smoke machine channels are set to 0 (off).
6. Store this configuration as a cue named **Intermission** in the cue list.
7. Link this cue after **Applause** so the show returns to a calm state
   automatically.
8. Create an automation rule that starts the show when the
   average VU level during the last 10 seconds rises above your
   start threshold. Likewise, return to **Intermission** when that
   10-second average falls below the end threshold.
