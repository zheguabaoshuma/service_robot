#!/usr/bin/env python3
import rospy
from std_msgs.msg import Float64

class RunningLoop:
    def __init__(self):
        rospy.on_shutdown(self.cleanup)
        self.tilt_joint = rospy.Publisher('/tilt_controller/command', Float64, queue_size=10)
        self.joint1_joint = rospy.Publisher('/joint1_controller/command', Float64, queue_size=10)
        self.joint2_joint = rospy.Publisher('/joint2_controller/command', Float64, queue_size=10)
        self.joint3_joint = rospy.Publisher('/joint3_controller/command', Float64, queue_size=10)
        self.joint4_joint = rospy.Publisher('/joint4_controller/command', Float64, queue_size=10)
        self.tilt_pos = Float64()
        self.joint1_pos = Float64()
        self.joint2_pos = Float64()
        self.joint3_pos = Float64()
        self.joint4_pos = Float64()
        self.tilt_pos = 0
        self.joint1_pos = 2.61
        self.joint2_pos = 2.61
        self.joint3_pos = 2.61
        self.joint4_pos = 2.61
        self.tilt_joint.publish(self.tilt_pos)
        self.joint1_joint.publish(self.joint1_pos)
        self.joint2_joint.publish(self.joint2_pos)
        self.joint3_joint.publish(self.joint3_pos)
        self.joint4_joint.publish(self.joint4_pos)
        rospy.sleep(3)

        # self.tilt_joint.publish(0)
        # rospy.loginfo('spin to 0rad')
        # rospy.sleep(10)
        # self.tilt_joint.publish(2.61)
        # rospy.loginfo('spin to 2.61rad')
        # rospy.sleep(10)

        while not rospy.is_shutdown():
            rospy.loginfo('spin to 2.51')
            pos1 = 2.41
            self.tilt_pos = pos1
            self.joint1_pos = pos1
            self.joint2_pos = pos1
            self.joint3_pos = pos1
            self.joint4_pos = pos1
            self.tilt_joint.publish(self.tilt_pos)
            self.joint1_joint.publish(self.joint1_pos)
            self.joint2_joint.publish(self.joint2_pos)
            self.joint3_joint.publish(self.joint3_pos)
            self.joint4_joint.publish(self.joint4_pos)
            rospy.sleep(3)

            rospy.loginfo('spin to 2.71')
            pos1 = 2.81
            self.tilt_pos = pos1
            self.joint1_pos = pos1
            self.joint2_pos = pos1
            self.joint3_pos = pos1
            self.joint4_pos = pos1
            self.tilt_joint.publish(self.tilt_pos)
            self.joint1_joint.publish(self.joint1_pos)
            self.joint2_joint.publish(self.joint2_pos)
            self.joint3_joint.publish(self.joint3_pos)
            self.joint4_joint.publish(self.joint4_pos)
            rospy.sleep(3)

    def cleanup(self):
        rospy.loginfo("Shutting down robot arm ...")


if __name__ == "__main__":
    rospy.init_node('arm')
    try:
        RunningLoop()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass