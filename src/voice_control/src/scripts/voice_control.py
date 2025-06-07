#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
import pyaudio
import wave
from vosk import Model, KaldiRecognizer
import json

FORMAT = pyaudio.paInt16  # 16位深度
CHANNELS = 1              # 单声道
RATE = 44100              # 采样率
CHUNK = 1024              # 每次读取的帧数
RECORD_SECONDS = 5        # 录制时长（秒）
OUTPUT_FILENAME = "/tmp/record.wav"  # 输出文件名
model = Model("/home/ubuntuber/ros_se/src/voice_control/vosk-model-small-en-us-0.15")
def get_voice_command():
    rospy.loginfo("Record On")
    audio = pyaudio.PyAudio()
    stream = audio.open(format=FORMAT,
                    channels=CHANNELS,
                    rate=RATE,
                    input=True,
                    frames_per_buffer=CHUNK)
    frames = []
    for _ in range(0, int(RATE / CHUNK * RECORD_SECONDS)):
        data = stream.read(CHUNK)
        frames.append(data)
    # 停止音频流
    stream.stop_stream()
    stream.close()
    audio.terminate()
    rospy.loginfo("Record Close")
    # 保存为 WAV 文件
    with wave.open(OUTPUT_FILENAME, 'wb') as wf:
        wf.setnchannels(CHANNELS)
        wf.setsampwidth(audio.get_sample_size(FORMAT))
        wf.setframerate(RATE)
        wf.writeframes(b''.join(frames))
    rospy.loginfo("开始语音识别...")
    
    wf = wave.open(OUTPUT_FILENAME, 'rb')  # 打开 WAV 文件
    rec = KaldiRecognizer(model, wf.getframerate())  # 初始化 KaldiRecognizer
    # 读取音频数据并识别
    result_text = ""
    while True:
        data = wf.readframes(4000)
        if len(data) == 0:
            break
        if rec.AcceptWaveform(data):
            result = rec.Result()
            result_dict = json.loads(result)
            if 'text' in result_dict:
                result_text += result_dict['text'] + " "
    # 输出最终结果
    final_result = rec.FinalResult()
    final_dict = json.loads(final_result)
    if 'text' in final_dict:
        result_text += final_dict['text']
    wf.close()
    rospy.loginfo("语音识别完成")
    rospy.logdebug(result_text)
    return result_text.strip()  # 返回识别结果，去掉多余的空格

    
    

class VoiceControl:
    def __init__(self):
        # 初始化 ROS 节点
        rospy.init_node("VoiceControl", anonymous=False)
        # 创建一个发布者，用于发布控制命令
        self.cmd_vel_pub = rospy.Publisher("cmd_vel_mux/input/navi", Twist, queue_size=10)
        # 设置控制命令的发布频率
        self.rate = rospy.Rate(10)
        # 初始化 Twist 消息
        self.move_cmd = Twist()
    def process_voice_command(self, command):
        """
        根据语音命令生成控制指令
        """
        command = command.lower()  # 将命令转换为小写
        if "forward" in command or "go" in command:
            # 前进
            self.move_cmd.linear.x = 0.2
            self.move_cmd.angular.z = 0.0
        elif "back" in command or "backward" in command:
            # 后退
            self.move_cmd.linear.x = -0.2
            self.move_cmd.angular.z = 0.0
        elif "left" in command:
            # 左转
            self.move_cmd.linear.x = 0.0
            self.move_cmd.angular.z = 0.5
        elif "right" in command:
            # 右转
            self.move_cmd.linear.x = 0.0
            self.move_cmd.angular.z = -0.5
        elif "stop" in command or "halt" in command:
            # 停止
            self.move_cmd.linear.x = 0.0
            self.move_cmd.angular.z = 0.0
        else:
            # 未知命令
            rospy.logwarn(f"Unknown command: {command}")
            return False
        return True
    def run(self):
        """
        主循环，等待语音输入并发布控制命令
        """
        while not rospy.is_shutdown():
            # 模拟语音输入（这里需要替换为实际的语音识别模块）
            command = get_voice_command()
            # 处理语音命令
            if self.process_voice_command(command):
                # 发布控制命令
                self.cmd_vel_pub.publish(self.move_cmd)
                rospy.loginfo(f"Executing command: {command}")
            else:
                rospy.logwarn("Invalid command, robot will not move.")
            # 按照设定的频率等待
            self.rate.sleep()
if __name__ == "__main__":
    try:
        voice_control = VoiceControl()
        voice_control.run()
    except rospy.ROSInterruptException:
        rospy.loginfo("Voice control node terminated.")

