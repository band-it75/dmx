# Configuring Applause

Use these steps to build a dynamic applause scene that plays whenever the
Audio Analyzer detects the song ending.

1. In **Show Editor**, create a new cue named **Applause** and place it after
   **Slow Pace** in the cue list.
2. Right‑click the **Audio Analyzer** node and choose **Add Trigger**. Set the
   condition to **Low VU for 10 s** and select **Activate cue “Applause”** as the
   action.
3. In the cue, blackout the **Stage** group and add a **strobe** effect that
   runs for about two seconds at 20 Hz.
4. Select the **Karaoke Corner** group and apply a fast **sine wave** color
   effect to create shimmering pulses.
5. Set **Music Lights** to strobe when the trigger fires. Add a 360° spin macro
   to the **PixieWash** moving head so it sweeps across the audience.
6. Insert a short smoke burst in the timeline to coincide with the light peak.
7. Add an **AutoLink** so that after 10 seconds the playback transitions back to
   the **Intermission** cue.
8. Save the cue and test by playing a song and letting the audio level fall to
   ensure the trigger activates correctly.
