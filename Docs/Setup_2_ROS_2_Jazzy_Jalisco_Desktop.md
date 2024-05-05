# Setup 2 ROS 2 Jazzy Jalisco Desktop


https://docs.ros.org/en/jazzy/Installation.html

https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debians.html

performed talker/listener successfully

* ==== ROS2CLI  https://github.com/ros2/ros2cli  

Issue:  https://github.com/osrf/ros2_test_cases/issues/1429


* ==== RQT  

To see if wayland or x11 window manager:

$ loginctl    to get session (one with SEAT has display)
$ loginctl show-session 28 -p Type
Type=x11   or Type=wayland

Login defaults to wayland, after selecting ubuntu user at login, gear icon appears lower right.
Click->ubuntu on Xorg to use X11 window manager.



# SETUP Ubuntu Noble 24.04 / ROS 2 Jazzy Jalisco on VMware Fusion MacOS
- Downloaded iso
- Set to 8 cores, 8GB memory
- chose basic desktop install, format/erase disk ok
- ROS 2 Noble:
   Follow https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debians.html
