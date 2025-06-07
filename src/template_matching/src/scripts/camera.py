#!/usr/bin/env python3
from cv_bridge import CvBridge, CvBridgeError
import rospy
import cv2
from sensor_msgs.msg import Image

# 初始化 CvBridge
bridge = CvBridge()

def callback(data):
    try:
        # 将 ROS 图像消息转换为 OpenCV 图像
        cv_image = bridge.imgmsg_to_cv2(data, "bgr8")

        # 显示实时相机图像
        cv2.imshow("Live Camera Feed", cv_image)

        # 加载模板图像
        template = cv2.imread('/home/ubuntuber/ros_se/apple template resize.jpg', cv2.IMREAD_COLOR)
        # template = cv2.resize(template, (64, 64))
        cv2.imshow("template image", template)
        if template is None:
            rospy.logerr("Failed to load template image!")
            return

        # 获取模板图像的尺寸
        h, w = template.shape[:2]

        # 使用模板匹配算法
        res = cv2.matchTemplate(cv_image, template, cv2.TM_SQDIFF_NORMED)
        min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)

        # 如果匹配度足够高，则绘制矩形框
        if min_val < 0.2:  # 调整阈值以控制匹配精度
            top_left = min_loc
            bottom_right = (top_left[0] + w, top_left[1] + h)
            cv2.rectangle(cv_image, top_left, bottom_right, (0, 0, 255), 2)
            rospy.loginfo("Template matched!")

        # 显示匹配结果
        cv2.imshow("Matching Result", cv_image)

        # 等待 1 毫秒以刷新图像窗口
        cv2.waitKey(1)

    except CvBridgeError as e:
        rospy.logerr("CvBridge Error: {}".format(e))

if __name__ == "__main__":
    # 初始化 ROS 节点
    rospy.init_node("template_matching_node", anonymous=False)
    rospy.loginfo("start template matching")
    # 订阅相机图像话题
    img_topic = '/camera/rgb/image_raw'
    image_sub = rospy.Subscriber(img_topic, Image, callback)

    # 保持节点运行
    # rospy.sleep(10)
    rospy.spin()

    # # 关闭所有 OpenCV 窗口
    # cv2.destroyAllWindows()
