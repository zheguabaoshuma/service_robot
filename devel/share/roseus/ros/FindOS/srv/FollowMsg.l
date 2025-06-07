;; Auto-generated. Do not edit!


(when (boundp 'FindOS::FollowMsg)
  (if (not (find-package "FINDOS"))
    (make-package "FINDOS"))
  (shadow 'FollowMsg (find-package "FINDOS")))
(unless (find-package "FINDOS::FOLLOWMSG")
  (make-package "FINDOS::FOLLOWMSG"))
(unless (find-package "FINDOS::FOLLOWMSGREQUEST")
  (make-package "FINDOS::FOLLOWMSGREQUEST"))
(unless (find-package "FINDOS::FOLLOWMSGRESPONSE")
  (make-package "FINDOS::FOLLOWMSGRESPONSE"))

(in-package "ROS")





(defclass FindOS::FollowMsgRequest
  :super ros::object
  :slots (_target ))

(defmethod FindOS::FollowMsgRequest
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

(defclass FindOS::FollowMsgResponse
  :super ros::object
  :slots (_result ))

(defmethod FindOS::FollowMsgResponse
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

(defclass FindOS::FollowMsg
  :super ros::object
  :slots ())

(setf (get FindOS::FollowMsg :md5sum-) "95502f06d5d7105e5d4e01d38d46ad27")
(setf (get FindOS::FollowMsg :datatype-) "FindOS/FollowMsg")
(setf (get FindOS::FollowMsg :request) FindOS::FollowMsgRequest)
(setf (get FindOS::FollowMsg :response) FindOS::FollowMsgResponse)

(defmethod FindOS::FollowMsgRequest
  (:response () (instance FindOS::FollowMsgResponse :init)))

(setf (get FindOS::FollowMsgRequest :md5sum-) "95502f06d5d7105e5d4e01d38d46ad27")
(setf (get FindOS::FollowMsgRequest :datatype-) "FindOS/FollowMsgRequest")
(setf (get FindOS::FollowMsgRequest :definition-)
      "string target  # 请求消息
---
string result  # 响应消息
")

(setf (get FindOS::FollowMsgResponse :md5sum-) "95502f06d5d7105e5d4e01d38d46ad27")
(setf (get FindOS::FollowMsgResponse :datatype-) "FindOS/FollowMsgResponse")
(setf (get FindOS::FollowMsgResponse :definition-)
      "string target  # 请求消息
---
string result  # 响应消息
")



(provide :FindOS/FollowMsg "95502f06d5d7105e5d4e01d38d46ad27")


