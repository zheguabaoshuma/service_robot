#!/usr/bin/env python3
import rospy
import math
import actionlib
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose, PoseWithCovarianceStamped, Point, Quaternion, Twist, PoseStamped
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf.transformations import quaternion_from_euler

ACTION_MOVE_BASE = 'move_base'
FRAME_MAP = 'map'
FRAME_BASE = 'base_frame'

class Navigation:
    def __init__(self):
        rospy.on_shutdown(self.clean_up)
        self.move_base = actionlib.SimpleActionClient(ACTION_MOVE_BASE, MoveBaseAction)
        rospy.loginfo('Waiting for move_base action server')
        self.move_base.wait_for_server(rospy.Duration(120))
        rospy.loginfo('Connect to move_base server')
        self.map_robot_pose = [0,0,0]
        self.move_base_running = False
        self.blocking = True
        rospy.loginfo('Ready to go')
        rospy.sleep(1)

    def goto(self, target, blocking=True):
        yaw = target[2] / 180 * math.pi
        quaternion = quaternion_from_euler(0, 0, yaw)
        target_pose = Pose(Point(target[0], target[1], 0), Quaternion(*quaternion))
        # 创建 PoseStamped 对象
        target_pose_stamped = PoseStamped()
        target_pose_stamped.header.frame_id = FRAME_MAP
        target_pose_stamped.header.stamp = rospy.Time.now()
        target_pose_stamped.pose = target_pose
        # 设置 MoveBaseGoal
        self.goal = MoveBaseGoal()
        self.goal.target_pose = target_pose_stamped
        rospy.loginfo('Going to target: %s' % target)
        self.move_base.send_goal(self.goal)
        if blocking:
            waiting = self.move_base.wait_for_result()
            if not waiting:
                rospy.logerr('Action server not available')
            else:
                rospy.loginfo('Navigation result: %s' % self.move_base.get_result())

    
    def clean_up(self):
        rospy.loginfo('Shutting down navigation')

def get_user_input():
    """从终端获取用户输入的坐标"""
    while True:
        try:
            input_str = input("请输入目标坐标 (x, y, yaw)，用空格分隔 (例如 '1.8 0.15 0')，或输入 'q' 退出: ")
            if input_str.lower() == 'q':
                return None
            parts = input_str.split()
            if len(parts) != 3:
                print("输入格式错误，请输入三个数字，例如 '1.8 0.15 0'")
                continue
            x, y, yaw = map(float, parts)
            return [x, y, yaw]
        except ValueError:
            print("输入格式错误，请输入三个数字，例如 '1.8 0.15 0'")
if __name__ == '__main__':
    rospy.init_node('room_navigation')
    nav = Navigation()
    while not rospy.is_shutdown():
        target = get_user_input()
        if target is None:
            break
        nav.goto(target)