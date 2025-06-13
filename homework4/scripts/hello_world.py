#!/usr/bin/env python3
import rospy

if __name__ == "__main__":
    rospy.init_node('hello_node')
    rospy.loginfo('hello world')
    rospy.spin()