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
    	- Convert the JPG to GIF.
    	- Append the new single frame GIF to the animated GIF.
    - Log debug (by default commented out) and errors.
  - Stopping the process:
    - Exit the background process.

---

- **Scripts**:
  - `start.sh`
    - Start the time lapse picture cycle.
  - `stop.sh`
    - End the time lapse picture cycle.
  - `lapse.sh`
    - The time lapse loop running in the background.
  - `snap.sh`
    - Take a single picture.

---

- **Files**:
  - `index.html`
    - Place this file in /var/www/html/.
  - `DELAY`
    - Storage for your frame rate choice.

---

* **Installs**:
  - Install Apache, gifsicle, git, and imagemagick.
    - `sudo apt install apache2`
    - `sudo apt install gifsicle`
    - `sudo apt install git`
    - `sudo apt install imagemagick`
