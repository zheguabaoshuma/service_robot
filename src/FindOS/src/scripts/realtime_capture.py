#!/usr/bin/env python3
import rospy
from cv_bridge import CvBridge, CvBridgeError
import cv2
from sensor_msgs.msg import Image
from ultralytics import YOLO
from geometry_msgs.msg import Twist
from std_srvs.srv import SetBool, SetBoolResponse
# from FindOS.srv import FollowMsgResponse, FollowMsg, FollowMsgRequest
import threading

class YOLOv11RealtimeDetector:
    def __init__(self):
        """
        初始化 YOLOv11 实时检测器
        """
        self.model_path = '/home/ubuntuber/ros_se/yolo11n.pt'
        self.rgb_topic = '/camera/rgb/image_raw'
        self.depth_topic = '/camera/depth/image_raw'
        self.bridge = CvBridge()
        self.image_sub = None
        self.depth_sub = None
        self.model = YOLO(self.model_path)
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)  # 发布机器人运动指令
        self.target_object = 'person'  # 默认目标物体
        self.forward = True
        self.searching = False  # 是否正在寻找目标
        self.target_lost = False  # 目标是否丢失
        self.running_state = False
        self.follow_thread = None
        self.default_target = True
        self.image_pub = rospy.Publisher('/detection_result', Image, queue_size=10)
        rospy.loginfo("YOLOv11 Realtime Detector initialized.")

    def rgb_callback(self, data):
        """
        RGB 图像回调函数
        :param data: ROS 图像消息
        """
        try:
            # 将 ROS 图像消息转换为 OpenCV 图像
            self.rgb_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            rospy.logerr("CvBridge Error: {}".format(e))

    def depth_callback(self, data):
        """
        深度图像回调函数
        :param data: ROS 深度图像消息
        """
        try:
            # 将 ROS 深度图像消息转换为 OpenCV 图像
            self.depth_image = self.bridge.imgmsg_to_cv2(data, "passthrough")
        except CvBridgeError as e:
            rospy.logerr("CvBridge Error: {}".format(e))

    def process_images(self):
        """
        处理 RGB 和深度图像
        """
        
        if self.rgb_image is None or self.depth_image is None:
            rospy.logerr("No image")
            return
        # 显示实时 RGB 图像
        
        # cv2.imshow("Live RGB Camera Feed", self.rgb_image)
        # rospy.loginfo('here')
        # 使用 YOLOv8 模型进行检测
        results = self.model(self.rgb_image, verbose=False)
        annotated_image = results[0].plot()
        # 显示检测结果
        # cv2.imshow("Matching Result", annotated_image)
        try:
            ros_image = self.bridge.cv2_to_imgmsg(annotated_image, "bgr8")
            self.image_pub.publish(ros_image)
        except CvBridgeError as e:
            rospy.logerr("CvBridge Error: {}".format(e))
        # 如果正在寻找目标，调用 search 方法
        if self.searching:
            self.search(results)
        # 如果指定了目标物体，则调用 follow 方法
        elif self.target_object:
            self.follow(results)
        # 等待 1 毫秒以刷新图像窗口
        # cv2.waitKey(1)

    def follow(self, results):
        """
        跟踪指定物体并调整机器人朝向，然后向前移动
        :param results: YOLOv8 检测结果
        """
        target_found = False  # 当前帧是否检测到目标物体
        for result in results:
            boxes = result.boxes  # 获取检测框
            for box in boxes:
                class_id = int(box.cls)  # 类别 ID
                class_name = result.names[class_id]  # 类别名称
                # 如果检测到目标物体
                if class_name == self.target_object:
                    target_found = True
                    x1, y1, x2, y2 = map(int, box.xyxy[0])  # 获取检测框坐标
                    center_x = (x1 + x2) // 2  # 计算物体中心 X 坐标
                    center_y = (x1 + y2) // 2  # 计算物体中心 Y 坐标
                    # 计算物体中心与图像中心的偏差
                    image_center_x = self.rgb_image.shape[1] / 2
                    offset_x = center_x - image_center_x
                    # 如果偏差较大，调整机器人朝向
                    if abs(offset_x) > 50:
                        twist = Twist()
                        twist.angular.z = -0.5 if offset_x > 0 else 0.5  # 物体在右侧则右转，左侧则左转
                        self.cmd_vel_pub.publish(twist)
                        rospy.loginfo(f"Turning to align with {self.target_object}")
                        return  # 退出函数，继续调整朝向
                    # 如果偏差较小，开始向前移动
                    else:
                        # 获取深度图像中物体中心的深度值
                        depth_value = self.depth_image[center_y, center_x]
                        rospy.loginfo(f"Distance to {self.target_object}: {depth_value} meters")
                        if self.forward:
                            # 如果距离大于阈值，向前移动
                            if depth_value > 0.5:  # 假设距离阈值为 0.5 米
                                twist = Twist()
                                twist.linear.x = 0.15  # 设置线速度
                                self.cmd_vel_pub.publish(twist)
                                rospy.loginfo(f"Moving towards {self.target_object}")
                            else:
                                # 如果距离小于阈值，停止移动
                                twist = Twist()
                                self.cmd_vel_pub.publish(twist)
                                rospy.loginfo(f"Reached close to {self.target_object}")
                        return
        # 如果未检测到目标物体
        if not target_found:
            if not self.target_lost:
                rospy.loginfo(f"{self.target_object} lost, starting search...")
                self.target_lost = True
                self.searching = True  # 重新开始寻找
        else:
            self.target_lost = False  # 目标重新找到
        # 如果未检测到目标物体，停止机器人
        twist = Twist()
        self.cmd_vel_pub.publish(twist)
        rospy.loginfo("No target object detected.")

    def search(self, results):
        """
        寻找目标物体：原地旋转并检查是否存在目标物体
        :param results: YOLOv8 检测结果
        """
        for result in results:
            boxes = result.boxes  # 获取检测框
            for box in boxes:
                class_id = int(box.cls)  # 类别 ID
                class_name = result.names[class_id]  # 类别名称
                # 如果检测到目标物体
                if class_name == self.target_object:
                    # rospy.loginfo(f"Found {self.target_object}, stopping rotation.")
                    self.searching = False  # 停止寻找
                    self.target_lost = False  # 目标重新找到
                    return  # 退出函数，进入跟踪模式
        # 如果未检测到目标物体，继续旋转
        twist = Twist()
        twist.angular.z = 0.3  # 设置旋转速度（正值为逆时针，负值为顺时针）
        self.cmd_vel_pub.publish(twist)
        rospy.loginfo("Rotating to search for target object...")

    def start_capture(self):
        """
        开始实时检测
        """
        rospy.loginfo('Start capture, subscribing...')
        try:
            self.image_sub = rospy.Subscriber(self.rgb_topic, Image, self.rgb_callback)
            self.depth_sub = rospy.Subscriber(self.depth_topic, Image, self.depth_callback)
            rospy.loginfo('Subscribed successfully.')
        except Exception as e:
            rospy.logerr('Failed to subscribe: {}'.format(e))
            return
        # 等待用户输入目标物体名称
        if self.default_target:
            self.target_object = input('Enter the name of the object to follow (or press Enter to skip): ')
        if self.target_object:
            rospy.loginfo(f'Tracking object: {self.target_object}')
        # 开始寻找目标物体
        self.searching = True
        # 主循环
        rate = rospy.Rate(10)  # 10 Hz
        rospy.loginfo("rospy status: %s" %rospy.is_shutdown())
        while not rospy.is_shutdown():
            self.process_images()
            rate.sleep()
            if not self.running_state:
                break
        # 停止订阅并关闭窗口
        if self.image_sub:
            self.image_sub.unregister()
        if self.depth_sub:
            self.depth_sub.unregister()
        cv2.destroyAllWindows()
        rospy.loginfo('Capture stopped and windows closed.')

def handle_start_capture(req):
    """
    处理启动/停止捕获的请求
    :param req: 请求数据
    """
    state = req.data
    if state:
        detector.running_state = state
        detector.follow_thread = threading.Thread(target=detector.start_capture)
        detector.follow_thread.start()
    else:
        detector.running_state = state

    return SetBoolResponse(True, "Capture state updated.")

# def handle_follow(req):
#     detector.target_object = req.target
#     detector.default_target = False
#     detector.running_state = True
#     detector.follow_thread = threading.Thread(target=detector.start_capture)
#     detector.follow_thread.start()
#     return FollowMsgResponse(f'Start Follow {detector.target_object}')

if __name__ == "__main__":
    rospy.init_node('yolov11_realtime_detector')
    detector = YOLOv11RealtimeDetector()
    # 提供启动/停止捕获的服务
    service = rospy.Service('start_capture', SetBool, handle_start_capture)
    # follow_service = rospy.Service('follow', FollowMsg, handle_follow)
    rospy.loginfo("YOLOv11 Realtime Detector node is ready.")
    rospy.spin()
