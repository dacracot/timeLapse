# Time Lapse

**Taking time lapse pictures with a Raspberry Pi Zero 2 W**

---

- start.sh
  - Start the time lapse picture cycle.
  - Backgrounds the process so you may log out.

- stop.sh
  - End the time lapse picture cycle.
  - Finds the background process using the process identifier.

- lapse.sh
  - The time lapse loop running in the background.
  - Script outputs standard out to lapse.out and error to lapse.err.

- movie.sh
  - Create a video from the pictures.
  - Can be run without stopping to create a video of the frames so far.

- reset.sh
  - Erase the previous pictures and zero the SEQUENCE

- snap.sh
  - Take a single picture.
  - Used by lapse.sh.

- frameRate.sh
  - Set the frame rate for the time lapse.
    - DELAY is in seconds
    - DELAY equal to 60 seconds at 60 frames per second means each hour actual is one second of video or 24 seconds per day.
    - Choose scene for one hour per second of video.
    - Choose plant for two hours per second of video.
    - Choose people for twelve minutes per second of video.
    - Set DELAY by hand for other subjects.
    
---