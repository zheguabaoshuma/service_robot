; Auto-generated. Do not edit!


(cl:in-package FindOS-srv)


;//! \htmlinclude FollowMsg-request.msg.html

(cl:defclass <FollowMsg-request> (roslisp-msg-protocol:ros-message)
  ((target
    :reader target
    :initarg :target
    :type cl:string
    :initform ""))
)

(cl:defclass FollowMsg-request (<FollowMsg-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FollowMsg-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FollowMsg-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name FindOS-srv:<FollowMsg-request> is deprecated: use FindOS-srv:FollowMsg-request instead.")))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <FollowMsg-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader FindOS-srv:target-val is deprecated.  Use FindOS-srv:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FollowMsg-request>) ostream)
  "Serializes a message object of type '<FollowMsg-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'target))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FollowMsg-request>) istream)
  "Deserializes a message object of type '<FollowMsg-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FollowMsg-request>)))
  "Returns string type for a service object of type '<FollowMsg-request>"
  "FindOS/FollowMsgRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FollowMsg-request)))
  "Returns string type for a service object of type 'FollowMsg-request"
  "FindOS/FollowMsgRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FollowMsg-request>)))
  "Returns md5sum for a message object of type '<FollowMsg-request>"
  "95502f06d5d7105e5d4e01d38d46ad27")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FollowMsg-request)))
  "Returns md5sum for a message object of type 'FollowMsg-request"
  "95502f06d5d7105e5d4e01d38d46ad27")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FollowMsg-request>)))
  "Returns full string definition for message of type '<FollowMsg-request>"
  (cl:format cl:nil "string target  # 请求消息~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FollowMsg-request)))
  "Returns full string definition for message of type 'FollowMsg-request"
  (cl:format cl:nil "string target  # 请求消息~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FollowMsg-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'target))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FollowMsg-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FollowMsg-request
    (cl:cons ':target (target msg))
))
;//! \htmlinclude FollowMsg-response.msg.html

(cl:defclass <FollowMsg-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass FollowMsg-response (<FollowMsg-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FollowMsg-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FollowMsg-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name FindOS-srv:<FollowMsg-response> is deprecated: use FindOS-srv:FollowMsg-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <FollowMsg-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader FindOS-srv:result-val is deprecated.  Use FindOS-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FollowMsg-response>) ostream)
  "Serializes a message object of type '<FollowMsg-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FollowMsg-response>) istream)
  "Deserializes a message object of type '<FollowMsg-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FollowMsg-response>)))
  "Returns string type for a service object of type '<FollowMsg-response>"
  "FindOS/FollowMsgResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FollowMsg-response)))
  "Returns string type for a service object of type 'FollowMsg-response"
  "FindOS/FollowMsgResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FollowMsg-response>)))
  "Returns md5sum for a message object of type '<FollowMsg-response>"
  "95502f06d5d7105e5d4e01d38d46ad27")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FollowMsg-response)))
  "Returns md5sum for a message object of type 'FollowMsg-response"
  "95502f06d5d7105e5d4e01d38d46ad27")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FollowMsg-response>)))
  "Returns full string definition for message of type '<FollowMsg-response>"
  (cl:format cl:nil "string result  # 响应消息~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FollowMsg-response)))
  "Returns full string definition for message of type 'FollowMsg-response"
  (cl:format cl:nil "string result  # 响应消息~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FollowMsg-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FollowMsg-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FollowMsg-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FollowMsg)))
  'FollowMsg-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FollowMsg)))
  'FollowMsg-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FollowMsg)))
  "Returns string type for a service object of type '<FollowMsg>"
  "FindOS/FollowMsg")