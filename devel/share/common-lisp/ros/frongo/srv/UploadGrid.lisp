; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude UploadGrid-request.msg.html

(cl:defclass <UploadGrid-request> (roslisp-msg-protocol:ros-message)
  ((grid_name
    :reader grid_name
    :initarg :grid_name
    :type cl:string
    :initform ""))
)

(cl:defclass UploadGrid-request (<UploadGrid-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UploadGrid-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UploadGrid-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<UploadGrid-request> is deprecated: use frongo-srv:UploadGrid-request instead.")))

(cl:ensure-generic-function 'grid_name-val :lambda-list '(m))
(cl:defmethod grid_name-val ((m <UploadGrid-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:grid_name-val is deprecated.  Use frongo-srv:grid_name instead.")
  (grid_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UploadGrid-request>) ostream)
  "Serializes a message object of type '<UploadGrid-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'grid_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'grid_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UploadGrid-request>) istream)
  "Deserializes a message object of type '<UploadGrid-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UploadGrid-request>)))
  "Returns string type for a service object of type '<UploadGrid-request>"
  "frongo/UploadGridRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UploadGrid-request)))
  "Returns string type for a service object of type 'UploadGrid-request"
  "frongo/UploadGridRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UploadGrid-request>)))
  "Returns md5sum for a message object of type '<UploadGrid-request>"
  "6090d744392c14e9793f5e7c1616c9e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UploadGrid-request)))
  "Returns md5sum for a message object of type 'UploadGrid-request"
  "6090d744392c14e9793f5e7c1616c9e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UploadGrid-request>)))
  "Returns full string definition for message of type '<UploadGrid-request>"
  (cl:format cl:nil "string grid_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UploadGrid-request)))
  "Returns full string definition for message of type 'UploadGrid-request"
  (cl:format cl:nil "string grid_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UploadGrid-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'grid_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UploadGrid-request>))
  "Converts a ROS message object to a list"
  (cl:list 'UploadGrid-request
    (cl:cons ':grid_name (grid_name msg))
))
;//! \htmlinclude UploadGrid-response.msg.html

(cl:defclass <UploadGrid-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass UploadGrid-response (<UploadGrid-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UploadGrid-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UploadGrid-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<UploadGrid-response> is deprecated: use frongo-srv:UploadGrid-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <UploadGrid-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:result-val is deprecated.  Use frongo-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UploadGrid-response>) ostream)
  "Serializes a message object of type '<UploadGrid-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UploadGrid-response>) istream)
  "Deserializes a message object of type '<UploadGrid-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UploadGrid-response>)))
  "Returns string type for a service object of type '<UploadGrid-response>"
  "frongo/UploadGridResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UploadGrid-response)))
  "Returns string type for a service object of type 'UploadGrid-response"
  "frongo/UploadGridResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UploadGrid-response>)))
  "Returns md5sum for a message object of type '<UploadGrid-response>"
  "6090d744392c14e9793f5e7c1616c9e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UploadGrid-response)))
  "Returns md5sum for a message object of type 'UploadGrid-response"
  "6090d744392c14e9793f5e7c1616c9e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UploadGrid-response>)))
  "Returns full string definition for message of type '<UploadGrid-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UploadGrid-response)))
  "Returns full string definition for message of type 'UploadGrid-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UploadGrid-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UploadGrid-response>))
  "Converts a ROS message object to a list"
  (cl:list 'UploadGrid-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'UploadGrid)))
  'UploadGrid-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'UploadGrid)))
  'UploadGrid-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UploadGrid)))
  "Returns string type for a service object of type '<UploadGrid>"
  "frongo/UploadGrid")