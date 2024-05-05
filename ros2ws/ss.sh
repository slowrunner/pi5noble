#!/bin/bash

echo "Usage:  . ss.sh"

echo "Setting RMW to FastDDS"
# Defaults to fastdds, but better to be explicit about it
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp

echo "sourcing jazzy setup.bash"
source /opt/ros/jazzy/setup.bash

echo "Done ss.sh"
