#!/usr/bin/env python3
from cv_bridge import CvBridge, CvBridgeError
import rospy
import cv2
from sensor_msgs.msg import Image

# 初始化 CvBridge
bridge = CvBridge()


def rgb_callback(data):
    try:
        # 将 ROS 图像消息转换为 OpenCV 图像
        cv_image = bridge.imgmsg_to_cv2(data, "bgr8")

        # 显示实时相机图像
        cv2.imshow("Live Camera Feed", cv_image)
        # 等待 1 毫秒以刷新图像窗口
        cv2.waitKey(1)

    except CvBridgeError as e:
        rospy.logerr("CvBridge Error: {}".format(e))

def depth_callback(data):
    try:
        # 将 ROS 图像消息转换为 OpenCV 图像
        cv_image = bridge.imgmsg_to_cv2(data, "32FC1")

        # 显示实时相机图像
        cv2.imshow("Live Camera Feed", cv_image)
        # 等待 1 毫秒以刷新图像窗口
        cv2.waitKey(1)

    except CvBridgeError as e:
        rospy.logerr("CvBridge Error: {}".format(e))

if __name__ == "__main__":
    # 初始化 ROS 节点
    rospy.init_node("template_matching_node", anonymous=False)
    rospy.loginfo("start shot")
    # 订阅相机图像话题
    # rgb_img_topic = '/camera/rgb/image_raw'
    # rgb_image_sub = rospy.Subscriber(rgb_img_topic, Image, rgb_callback)

    depth_img_topic = '/camera/depth/image_raw'
    depth_image_sub = rospy.Subscriber(depth_img_topic, Image, depth_callback)

    # 保持节点运行
    # rospy.sleep(10)
    rospy.spin()

    # # 关闭所有 OpenCV 窗口
    # cv2.destroyAllWindows()