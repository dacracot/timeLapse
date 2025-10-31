# Time Lapse

**Taking time lapse pictures with a Raspberry Pi Zero 2 W**

- **Process**:
  - Starting the process:
    - If no delay interval has been set, ask the user to choose.
    - Overwrite the index.html from the Apache installation with our index.html.
    - Copy the initial animated GIF to the Apache installation.
    	- The GIF holds the parameters for frame rate of the animation.
    - Run the process in the background.
  - The running process:
    - Read the DELAY value and sleep for that duration.
    - Take a snapshot.
    	- Capture a JPG from the camera.
    	- Convert the JPG to GIF and add timestamp.
    	- Append the new single frame GIF to the animated GIF.
    - Log debug (by default commented out) and errors.
  - Stopping the process:
    - Exit the background process.

---

- **Scripts**:
  - `lapse.sh`
    - The time lapse loop running in the background.
  - `reset.sh`
    - Reset everything as if start has never been run.
  - `snap.sh`
    - Take a single picture.
  - `start.sh`
    - Start the time lapse picture cycle.
  - `stop.sh`
    - End the time lapse picture cycle.

---

- **Files**:
  - `DELAY`
    - Storage for your frame rate choice.
  - `init.gif`
    - Initial GIF with the animation parameters.
  - `lapse.err`
    - Error log from the processing.
  - `lapse.out`
    - Output log from the processing.
  - `lapse.pid`
    - Process ID for the processing.
  - `timeLapse.gif`
    - Resulting animated GIFF.

---

* **Installs**:
  - Install Apache, gifsicle, git, and imagemagick.
    - `sudo apt install apache2`
    - `sudo apt install gifsicle`
    - `sudo apt install git`
    - `sudo apt install imagemagick`




