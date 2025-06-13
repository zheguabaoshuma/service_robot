#!/usr/bin/env python3
import rospy
from homework3.msg import CustomMessage

def callback(msg):
    rospy.loginfo(f"Python Subscriber: Data={msg.data}, Text={msg.text}")

if __name__ == "__main__":
    rospy.init_node("python_subscriber")
    rospy.Subscriber("custom_topic", CustomMessage, callback)
    rospy.spin()