# Time Lapse

**Taking time lapse pictures with a Raspberry Pi Zero 2 W**

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

* **Installse**:
  - Install git, Java, sqlite, Apache, sshpass, etc.
    - `sudo apt install apache2`
    - `sudo apt install gifsicle`
    - `sudo apt install git`