; Auto-generated. Do not edit!


(cl:in-package frongo-srv)


;//! \htmlinclude GetModelName-request.msg.html

(cl:defclass <GetModelName-request> (roslisp-msg-protocol:ros-message)
  ((model_name
    :reader model_name
    :initarg :model_name
    :type cl:string
    :initform "")
   (random_string
    :reader random_string
    :initarg :random_string
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass GetModelName-request (<GetModelName-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetModelName-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetModelName-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<GetModelName-request> is deprecated: use frongo-srv:GetModelName-request instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <GetModelName-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:model_name-val is deprecated.  Use frongo-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'random_string-val :lambda-list '(m))
(cl:defmethod random_string-val ((m <GetModelName-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:random_string-val is deprecated.  Use frongo-srv:random_string instead.")
  (random_string m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetModelName-request>) ostream)
  "Serializes a message object of type '<GetModelName-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'random_string))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'random_string))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetModelName-request>) istream)
  "Deserializes a message object of type '<GetModelName-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'model_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'random_string) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'random_string)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetModelName-request>)))
  "Returns string type for a service object of type '<GetModelName-request>"
  "frongo/GetModelNameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetModelName-request)))
  "Returns string type for a service object of type 'GetModelName-request"
  "frongo/GetModelNameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetModelName-request>)))
  "Returns md5sum for a message object of type '<GetModelName-request>"
  "9018f8bdc32329b5f34846c1b72a4a9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetModelName-request)))
  "Returns md5sum for a message object of type 'GetModelName-request"
  "9018f8bdc32329b5f34846c1b72a4a9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetModelName-request>)))
  "Returns full string definition for message of type '<GetModelName-request>"
  (cl:format cl:nil "string model_name~%uint32[] random_string~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetModelName-request)))
  "Returns full string definition for message of type 'GetModelName-request"
  (cl:format cl:nil "string model_name~%uint32[] random_string~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetModelName-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'random_string) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetModelName-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetModelName-request
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':random_string (random_string msg))
))
;//! \htmlinclude GetModelName-response.msg.html

(cl:defclass <GetModelName-response> (roslisp-msg-protocol:ros-message)
  ((model_name
    :reader model_name
    :initarg :model_name
    :type cl:string
    :initform "")
   (random_string
    :reader random_string
    :initarg :random_string
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass GetModelName-response (<GetModelName-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetModelName-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetModelName-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name frongo-srv:<GetModelName-response> is deprecated: use frongo-srv:GetModelName-response instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <GetModelName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:model_name-val is deprecated.  Use frongo-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'random_string-val :lambda-list '(m))
(cl:defmethod random_string-val ((m <GetModelName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader frongo-srv:random_string-val is deprecated.  Use frongo-srv:random_string instead.")
  (random_string m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetModelName-response>) ostream)
  "Serializes a message object of type '<GetModelName-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'random_string))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'random_string))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetModelName-response>) istream)
  "Deserializes a message object of type '<GetModelName-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'model_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'random_string) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'random_string)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetModelName-response>)))
  "Returns string type for a service object of type '<GetModelName-response>"
  "frongo/GetModelNameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetModelName-response)))
  "Returns string type for a service object of type 'GetModelName-response"
  "frongo/GetModelNameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetModelName-response>)))
  "Returns md5sum for a message object of type '<GetModelName-response>"
  "9018f8bdc32329b5f34846c1b72a4a9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetModelName-response)))
  "Returns md5sum for a message object of type 'GetModelName-response"
  "9018f8bdc32329b5f34846c1b72a4a9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetModelName-response>)))
  "Returns full string definition for message of type '<GetModelName-response>"
  (cl:format cl:nil "string model_name~%uint32[] random_string~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetModelName-response)))
  "Returns full string definition for message of type 'GetModelName-response"
  (cl:format cl:nil "string model_name~%uint32[] random_string~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetModelName-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'random_string) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetModelName-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetModelName-response
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':random_string (random_string msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetModelName)))
  'GetModelName-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetModelName)))
  'GetModelName-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetModelName)))
  "Returns string type for a service object of type '<GetModelName>"
  "frongo/GetModelName")