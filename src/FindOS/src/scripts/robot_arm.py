#!/usr/bin/env python3
import rospy
from std_msgs.msg import Float64
from std_srvs.srv import SetBool, SetBoolResponse

class RobotArmAgent:
    def __init__(self):
        self.seized = False
        self.tilt_joint = rospy.Publisher('/tilt_controller/command', Float64, queue_size=10)
        self.joint1_joint = rospy.Publisher('/joint1_controller/command', Float64, queue_size=10)
        self.joint2_joint = rospy.Publisher('/joint2_controller/command', Float64, queue_size=10)
        self.joint3_joint = rospy.Publisher('/joint3_controller/command', Float64, queue_size=10)
        self.joint4_joint = rospy.Publisher('/joint4_controller/command', Float64, queue_size=10)

        self.zero_point = 2.61
        self.horizon_point = 1.04
        self.seized_point = 2.00
        rospy.sleep(3)
        rospy.loginfo('Robot Arm Initialized.')

    def Seize(self):
        if not self.seized:
            self.joint4_joint.publish(self.seized_point)
            rospy.sleep(1)
            self.seized = True
    def Release(self):
        if self.seized:
            self.joint4_joint.publish(self.zero_point)
            rospy.sleep(1)
            self.seized = False
    
    def Reset(self):
        self.tilt_joint.publish(self.zero_point)
        self.joint1_joint.publish(self.zero_point)
        self.joint2_joint.publish(self.zero_point)
        self.joint3_joint.publish(self.horizon_point)
        self.joint4_joint.publish(self.zero_point)
        rospy.sleep(3)

    def handle_seize(self, req):
        if req.data:
            self.Seize()
            return SetBoolResponse(success=True, message="Arm Seized.")
        return SetBoolResponse(success=False, message="Invalid request.")
    
    def handle_release(self, req):
        if req.data:
            self.Release()
            return SetBoolResponse(success=True, message="Arm Released.")
        return SetBoolResponse(success=False, message="Invalid request.")
    
if __name__ == '__main__':
    rospy.init_node('robot_arm_agent')
    robot_arm_agent = RobotArmAgent()
    seized_service = rospy.Service('seize', SetBool, robot_arm_agent.handle_seize)
    release_service = rospy.Service('release', SetBool, robot_arm_agent.handle_release)
    robot_arm_agent.Reset()
    rospy.loginfo('Robot Arm Service Ready')
    rospy.spin()