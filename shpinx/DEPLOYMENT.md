# How to use sphinx and bebop_autonomy 
## How to connect to the virtual drone if you already have bebop_autonomy and Sphinx installed
make sure that you have sourced the setup.bash/.zsh:
```
source ~/<your_work_space>/devel/setup.zsh
```

open a new terminal and make sure the firmwared is installed as a systemd (you have to to this every time)
```sudo systemctl start firmwared.service```

Check if the firmwared is working:

```fdc ping```

You should get one

 ```PONG```

Go to 
```/opt/parrot-sphinx/usr/share/sphinx/drones/``` 
open your ```.drone``` file (e.g.,```bebop2.drone```).
You have to change it like this:
(You can make a copy of the original file ```bebop2.drone``` to perserve it. Create a new file like ```bebop2_n.drone```.
Low GPU and No fornt camera for now!
You can remove the stolenWIFI line.
```
<?xml version="1.0" encoding="UTF-8"?>
<drone
  name="bebop2"
  firmware="http://plf.parrot.com/sphinx/firmwares/ardrone3/milos_pc/latest/images/ardrone3-milos_pc.ext2.zip"
  hardware="milosboard">
  <machine_params
    low_gpu="1"
    with_front_cam="0"
    with_hd_battery="0"
    with_flir="0"
    flir_pos="tilted"/>
  <pose>default</pose>
  <interface>eth1</interface>
</drone>
```
Save the file and start the simulator:
```
sphinx /opt/parrot-sphinx/usr/share/sphinx/drones/bebop2.drone
```
It may take some time for the machine to download the firmware form the internet.

## Now connect to the bebop_autonomy
```roslaunch bebop_driver bebop_node.launch ip:=10.202.0.1```
###### NOTE: The virtual drone ip would change every time you start a new instance of Sphinx, although it always follows this format ```10.202.X.1```. ```x``` starts at ```0``` and will be incremented with when Sphinx is restarted.

To confirm the ip:
```
ping 10.202.0.1
```
The answer should look like this:

```
PING 10.202.0.1 (10.202.0.1) 56(84) bytes of data.
64 bytes from 10.202.0.1: icmp_seq=1 ttl=64 time=0.033 ms
64 bytes from 10.202.0.1: icmp_seq=2 ttl=64 time=0.023 ms
 ```
Launch ```bebop_node.lanuch``` when you make sure it is working:
```
roslaunch bebop_driver bebop_node.launch ip:=10.202.0.1

```
Igonore the errors, if they are constantly being thrown. 

Now you can takeoff:
```
rostopic pub --once bebop/takeoff std_msgs/Empty
```
land:
```
rostopic pub --once bebop/takeoff std_msgs/Empty
```
or even use telep
```
rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=bebop/cmd_vel
```

