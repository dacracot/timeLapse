# Time Lapse

**Taking time lapse pictures with a Raspberry Pi Zero 2 W**

- start.sh to start taking pictures
- stop.sh to stop taking pictures
- change DELAY in monitor.sh to adjust the time interval
  - DELAY should be chosen based upon the video quality expected
    - DELAY is in seconds
    - 60 frames per second video is good, 30 frames per second is ok
    - DELAY equal to 60 seconds at 60 frames per second means each hour actual is one second of video or 24 seconds per day