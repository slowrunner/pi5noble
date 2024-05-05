# SETUP 1: Ubuntu 24.04 LTS Noble Numbat 64-bit Desktop 

2024-05-03: initial

This procedure requires usb keyboard, mouse, and HDMI monitor for initial setup

After setup:  
- Load on my Pi5B 4GB processor is about x% of the processor total (load .0x/4 to .x/4)  
- Memory usage at login reports "x%" - "free -h" reports xGB free of xGB total memory  
- Disk usage xGB  
- proc temp xxC in 25C room  

*** Flash SD card with Raspberry Pi Imager or higher:  
  Select CHOOSE DEVICE: Raspberry Pi 5
  Select CHOOSE OS  
  - Other general-purpose OS->Ubuntu->Ubuntu Desktop 24.04 LTS (64-bit)  
    (Released 2024-04-25 as of this writing)

  Select CHOOSE STORAGE  
  - Select the __GB  (used 32GB) SD Card  
  - Next->Finish  (no options offered to pre-configure network/hostname/user)


=== Disable ipv6  

remove/insert SDcard
open terminal at root folder (system-boot)
nano cmdline.txt  
ctrl-e to end of line  
add at end of line with a space in front:  ipv6.disable=1  
ctrl-x y  

or  
```
cp cmdline.txt cmdline.txt.orig
sed '$ s/$/ ipv6.disable=1/' cmdline.txt >cmdline.txt.new && mv cmdline.txt.new cmdline.txt  
```

unmount microSD card

==== Ubuntu Desktop First Boot  
-insert micro SD card in Desktop Pi5 (to allow kbd/mouse/monitor)  
-power on, follow setup  
  - user: ubuntu  
  - US/New York  
  - hostname: Pi5Noble  
  - WiFi: 5GHz SSID/pw  
-(may take 30 minutes before login prompt..)  


=== CONFIGURE SUDO GROUP PASSWORD-LESS SUDO  

sudo nano /etc/sudoers  

make sudo group look like:  
```
# Allow members of group sudo to execute any command with no password  
%sudo	ALL=(ALL:ALL) NOPASSWD: ALL  
```
=== UPDATING  

- Check for unattended upgrade  
$ pgrep -a unattended  

809 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal  

ok to continue

==== DISABLE FUTURE UNATTENDED UPDATES (its a robot not a server) ===

$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades  
Change the "1" to "0" in both lines:  
```
APT::Periodic::Update-Package-Lists "0";  
APT::Periodic::Unattended-Upgrade "0";  
```

$ sudo apt purge -y unattended-upgrades  
$ sudo reboot  

After reboot, probably some packages still to upgrade:  

$ sudo apt update  
$ sudo apt upgrade -y  


