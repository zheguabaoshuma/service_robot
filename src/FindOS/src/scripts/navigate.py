#!/usr/bin/env python3
import rospy
import math
import actionlib
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose, PoseWithCovarianceStamped, Point, Quaternion, Twist, PoseStamped
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf.transformations import quaternion_from_euler
from std_msgs.msg import String
from std_srvs.srv import SetBool, SetBoolResponse
import traceback
from FindOS.srv import navigate_msg, navigate_msgRequest, navigate_msgResponse
import threading

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
        self.map_robot_pose = [0, 0, 0]
        self.move_base_running = False
        self.blocking = True
        self.target_dict = {
            'classroom': [6.87, -3.4, 0],
            'home': [0, 0, 0],
            'point': [6.52, -11.1, 0]
        }
        rospy.loginfo('Ready to go')
        self.goto_thread = None
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
                rospy.loginfo('Navigation Finished')

    def handle_navigation(self, req):
        target = req.target
        if target in self.target_dict:
            pos = self.target_dict[target]
            self.goto_thread = threading.Thread(target=self.goto, args=(pos, True))
            self.goto_thread.start()
            return navigate_msgResponse(f"Navigating to {target} at position {pos}")
        else:
            return navigate_msgResponse(f"Target {target} not found in the dictionary.")
        
    def clean_up(self):
        rospy.loginfo('Shutting down navigation')

if __name__ == '__main__':
    try:
        rospy.init_node('navigate_agent')
        nav = Navigation()
        navigate_service = rospy.Service('/goto', navigate_msg, nav.handle_navigation)
        rospy.loginfo("Navigation service is ready.")
        rospy.spin()
    except Exception as e:
        rospy.logerr(f"An error occurred: {e}")
        traceback.print_exc()
    finally:
        input("Press Enter to exit...")
