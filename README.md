# Time Lapse

**Taking time lapse pictures with a Raspberry Pi Zero 2 W**

---

- start.sh
  - Start the time lapse picture cycle.

- stop.sh
  - End the time lapse picture cycle.

- lapse.sh
  - The time lapse loop running in the background.

- movie.sh
  - Create a video from the pictures.

- reset.sh
  - Erase the previous pictures and zero the SEQUENCE

- snap.sh
  - Take a single picture.

---

- change DELAY in lapse.sh to adjust the time interval
  - DELAY should be chosen based upon the video quality expected
    - DELAY is in seconds
    - 60 frames per second video is good, 30 frames per second is ok
    - DELAY equal to 60 seconds at 60 frames per second means each hour actual is one second of video or 24 seconds per day
    
---
