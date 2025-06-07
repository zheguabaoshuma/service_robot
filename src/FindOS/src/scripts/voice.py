#!/usr/bin/env python3

import rospy
import pyaudio
import wave
from vosk import Model, KaldiRecognizer
import json
import threading
import io
from std_srvs.srv import SetBool, SetBoolResponse
from std_msgs.msg import String

FORMAT = pyaudio.paInt16  # 16位深度
CHANNELS = 1              # 单声道
RATE = 44100              # 采样率
CHUNK = 1024              # 每次读取的帧数
RECORD_SECONDS = 3        # 录制时长（秒）

class VoiceAgent:
    def __init__(self):
        self.model = Model("/home/ubuntuber/ros_se/src/voice_control/vosk-model-small-en-us-0.15")
        self.recognizer = KaldiRecognizer(self.model, RATE)
        self.audio = pyaudio.PyAudio()
        self.loop_status = False
        self.processing_list = []
        self.list_full = threading.Semaphore(0)
        self.list_empty = threading.Semaphore(10)
         # 初始化 Publisher
        self.command_pub = rospy.Publisher('voice_command', String, queue_size=10)


    def RecordSingle(self):
        rospy.loginfo('Record on')
        stream = self.audio.open(format=FORMAT,
                    channels=CHANNELS,
                    rate=RATE,
                    input=True,
                    frames_per_buffer=CHUNK)
        frames = []
        for _ in range(0, int(RATE / CHUNK * RECORD_SECONDS)):
            data = stream.read(CHUNK)
            frames.append(data)
        audio_stream = b''.join(frames)
        self.processing_list.append(audio_stream)
        stream.close()

    def AnalysisSingle(self):
        rospy.loginfo('Analysis on')
        audio_stream = self.processing_list.pop(0)
        result_text = ""
        # 直接处理音频流
        if self.recognizer.AcceptWaveform(audio_stream):
            result = self.recognizer.Result()
            result_dict = json.loads(result)
            if 'text' in result_dict:
                result_text += result_dict['text'] + " "
        rospy.loginfo(result_text)
        return result_text


    def RecordLoop(self):
        while(self.loop_status):
            self.list_empty.acquire()
            self.RecordSingle()
            self.list_full.release()

    def AnalysisLoop(self):
        while(self.loop_status):
            self.list_full.acquire()
            command = self.AnalysisSingle()
            self.list_empty.release()
            if command:  # 如果解析到有效指令
                self.command_pub.publish(command)  # 发布指令

    def start_voice(self):
        record_thread = threading.Thread(target=self.RecordLoop)
        analysis_thread = threading.Thread(target=self.AnalysisLoop)
        self.loop_status = True
        rospy.loginfo('in start voice')
        record_thread.start()
        analysis_thread.start()

    def stop_voice(self):
        self.loop_status = False
        self.processing_list = []
        self.list_full = threading.Semaphore(0)
        self.list_empty = threading.Semaphore(10)

        
    def handle_start_voice(self, req):
        if req.data:
            self.start_voice()
            return SetBoolResponse(success=True, message="Voice control started.")
        return SetBoolResponse(success=False, message="Invalid request.")
    def handle_stop_voice(self, req):
        if req.data:
            self.stop_voice()
            return SetBoolResponse(success=True, message="Voice control stopped.")
        return SetBoolResponse(success=False, message="Invalid request.")


if __name__ == '__main__':
    rospy.init_node('voice_control')
    voice_agent = VoiceAgent()
    start_service = rospy.Service('start_voice', SetBool, voice_agent.handle_start_voice)
    stop_service = rospy.Service('stop_voice', SetBool, voice_agent.handle_stop_voice)
    rospy.loginfo('Voice Service Ready')
    rospy.spin()