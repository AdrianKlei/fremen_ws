; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude EvaluateModels-request.msg.html

(cl:defclass <EvaluateModels-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass EvaluateModels-request (<EvaluateModels-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EvaluateModels-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EvaluateModels-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<EvaluateModels-request> is deprecated: use frongo-srv:EvaluateModels-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <EvaluateModels-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:data-val is deprecated.  Use frongo-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EvaluateModels-request>) ostream)
  "Serializes a message object of type '<EvaluateModels-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'data) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EvaluateModels-request>) istream)
  "Deserializes a message object of type '<EvaluateModels-request>"
    (cl:setf (cl:slot-value msg 'data) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EvaluateModels-request>)))
  "Returns string type for a service object of type '<EvaluateModels-request>"
  "frongo/EvaluateModelsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EvaluateModels-request)))
  "Returns string type for a service object of type 'EvaluateModels-request"
  "frongo/EvaluateModelsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EvaluateModels-request>)))
  "Returns md5sum for a message object of type '<EvaluateModels-request>"
  "b39707c144dc811845d1401dd6f773fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EvaluateModels-request)))
  "Returns md5sum for a message object of type 'EvaluateModels-request"
  "b39707c144dc811845d1401dd6f773fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EvaluateModels-request>)))
  "Returns full string definition for message of type '<EvaluateModels-request>"
  (cl:format cl:nil "bool data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EvaluateModels-request)))
  "Returns full string definition for message of type 'EvaluateModels-request"
  (cl:format cl:nil "bool data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EvaluateModels-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EvaluateModels-request>))
  "Converts a ROS message object to a list"
  (cl:list 'EvaluateModels-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude EvaluateModels-response.msg.html

(cl:defclass <EvaluateModels-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass EvaluateModels-response (<EvaluateModels-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EvaluateModels-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EvaluateModels-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<EvaluateModels-response> is deprecated: use frongo-srv:EvaluateModels-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <EvaluateModels-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:result-val is deprecated.  Use frongo-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EvaluateModels-response>) ostream)
  "Serializes a message object of type '<EvaluateModels-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EvaluateModels-response>) istream)
  "Deserializes a message object of type '<EvaluateModels-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EvaluateModels-response>)))
  "Returns string type for a service object of type '<EvaluateModels-response>"
  "frongo/EvaluateModelsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EvaluateModels-response)))
  "Returns string type for a service object of type 'EvaluateModels-response"
  "frongo/EvaluateModelsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EvaluateModels-response>)))
  "Returns md5sum for a message object of type '<EvaluateModels-response>"
  "b39707c144dc811845d1401dd6f773fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EvaluateModels-response)))
  "Returns md5sum for a message object of type 'EvaluateModels-response"
  "b39707c144dc811845d1401dd6f773fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EvaluateModels-response>)))
  "Returns full string definition for message of type '<EvaluateModels-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EvaluateModels-response)))
  "Returns full string definition for message of type 'EvaluateModels-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EvaluateModels-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EvaluateModels-response>))
  "Converts a ROS message object to a list"
  (cl:list 'EvaluateModels-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'EvaluateModels)))
  'EvaluateModels-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'EvaluateModels)))
  'EvaluateModels-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EvaluateModels)))
  "Returns string type for a service object of type '<EvaluateModels>"
  "frongo/EvaluateModels")