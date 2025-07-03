# DMXControl 3.3.0 Configuration Guide

This document explains how to set up DMXControl 3.3.0 with the **Audio Analyzer** plugin. The Audio Analyzer allows cues and effects to react to audio input (such as music or applause) in real time.

## 1. Launch DMXControl

1. Install DMXControl 3.3.0 if not already installed.
2. Start DMXControl and create or open your project.

## 2. Enable the Audio Analyzer Plugin

1. Go to **Settings → Plugin Manager**.
2. Locate **Audio Analyzer** in the list and check the **Enable** box.
3. Restart DMXControl when prompted so the plugin loads correctly.

## 3. Configure the Audio Analyzer

1. After DMXControl restarts, open **Show Editor** and add the **Audio Analyzer** to a free layer.
2. Double-click the newly created Audio Analyzer node to open its properties.
3. In the **Input Source** field, choose the audio device (e.g., your sound card or loopback driver).
4. Adjust the **FFT size** and **smoothing** settings as needed for your system.
5. Click **OK** to save.

## 4. Creating Triggers

1. Right-click the Audio Analyzer node and select **Add Trigger**.
2. Choose the frequency band or VU level that should start the trigger.
3. Pick an **action** such as firing a cue, activating a light effect or increasing intensity.
4. Repeat for as many triggers as required for your show.

## 5. Example: Linking to a Cue

1. Create a cue called **Applause** (see `Applause.md` for details).
2. Add a trigger with **High VU** as the condition and set the action to **Activate cue “Applause”**.
3. Set **Hold time** to keep the cue active for about 10 seconds.
4. Optionally, add another trigger using **Low VU** to return to the **Intermission** cue.

## 6. Saving Your Setup

1. Press **Ctrl+S** to save the project file.
2. Test the audio detection by playing music and watching the DMX output respond.
3. Adjust trigger thresholds if the lights fire too early or too late.

Detailed step-by-step guides for creating each cue are available in these files:

* `Intermission.md`
* `Slow_Pace.md`
* `Medium_Pace.md`
* `High_Pace.md`
* `Applause.md`

They explain exactly which fixtures to adjust and how to link each cue to Audio
Analyzer triggers.
