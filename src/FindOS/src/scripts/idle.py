#!/usr/bin/env python3
import rospy
from std_srvs.srv import SetBool, SetBoolRequest
from std_msgs.msg import String
import threading
import traceback
from FindOS.srv import navigate_msgResponse, navigate_msg, navigate_msgRequest
# from FindOS.srv import FollowMsg, FollowMsgRequest, FollowMsgResponse

command_buffer = []

def voice_command_callback(msg):
    command = msg.data
    rospy.loginfo(f"Received voice command: {command}")
    command_buffer.append(str(command))
    buffer_full.release()

if __name__ == "__main__":
    try:
        rospy.init_node('FindOS')
        rospy.loginfo("Main control node started.")
        is_voice = False
        rospy.Subscriber('/voice/voice_command', String, voice_command_callback)
        buffer_full = threading.Semaphore(0)
        while not rospy.is_shutdown():
            print("Enter a command (capture/stop capture/quit/voice control/stop voice):")
            if not is_voice:
                command = input().strip()
            else:
                buffer_full.acquire()
                command = command_buffer.pop(0).strip()
                print(command)
            if command == 'capture':
                rospy.wait_for_service('/detector/start_capture')
                try:
                    start_capture = rospy.ServiceProxy('/detector/start_capture', SetBool)
                    resp = start_capture(True)
                    rospy.loginfo(resp.message)
                except rospy.ServiceException as e:
                    rospy.logerr("Service call failed: {}".format(e))
            elif command == 'stop capture':
                rospy.wait_for_service('/detector/start_capture')
                try:
                    stop_capture = rospy.ServiceProxy('/detector/start_capture', SetBool)
                    resp = stop_capture(False)
                    rospy.loginfo(resp.message)
                except rospy.ServiceException as e:
                    rospy.logerr("Service call failed: {}".format(e))
            elif command == 'voice control':
                is_voice = True
                rospy.wait_for_service('/voice/start_voice')
                try:
                    start_voice = rospy.ServiceProxy('/voice/start_voice', SetBool)
                    resp = start_voice(True)
                    rospy.loginfo(resp.message)
                except rospy.ServiceException as e:
                    rospy.logerr("Service call failed: {}".format(e))
            elif command == 'stop voice':
                is_voice = False
                rospy.wait_for_service('/voice/stop_voice')
                try:
                    stop_voice = rospy.ServiceProxy('/voice/stop_voice', SetBool)
                    resp = stop_voice(True)
                    rospy.loginfo(resp.message)
                except rospy.ServiceException as e:
                    rospy.logerr("Service call failed: {}".format(e))
            elif command == 'seize':
                rospy.wait_for_service('/arm/seize')
                try:
                    seize_action = rospy.ServiceProxy('/arm/seize', SetBool)
                    resp = seize_action(True)
                    rospy.loginfo(resp.message)
                except rospy.ServiceException as e:
                    rospy.logerr("Service call failed: {}".format(e))
            elif command == 'release':
                rospy.wait_for_service('/arm/release')
                try:
                    release_action = rospy.ServiceProxy('/arm/release', SetBool)
                    resp = release_action(True)
                    rospy.loginfo(resp.message)
                except rospy.ServiceException as e:
                    rospy.logerr("Service call failed: {}".format(e))
            elif 'go to' in command:
                target = command.replace('go to', '').strip()
                rospy.wait_for_service('/goto')
                try:
                    navigate = rospy.ServiceProxy('/goto', navigate_msg)
                    req = navigate_msgRequest(target=target)  # 创建请求对象
                    resp = navigate(req)
                    rospy.loginfo(f"Navigation to {target} started. Response: {resp.result}")
                except rospy.ServiceException as e:
                    rospy.logerr("Service call failed: {}".format(e))
            # elif 'follow' in command:
            #     target = command.replace('follow', '').strip()
            #     rospy.wait_for_service('/detector/follow')
            #     try:
            #         follow = rospy.ServiceProxy('/detector/follow', FollowMsg)
            #         req = FollowMsgRequest(target=target)
            #         resp = follow(req)
            #         rospy.loginfo(f'Start to follow {target}')
            #     except rospy.ServiceException as e:
            #         rospy.logerr("Service call failed: {}".format(e))
                
            elif command == 'quit':
                break
        rospy.loginfo("Main control node stopped.")
        rospy.spin()
    except Exception as e:
        rospy.logerr(f"An error occurred: {e}")
        traceback.print_exc()
    finally:
        input("Press Enter to exit...")
