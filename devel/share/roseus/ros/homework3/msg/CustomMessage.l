;; Auto-generated. Do not edit!


(when (boundp 'homework3::CustomMessage)
  (if (not (find-package "HOMEWORK3"))
    (make-package "HOMEWORK3"))
  (shadow 'CustomMessage (find-package "HOMEWORK3")))
(unless (find-package "HOMEWORK3::CUSTOMMESSAGE")
  (make-package "HOMEWORK3::CUSTOMMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude CustomMessage.msg.html


(defclass homework3::CustomMessage
  :super ros::object
  :slots (_data _text ))

(defmethod homework3::CustomMessage
  (:init
   (&key
    ((:data __data) 0.0)
    ((:text __text) "")
    )
   (send-super :init)
   (setq _data (float __data))
   (setq _text (string __text))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:serialization-length
   ()
   (+
    ;; float32 _data
    4
    ;; string _text
    4 (length _text)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _data
       (sys::poke _data (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _data
     (setq _data (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get homework3::CustomMessage :md5sum-) "9d91e52075ccde6ed9c15ca415ec13ae")
(setf (get homework3::CustomMessage :datatype-) "homework3/CustomMessage")
(setf (get homework3::CustomMessage :definition-)
      "float32 data
string text
")



(provide :homework3/CustomMessage "9d91e52075ccde6ed9c15ca415ec13ae")


