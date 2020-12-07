; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude AddOccupancyGrid-request.msg.html

(cl:defclass <AddOccupancyGrid-request> (roslisp-msg-protocol:ros-message)
  ((specifications_file
    :reader specifications_file
    :initarg :specifications_file
    :type cl:string
    :initform ""))
)

(cl:defclass AddOccupancyGrid-request (<AddOccupancyGrid-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddOccupancyGrid-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddOccupancyGrid-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<AddOccupancyGrid-request> is deprecated: use frongo-srv:AddOccupancyGrid-request instead.")))

(cl:ensure-generic-function 'specifications_file-val :lambda-list '(m))
(cl:defmethod specifications_file-val ((m <AddOccupancyGrid-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:specifications_file-val is deprecated.  Use frongo-srv:specifications_file instead.")
  (specifications_file m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddOccupancyGrid-request>) ostream)
  "Serializes a message object of type '<AddOccupancyGrid-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'specifications_file))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'specifications_file))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddOccupancyGrid-request>) istream)
  "Deserializes a message object of type '<AddOccupancyGrid-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'specifications_file) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'specifications_file) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddOccupancyGrid-request>)))
  "Returns string type for a service object of type '<AddOccupancyGrid-request>"
  "frongo/AddOccupancyGridRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddOccupancyGrid-request)))
  "Returns string type for a service object of type 'AddOccupancyGrid-request"
  "frongo/AddOccupancyGridRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddOccupancyGrid-request>)))
  "Returns md5sum for a message object of type '<AddOccupancyGrid-request>"
  "d80d29e273fcfeeabf6b0b84dde04fa1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddOccupancyGrid-request)))
  "Returns md5sum for a message object of type 'AddOccupancyGrid-request"
  "d80d29e273fcfeeabf6b0b84dde04fa1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddOccupancyGrid-request>)))
  "Returns full string definition for message of type '<AddOccupancyGrid-request>"
  (cl:format cl:nil "string specifications_file~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddOccupancyGrid-request)))
  "Returns full string definition for message of type 'AddOccupancyGrid-request"
  (cl:format cl:nil "string specifications_file~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddOccupancyGrid-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'specifications_file))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddOccupancyGrid-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddOccupancyGrid-request
    (cl:cons ':specifications_file (specifications_file msg))
))
;//! \htmlinclude AddOccupancyGrid-response.msg.html

(cl:defclass <AddOccupancyGrid-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AddOccupancyGrid-response (<AddOccupancyGrid-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddOccupancyGrid-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddOccupancyGrid-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<AddOccupancyGrid-response> is deprecated: use frongo-srv:AddOccupancyGrid-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <AddOccupancyGrid-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:success-val is deprecated.  Use frongo-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddOccupancyGrid-response>) ostream)
  "Serializes a message object of type '<AddOccupancyGrid-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddOccupancyGrid-response>) istream)
  "Deserializes a message object of type '<AddOccupancyGrid-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddOccupancyGrid-response>)))
  "Returns string type for a service object of type '<AddOccupancyGrid-response>"
  "frongo/AddOccupancyGridResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddOccupancyGrid-response)))
  "Returns string type for a service object of type 'AddOccupancyGrid-response"
  "frongo/AddOccupancyGridResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddOccupancyGrid-response>)))
  "Returns md5sum for a message object of type '<AddOccupancyGrid-response>"
  "d80d29e273fcfeeabf6b0b84dde04fa1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddOccupancyGrid-response)))
  "Returns md5sum for a message object of type 'AddOccupancyGrid-response"
  "d80d29e273fcfeeabf6b0b84dde04fa1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddOccupancyGrid-response>)))
  "Returns full string definition for message of type '<AddOccupancyGrid-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddOccupancyGrid-response)))
  "Returns full string definition for message of type 'AddOccupancyGrid-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddOccupancyGrid-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddOccupancyGrid-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddOccupancyGrid-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddOccupancyGrid)))
  'AddOccupancyGrid-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddOccupancyGrid)))
  'AddOccupancyGrid-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddOccupancyGrid)))
  "Returns string type for a service object of type '<AddOccupancyGrid>"
  "frongo/AddOccupancyGrid")