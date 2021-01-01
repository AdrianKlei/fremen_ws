; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude SaveGrid-request.msg.html

(cl:defclass <SaveGrid-request> (roslisp-msg-protocol:ros-message)
  ((grid_name
    :reader grid_name
    :initarg :grid_name
    :type cl:string
    :initform ""))
)

(cl:defclass SaveGrid-request (<SaveGrid-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveGrid-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveGrid-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<SaveGrid-request> is deprecated: use frongo-srv:SaveGrid-request instead.")))

(cl:ensure-generic-function 'grid_name-val :lambda-list '(m))
(cl:defmethod grid_name-val ((m <SaveGrid-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:grid_name-val is deprecated.  Use frongo-srv:grid_name instead.")
  (grid_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveGrid-request>) ostream)
  "Serializes a message object of type '<SaveGrid-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'grid_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'grid_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveGrid-request>) istream)
  "Deserializes a message object of type '<SaveGrid-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'grid_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'grid_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveGrid-request>)))
  "Returns string type for a service object of type '<SaveGrid-request>"
  "frongo/SaveGridRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveGrid-request)))
  "Returns string type for a service object of type 'SaveGrid-request"
  "frongo/SaveGridRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveGrid-request>)))
  "Returns md5sum for a message object of type '<SaveGrid-request>"
  "6090d744392c14e9793f5e7c1616c9e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveGrid-request)))
  "Returns md5sum for a message object of type 'SaveGrid-request"
  "6090d744392c14e9793f5e7c1616c9e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveGrid-request>)))
  "Returns full string definition for message of type '<SaveGrid-request>"
  (cl:format cl:nil "string grid_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveGrid-request)))
  "Returns full string definition for message of type 'SaveGrid-request"
  (cl:format cl:nil "string grid_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveGrid-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'grid_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveGrid-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveGrid-request
    (cl:cons ':grid_name (grid_name msg))
))
;//! \htmlinclude SaveGrid-response.msg.html

(cl:defclass <SaveGrid-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SaveGrid-response (<SaveGrid-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveGrid-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveGrid-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<SaveGrid-response> is deprecated: use frongo-srv:SaveGrid-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SaveGrid-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:result-val is deprecated.  Use frongo-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveGrid-response>) ostream)
  "Serializes a message object of type '<SaveGrid-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveGrid-response>) istream)
  "Deserializes a message object of type '<SaveGrid-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveGrid-response>)))
  "Returns string type for a service object of type '<SaveGrid-response>"
  "frongo/SaveGridResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveGrid-response)))
  "Returns string type for a service object of type 'SaveGrid-response"
  "frongo/SaveGridResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveGrid-response>)))
  "Returns md5sum for a message object of type '<SaveGrid-response>"
  "6090d744392c14e9793f5e7c1616c9e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveGrid-response)))
  "Returns md5sum for a message object of type 'SaveGrid-response"
  "6090d744392c14e9793f5e7c1616c9e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveGrid-response>)))
  "Returns full string definition for message of type '<SaveGrid-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveGrid-response)))
  "Returns full string definition for message of type 'SaveGrid-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveGrid-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveGrid-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveGrid-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SaveGrid)))
  'SaveGrid-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SaveGrid)))
  'SaveGrid-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveGrid)))
  "Returns string type for a service object of type '<SaveGrid>"
  "frongo/SaveGrid")