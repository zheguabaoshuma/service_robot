; Auto-generated. Do not edit!


(cl:in-package FindOS-srv)


;//! \htmlinclude navigate_msg-request.msg.html

(cl:defclass <navigate_msg-request> (roslisp-msg-protocol:ros-message)
  ((target
    :reader target
    :initarg :target
    :type cl:string
    :initform ""))
)

(cl:defclass navigate_msg-request (<navigate_msg-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <navigate_msg-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'navigate_msg-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name FindOS-srv:<navigate_msg-request> is deprecated: use FindOS-srv:navigate_msg-request instead.")))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <navigate_msg-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader FindOS-srv:target-val is deprecated.  Use FindOS-srv:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <navigate_msg-request>) ostream)
  "Serializes a message object of type '<navigate_msg-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'target))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <navigate_msg-request>) istream)
  "Deserializes a message object of type '<navigate_msg-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'target) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<navigate_msg-request>)))
  "Returns string type for a service object of type '<navigate_msg-request>"
  "FindOS/navigate_msgRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'navigate_msg-request)))
  "Returns string type for a service object of type 'navigate_msg-request"
  "FindOS/navigate_msgRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<navigate_msg-request>)))
  "Returns md5sum for a message object of type '<navigate_msg-request>"
  "95502f06d5d7105e5d4e01d38d46ad27")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'navigate_msg-request)))
  "Returns md5sum for a message object of type 'navigate_msg-request"
  "95502f06d5d7105e5d4e01d38d46ad27")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<navigate_msg-request>)))
  "Returns full string definition for message of type '<navigate_msg-request>"
  (cl:format cl:nil "string target  # 请求消息~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'navigate_msg-request)))
  "Returns full string definition for message of type 'navigate_msg-request"
  (cl:format cl:nil "string target  # 请求消息~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <navigate_msg-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'target))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <navigate_msg-request>))
  "Converts a ROS message object to a list"
  (cl:list 'navigate_msg-request
    (cl:cons ':target (target msg))
))
;//! \htmlinclude navigate_msg-response.msg.html

(cl:defclass <navigate_msg-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass navigate_msg-response (<navigate_msg-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <navigate_msg-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'navigate_msg-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name FindOS-srv:<navigate_msg-response> is deprecated: use FindOS-srv:navigate_msg-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <navigate_msg-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader FindOS-srv:result-val is deprecated.  Use FindOS-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <navigate_msg-response>) ostream)
  "Serializes a message object of type '<navigate_msg-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <navigate_msg-response>) istream)
  "Deserializes a message object of type '<navigate_msg-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<navigate_msg-response>)))
  "Returns string type for a service object of type '<navigate_msg-response>"
  "FindOS/navigate_msgResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'navigate_msg-response)))
  "Returns string type for a service object of type 'navigate_msg-response"
  "FindOS/navigate_msgResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<navigate_msg-response>)))
  "Returns md5sum for a message object of type '<navigate_msg-response>"
  "95502f06d5d7105e5d4e01d38d46ad27")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'navigate_msg-response)))
  "Returns md5sum for a message object of type 'navigate_msg-response"
  "95502f06d5d7105e5d4e01d38d46ad27")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<navigate_msg-response>)))
  "Returns full string definition for message of type '<navigate_msg-response>"
  (cl:format cl:nil "string result  # 响应消息~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'navigate_msg-response)))
  "Returns full string definition for message of type 'navigate_msg-response"
  (cl:format cl:nil "string result  # 响应消息~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <navigate_msg-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <navigate_msg-response>))
  "Converts a ROS message object to a list"
  (cl:list 'navigate_msg-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'navigate_msg)))
  'navigate_msg-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'navigate_msg)))
  'navigate_msg-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'navigate_msg)))
  "Returns string type for a service object of type '<navigate_msg>"
  "FindOS/navigate_msg")