#include <ros/ros.h>
#include "homework3/CustomMessage.h"

int main(int argc, char **argv) {
    ros::init(argc, argv, "cpp_publisher");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<homework3::CustomMessage>("custom_topic", 10);

    ros::Rate rate(1); // 发布频率1Hz
    int count = 0;

    while (ros::ok()) {
        homework3::CustomMessage msg;
        msg.data = 3.14 + count;  // 示例浮点数
        msg.text = "Count: " + std::to_string(count);

        ROS_INFO("C++ Publisher: Data=%.2f, Text=%s", msg.data, msg.text.c_str());
        pub.publish(msg);

        rate.sleep();
        count++;
    }
    return 0;
}