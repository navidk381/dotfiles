#!/bin/sh
#run: chmod +x sphinx-dev.sh

# Set Session Name
SESSION="Sphinx"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Pane and start zsh
    tmux rename-window -t 0 'Main'
    tmux split-window -v
    tmux split-window -v
    tmux select-pane -U  #go up #-D, -L, -R, or -U is used, respectively the pane below, to the left, to the right, or above the target pane is used
    tmux select-pane -U
    tmux split-window -v 
    tmux  select-pane -U
    #########################
    tmux split-window -h
    tmux select-pane -D
    tmux split-window -h
    tmux select-pane -D
    tmux split-window -h
    tmux select-pane -D
    tmux split-window -h
    tmux send-keys -t 'Main' 'sphinx ~/myrepo/sim_sphinx/worlds/tag_2020-06-14--14-07-12.world' #C-m = Enter 
    tmux select-pane -D
    tmux send-keys -t 'Main' 'rostopic pub --once /Drone/autoflight_vicon/start std_msgs/Empty'   #C-m = Enter 

    tmux select-pane -L
    tmux send-keys -t 'Main' 'rostopic pub --once Drone/ardrone/takeoff std_msgs/Empty'
    tmux select-pane -D
    tmux send-keys -t 'Main' 'rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=/Drone/cmd_vel'  
    tmux select-pane -R
    tmux send-keys -t 'Main' 'rviz'
    tmux select-pane -D
    tmux send-keys -t 'Main' 'roslaunch dsl__projects__construction gz_apriltag.launch'
    tmux select-pane -L
    tmux send-keys -t 'Main' 'sudo systemctl start firmwared.service' C-m
    # # setup Writing window
    # tmux new-window -t $SESSION:2 -n 'Writing'
    # tmux send-keys -t 'Writing' "nvim" C-m

    # # Setup an additional shell
    # tmux new-window -t $SESSION:3 -n 'Shell'
    # tmux send-keys -t 'Shell' "zsh" C-m 'clear' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
