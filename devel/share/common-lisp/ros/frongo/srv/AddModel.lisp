; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude AddModel-request.msg.html

(cl:defclass <AddModel-request> (roslisp-msg-protocol:ros-message)
  ((model_def
    :reader model_def
    :initarg :model_def
    :type cl:string
    :initform ""))
)

(cl:defclass AddModel-request (<AddModel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddModel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddModel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<AddModel-request> is deprecated: use frongo-srv:AddModel-request instead.")))

(cl:ensure-generic-function 'model_def-val :lambda-list '(m))
(cl:defmethod model_def-val ((m <AddModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:model_def-val is deprecated.  Use frongo-srv:model_def instead.")
  (model_def m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddModel-request>) ostream)
  "Serializes a message object of type '<AddModel-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_def))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_def))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddModel-request>) istream)
  "Deserializes a message object of type '<AddModel-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_def) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'model_def) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddModel-request>)))
  "Returns string type for a service object of type '<AddModel-request>"
  "frongo/AddModelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddModel-request)))
  "Returns string type for a service object of type 'AddModel-request"
  "frongo/AddModelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddModel-request>)))
  "Returns md5sum for a message object of type '<AddModel-request>"
  "9703095a7d44bb2a973590113ee73ad2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddModel-request)))
  "Returns md5sum for a message object of type 'AddModel-request"
  "9703095a7d44bb2a973590113ee73ad2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddModel-request>)))
  "Returns full string definition for message of type '<AddModel-request>"
  (cl:format cl:nil "string model_def~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddModel-request)))
  "Returns full string definition for message of type 'AddModel-request"
  (cl:format cl:nil "string model_def~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddModel-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_def))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddModel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddModel-request
    (cl:cons ':model_def (model_def msg))
))
;//! \htmlinclude AddModel-response.msg.html

(cl:defclass <AddModel-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AddModel-response (<AddModel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddModel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddModel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<AddModel-response> is deprecated: use frongo-srv:AddModel-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <AddModel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:result-val is deprecated.  Use frongo-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddModel-response>) ostream)
  "Serializes a message object of type '<AddModel-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddModel-response>) istream)
  "Deserializes a message object of type '<AddModel-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddModel-response>)))
  "Returns string type for a service object of type '<AddModel-response>"
  "frongo/AddModelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddModel-response)))
  "Returns string type for a service object of type 'AddModel-response"
  "frongo/AddModelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddModel-response>)))
  "Returns md5sum for a message object of type '<AddModel-response>"
  "9703095a7d44bb2a973590113ee73ad2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddModel-response)))
  "Returns md5sum for a message object of type 'AddModel-response"
  "9703095a7d44bb2a973590113ee73ad2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddModel-response>)))
  "Returns full string definition for message of type '<AddModel-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddModel-response)))
  "Returns full string definition for message of type 'AddModel-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddModel-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddModel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddModel-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddModel)))
  'AddModel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddModel)))
  'AddModel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddModel)))
  "Returns string type for a service object of type '<AddModel>"
  "frongo/AddModel")