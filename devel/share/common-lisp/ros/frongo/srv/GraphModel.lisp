; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude GraphModel-request.msg.html

(cl:defclass <GraphModel-request> (roslisp-msg-protocol:ros-message)
  ((model_name
    :reader model_name
    :initarg :model_name
    :type cl:string
    :initform "")
   (from_val
    :reader from_val
    :initarg :from_val
    :type cl:integer
    :initform 0)
   (until_val
    :reader until_val
    :initarg :until_val
    :type cl:integer
    :initform 0)
   (increment
    :reader increment
    :initarg :increment
    :type cl:integer
    :initform 0))
)

(cl:defclass GraphModel-request (<GraphModel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraphModel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraphModel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<GraphModel-request> is deprecated: use frongo-srv:GraphModel-request instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <GraphModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:model_name-val is deprecated.  Use frongo-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'from_val-val :lambda-list '(m))
(cl:defmethod from_val-val ((m <GraphModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:from_val-val is deprecated.  Use frongo-srv:from_val instead.")
  (from_val m))

(cl:ensure-generic-function 'until_val-val :lambda-list '(m))
(cl:defmethod until_val-val ((m <GraphModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:until_val-val is deprecated.  Use frongo-srv:until_val instead.")
  (until_val m))

(cl:ensure-generic-function 'increment-val :lambda-list '(m))
(cl:defmethod increment-val ((m <GraphModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:increment-val is deprecated.  Use frongo-srv:increment instead.")
  (increment m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraphModel-request>) ostream)
  "Serializes a message object of type '<GraphModel-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_name))
  (cl:let* ((signed (cl:slot-value msg 'from_val)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'until_val)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'increment)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraphModel-request>) istream)
  "Deserializes a message object of type '<GraphModel-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'model_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'from_val) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'until_val) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'increment) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraphModel-request>)))
  "Returns string type for a service object of type '<GraphModel-request>"
  "frongo/GraphModelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphModel-request)))
  "Returns string type for a service object of type 'GraphModel-request"
  "frongo/GraphModelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraphModel-request>)))
  "Returns md5sum for a message object of type '<GraphModel-request>"
  "12c8011e5f49767d0aa831627309e4d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraphModel-request)))
  "Returns md5sum for a message object of type 'GraphModel-request"
  "12c8011e5f49767d0aa831627309e4d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraphModel-request>)))
  "Returns full string definition for message of type '<GraphModel-request>"
  (cl:format cl:nil "string model_name~%int32  from_val~%int32  until_val~%int32  increment~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraphModel-request)))
  "Returns full string definition for message of type 'GraphModel-request"
  (cl:format cl:nil "string model_name~%int32  from_val~%int32  until_val~%int32  increment~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraphModel-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraphModel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GraphModel-request
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':from_val (from_val msg))
    (cl:cons ':until_val (until_val msg))
    (cl:cons ':increment (increment msg))
))
;//! \htmlinclude GraphModel-response.msg.html

(cl:defclass <GraphModel-response> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform ""))
)

(cl:defclass GraphModel-response (<GraphModel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraphModel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraphModel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<GraphModel-response> is deprecated: use frongo-srv:GraphModel-response instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <GraphModel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:filename-val is deprecated.  Use frongo-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraphModel-response>) ostream)
  "Serializes a message object of type '<GraphModel-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraphModel-response>) istream)
  "Deserializes a message object of type '<GraphModel-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraphModel-response>)))
  "Returns string type for a service object of type '<GraphModel-response>"
  "frongo/GraphModelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphModel-response)))
  "Returns string type for a service object of type 'GraphModel-response"
  "frongo/GraphModelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraphModel-response>)))
  "Returns md5sum for a message object of type '<GraphModel-response>"
  "12c8011e5f49767d0aa831627309e4d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraphModel-response)))
  "Returns md5sum for a message object of type 'GraphModel-response"
  "12c8011e5f49767d0aa831627309e4d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraphModel-response>)))
  "Returns full string definition for message of type '<GraphModel-response>"
  (cl:format cl:nil "string filename~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraphModel-response)))
  "Returns full string definition for message of type 'GraphModel-response"
  (cl:format cl:nil "string filename~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraphModel-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraphModel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GraphModel-response
    (cl:cons ':filename (filename msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GraphModel)))
  'GraphModel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GraphModel)))
  'GraphModel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphModel)))
  "Returns string type for a service object of type '<GraphModel>"
  "frongo/GraphModel")