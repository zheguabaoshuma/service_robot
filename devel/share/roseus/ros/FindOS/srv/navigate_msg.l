;; Auto-generated. Do not edit!


(when (boundp 'FindOS::navigate_msg)
  (if (not (find-package "FINDOS"))
    (make-package "FINDOS"))
  (shadow 'navigate_msg (find-package "FINDOS")))
(unless (find-package "FINDOS::NAVIGATE_MSG")
  (make-package "FINDOS::NAVIGATE_MSG"))
(unless (find-package "FINDOS::NAVIGATE_MSGREQUEST")
  (make-package "FINDOS::NAVIGATE_MSGREQUEST"))
(unless (find-package "FINDOS::NAVIGATE_MSGRESPONSE")
  (make-package "FINDOS::NAVIGATE_MSGRESPONSE"))

(in-package "ROS")





(defclass FindOS::navigate_msgRequest
  :super ros::object
  :slots (_target ))

(defmethod FindOS::navigate_msgRequest
  (:init
   (&key
    ((:target __target) "")
    )
   (send-super :init)
   (setq _target (string __target))
   self)
  (:target
   (&optional __target)
   (if __target (setq _target __target)) _target)
  (:serialization-length
   ()
   (+
    ;; string _target
    4 (length _target)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _target
       (write-long (length _target) s) (princ _target s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _target
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _target (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass FindOS::navigate_msgResponse
  :super ros::object
  :slots (_result ))

(defmethod FindOS::navigate_msgResponse
  (:init
   (&key
    ((:result __result) "")
    )
   (send-super :init)
   (setq _result (string __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass FindOS::navigate_msg
  :super ros::object
  :slots ())

(setf (get FindOS::navigate_msg :md5sum-) "95502f06d5d7105e5d4e01d38d46ad27")
(setf (get FindOS::navigate_msg :datatype-) "FindOS/navigate_msg")
(setf (get FindOS::navigate_msg :request) FindOS::navigate_msgRequest)
(setf (get FindOS::navigate_msg :response) FindOS::navigate_msgResponse)

(defmethod FindOS::navigate_msgRequest
  (:response () (instance FindOS::navigate_msgResponse :init)))

(setf (get FindOS::navigate_msgRequest :md5sum-) "95502f06d5d7105e5d4e01d38d46ad27")
(setf (get FindOS::navigate_msgRequest :datatype-) "FindOS/navigate_msgRequest")
(setf (get FindOS::navigate_msgRequest :definition-)
      "string target  # 请求消息
---
string result  # 响应消息
")

(setf (get FindOS::navigate_msgResponse :md5sum-) "95502f06d5d7105e5d4e01d38d46ad27")
(setf (get FindOS::navigate_msgResponse :datatype-) "FindOS/navigate_msgResponse")
(setf (get FindOS::navigate_msgResponse :definition-)
      "string target  # 请求消息
---
string result  # 响应消息
")



(provide :FindOS/navigate_msg "95502f06d5d7105e5d4e01d38d46ad27")


