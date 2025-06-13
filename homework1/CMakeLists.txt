cmake_minimum_required(VERSION 3.12)
project(TestOpenCV)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(test_opencv view.cpp)
target_link_libraries(test_opencv ${OpenCV_LIBS})
