; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude AddCell-request.msg.html

(cl:defclass <AddCell-request> (roslisp-msg-protocol:ros-message)
  ((model_def
    :reader model_def
    :initarg :model_def
    :type cl:string
    :initform ""))
)

(cl:defclass AddCell-request (<AddCell-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddCell-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddCell-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<AddCell-request> is deprecated: use frongo-srv:AddCell-request instead.")))

(cl:ensure-generic-function 'model_def-val :lambda-list '(m))
(cl:defmethod model_def-val ((m <AddCell-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:model_def-val is deprecated.  Use frongo-srv:model_def instead.")
  (model_def m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddCell-request>) ostream)
  "Serializes a message object of type '<AddCell-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_def))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_def))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddCell-request>) istream)
  "Deserializes a message object of type '<AddCell-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddCell-request>)))
  "Returns string type for a service object of type '<AddCell-request>"
  "frongo/AddCellRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddCell-request)))
  "Returns string type for a service object of type 'AddCell-request"
  "frongo/AddCellRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddCell-request>)))
  "Returns md5sum for a message object of type '<AddCell-request>"
  "9703095a7d44bb2a973590113ee73ad2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddCell-request)))
  "Returns md5sum for a message object of type 'AddCell-request"
  "9703095a7d44bb2a973590113ee73ad2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddCell-request>)))
  "Returns full string definition for message of type '<AddCell-request>"
  (cl:format cl:nil "string model_def~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddCell-request)))
  "Returns full string definition for message of type 'AddCell-request"
  (cl:format cl:nil "string model_def~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddCell-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_def))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddCell-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddCell-request
    (cl:cons ':model_def (model_def msg))
))
;//! \htmlinclude AddCell-response.msg.html

(cl:defclass <AddCell-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AddCell-response (<AddCell-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddCell-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddCell-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<AddCell-response> is deprecated: use frongo-srv:AddCell-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <AddCell-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:result-val is deprecated.  Use frongo-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddCell-response>) ostream)
  "Serializes a message object of type '<AddCell-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddCell-response>) istream)
  "Deserializes a message object of type '<AddCell-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddCell-response>)))
  "Returns string type for a service object of type '<AddCell-response>"
  "frongo/AddCellResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddCell-response)))
  "Returns string type for a service object of type 'AddCell-response"
  "frongo/AddCellResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddCell-response>)))
  "Returns md5sum for a message object of type '<AddCell-response>"
  "9703095a7d44bb2a973590113ee73ad2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddCell-response)))
  "Returns md5sum for a message object of type 'AddCell-response"
  "9703095a7d44bb2a973590113ee73ad2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddCell-response>)))
  "Returns full string definition for message of type '<AddCell-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddCell-response)))
  "Returns full string definition for message of type 'AddCell-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddCell-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddCell-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddCell-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddCell)))
  'AddCell-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddCell)))
  'AddCell-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddCell)))
  "Returns string type for a service object of type '<AddCell>"
  "frongo/AddCell")