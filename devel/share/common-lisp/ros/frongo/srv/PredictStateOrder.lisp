; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude PredictStateOrder-request.msg.html

(cl:defclass <PredictStateOrder-request> (roslisp-msg-protocol:ros-message)
  ((model_name
    :reader model_name
    :initarg :model_name
    :type cl:string
    :initform "")
   (order
    :reader order
    :initarg :order
    :type cl:integer
    :initform 0)
   (epochs
    :reader epochs
    :initarg :epochs
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass PredictStateOrder-request (<PredictStateOrder-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredictStateOrder-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredictStateOrder-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<PredictStateOrder-request> is deprecated: use frongo-srv:PredictStateOrder-request instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <PredictStateOrder-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:model_name-val is deprecated.  Use frongo-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'order-val :lambda-list '(m))
(cl:defmethod order-val ((m <PredictStateOrder-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:order-val is deprecated.  Use frongo-srv:order instead.")
  (order m))

(cl:ensure-generic-function 'epochs-val :lambda-list '(m))
(cl:defmethod epochs-val ((m <PredictStateOrder-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:epochs-val is deprecated.  Use frongo-srv:epochs instead.")
  (epochs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredictStateOrder-request>) ostream)
  "Serializes a message object of type '<PredictStateOrder-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_name))
  (cl:let* ((signed (cl:slot-value msg 'order)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'epochs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'epochs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredictStateOrder-request>) istream)
  "Deserializes a message object of type '<PredictStateOrder-request>"
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
      (cl:setf (cl:slot-value msg 'order) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'epochs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'epochs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredictStateOrder-request>)))
  "Returns string type for a service object of type '<PredictStateOrder-request>"
  "frongo/PredictStateOrderRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictStateOrder-request)))
  "Returns string type for a service object of type 'PredictStateOrder-request"
  "frongo/PredictStateOrderRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredictStateOrder-request>)))
  "Returns md5sum for a message object of type '<PredictStateOrder-request>"
  "ae1fcb161afd95e17d99e9fd38349e36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredictStateOrder-request)))
  "Returns md5sum for a message object of type 'PredictStateOrder-request"
  "ae1fcb161afd95e17d99e9fd38349e36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredictStateOrder-request>)))
  "Returns full string definition for message of type '<PredictStateOrder-request>"
  (cl:format cl:nil "string model_name~%int32    order~%uint32[] epochs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredictStateOrder-request)))
  "Returns full string definition for message of type 'PredictStateOrder-request"
  (cl:format cl:nil "string model_name~%int32    order~%uint32[] epochs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredictStateOrder-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'epochs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredictStateOrder-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PredictStateOrder-request
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':order (order msg))
    (cl:cons ':epochs (epochs msg))
))
;//! \htmlinclude PredictStateOrder-response.msg.html

(cl:defclass <PredictStateOrder-response> (roslisp-msg-protocol:ros-message)
  ((epochs
    :reader epochs
    :initarg :epochs
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (predictions
    :reader predictions
    :initarg :predictions
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass PredictStateOrder-response (<PredictStateOrder-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredictStateOrder-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredictStateOrder-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<PredictStateOrder-response> is deprecated: use frongo-srv:PredictStateOrder-response instead.")))

(cl:ensure-generic-function 'epochs-val :lambda-list '(m))
(cl:defmethod epochs-val ((m <PredictStateOrder-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:epochs-val is deprecated.  Use frongo-srv:epochs instead.")
  (epochs m))

(cl:ensure-generic-function 'predictions-val :lambda-list '(m))
(cl:defmethod predictions-val ((m <PredictStateOrder-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:predictions-val is deprecated.  Use frongo-srv:predictions instead.")
  (predictions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredictStateOrder-response>) ostream)
  "Serializes a message object of type '<PredictStateOrder-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'epochs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'epochs))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'predictions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'predictions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredictStateOrder-response>) istream)
  "Deserializes a message object of type '<PredictStateOrder-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'epochs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'epochs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'predictions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'predictions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredictStateOrder-response>)))
  "Returns string type for a service object of type '<PredictStateOrder-response>"
  "frongo/PredictStateOrderResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictStateOrder-response)))
  "Returns string type for a service object of type 'PredictStateOrder-response"
  "frongo/PredictStateOrderResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredictStateOrder-response>)))
  "Returns md5sum for a message object of type '<PredictStateOrder-response>"
  "ae1fcb161afd95e17d99e9fd38349e36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredictStateOrder-response)))
  "Returns md5sum for a message object of type 'PredictStateOrder-response"
  "ae1fcb161afd95e17d99e9fd38349e36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredictStateOrder-response>)))
  "Returns full string definition for message of type '<PredictStateOrder-response>"
  (cl:format cl:nil "uint32[] epochs~%float64[] predictions~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredictStateOrder-response)))
  "Returns full string definition for message of type 'PredictStateOrder-response"
  (cl:format cl:nil "uint32[] epochs~%float64[] predictions~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredictStateOrder-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'epochs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'predictions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredictStateOrder-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PredictStateOrder-response
    (cl:cons ':epochs (epochs msg))
    (cl:cons ':predictions (predictions msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PredictStateOrder)))
  'PredictStateOrder-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PredictStateOrder)))
  'PredictStateOrder-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictStateOrder)))
  "Returns string type for a service object of type '<PredictStateOrder>"
  "frongo/PredictStateOrder")