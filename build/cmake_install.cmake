# Install script for directory: /home/ubuntuber/ros_se/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ubuntuber/ros_se/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntuber/ros_se/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntuber/ros_se/install" TYPE PROGRAM FILES "/home/ubuntuber/ros_se/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntuber/ros_se/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntuber/ros_se/install" TYPE PROGRAM FILES "/home/ubuntuber/ros_se/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntuber/ros_se/install/setup.bash;/home/ubuntuber/ros_se/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntuber/ros_se/install" TYPE FILE FILES
    "/home/ubuntuber/ros_se/build/catkin_generated/installspace/setup.bash"
    "/home/ubuntuber/ros_se/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntuber/ros_se/install/setup.sh;/home/ubuntuber/ros_se/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntuber/ros_se/install" TYPE FILE FILES
    "/home/ubuntuber/ros_se/build/catkin_generated/installspace/setup.sh"
    "/home/ubuntuber/ros_se/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntuber/ros_se/install/setup.zsh;/home/ubuntuber/ros_se/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntuber/ros_se/install" TYPE FILE FILES
    "/home/ubuntuber/ros_se/build/catkin_generated/installspace/setup.zsh"
    "/home/ubuntuber/ros_se/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntuber/ros_se/install/setup.fish;/home/ubuntuber/ros_se/install/local_setup.fish")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntuber/ros_se/install" TYPE FILE FILES
    "/home/ubuntuber/ros_se/build/catkin_generated/installspace/setup.fish"
    "/home/ubuntuber/ros_se/build/catkin_generated/installspace/local_setup.fish"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ubuntuber/ros_se/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ubuntuber/ros_se/install" TYPE FILE FILES "/home/ubuntuber/ros_se/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ubuntuber/ros_se/build/gtest/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/dynamixel_motor_for_noetic/dynamixel_driver/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/dynamixel_motor_for_noetic/dynamixel_motor/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/dynamixel_motor_for_noetic/dynamixel_tutorials/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/freenect_stack/freenect_launch/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/freenect_stack/freenect_stack/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/dynamixel_motor_for_noetic/dynamixel_controllers/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/dynamixel_motor_for_noetic/dynamixel_msgs/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot/turtlebot/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_apps/turtlebot_apps/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot/turtlebot_bringup/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot/turtlebot_capabilities/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_viz/turtlebot_dashboard/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_simulator/turtlebot_gazebo/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_apps/turtlebot_rapps/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_viz/turtlebot_rviz_launchers/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_simulator/turtlebot_simulator/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_simulator/turtlebot_stage/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_simulator/turtlebot_stdr/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_viz/turtlebot_viz/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/kobuki_keyop/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/robot_arm/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/freenect_stack/freenect_camera/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/kobuki_bumper2pc/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/FindOS/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/room_navigation/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/template_matching/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_apps/turtlebot_actions/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_apps/turtlebot_calibration/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_viz/turtlebot_interactive_markers/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_msgs/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_apps/turtlebot_follower/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot_apps/turtlebot_navigation/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot/turtlebot_teleop/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/voice_control/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/kobuki_description/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/turtlebot/turtlebot_description/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/yocs_cmd_vel_mux/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/yocs_controllers/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/kobuki_safety_controller/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/yocs_velocity_smoother/cmake_install.cmake")
  include("/home/ubuntuber/ros_se/build/kobuki_node/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/ubuntuber/ros_se/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
