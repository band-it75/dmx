# VU-Based Show Triggers

The lighting show automatically starts and ends based on the microphone VU levels.

* **Show Start**: When the average VU level over the last 10 seconds rises above your start threshold, DMXControl should transition from **Intermission** into the first active scenario (typically **Slow Pace**).
* **Show End**: When the average VU falls below the end threshold for 10 seconds, fade into **Applause** and then back to **Intermission**.

These triggers ensure the lighting reacts naturally to the performance without manual cues.
