#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ubuntuber/ros_se/src/dynamixel_motor_for_noetic/dynamixel_controllers"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ubuntuber/ros_se/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ubuntuber/ros_se/install/lib/python3/dist-packages:/home/ubuntuber/ros_se/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ubuntuber/ros_se/build" \
    "/usr/bin/python3" \
    "/home/ubuntuber/ros_se/src/dynamixel_motor_for_noetic/dynamixel_controllers/setup.py" \
     \
    build --build-base "/home/ubuntuber/ros_se/build/dynamixel_motor_for_noetic/dynamixel_controllers" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ubuntuber/ros_se/install" --install-scripts="/home/ubuntuber/ros_se/install/bin"
