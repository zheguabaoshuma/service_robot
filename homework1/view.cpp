#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    cv::Mat image = cv::imread("test.jpg");
    if (image.empty()) {
        std::cout << "无法加载图片！" << std::endl;
        return -1;
    }
    cv::imshow("OpenCV Test", image);
    cv::waitKey(0);
    return 0;
}
