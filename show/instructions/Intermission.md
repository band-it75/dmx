# Configuring Intermission

This cue provides a neutral lighting state between songs. Follow these steps to
set it up.

1. Launch DMXControl 3.3.0 and open your show project.
2. In **Device Control**, assign the Stage Lights (LumiPar 12UAW5 #1–3) to a
   group called `Stage` if it is not already created.
3. Create a new cue and name it **Intermission**.
4. For the `Stage` group, set a static warm white around 40 % intensity.
5. Select the **Karaoke Corner** fixtures and pick a soft peach hue in the color
   picker.
6. Ensure all **Music Lights** and the **Smoke Machine** channels are set to 0.
7. Click **Store** to save this cue in the cue list.
8. Drag **Intermission** to the top of the cue stack so it plays whenever the
   show starts.
9. In the **Audio Analyzer**, configure a trigger that activates this cue when
   the average VU level over the last 10 s falls below your end threshold.
10. Likewise create a separate trigger that moves to **Slow Pace** when the VU
    level rises above your start threshold.
