### 语音控制

```shell
roslaunch turtlebot_bringup minimal.launch
rosrun voice_control voice_control.py
```

### 导航

```shell
roslaunch turtlebot_bringup minimal.launch
roslaunch turtlebot_navigation amcl_demo.launch
roslaunch turtlebot_rviz_launchers view_navigation.launch
rosrun room_navigation room_navigation.py
```

### 视觉

```shell
roslaunch turtlebot_bringup minimal.launch
roslaunch freenect_launch freenect-registered-xyzrgb.launch
# get image
rosrun template_matching shot.py
# template matching
rosrun template_matching camera.py
```

### 机械臂

```shell
roslaunch robot_arm controller_manager.launch
roslaunch robot_arm start_tilt_controller.launch
rosrun robot_arm arm_control.py
```
