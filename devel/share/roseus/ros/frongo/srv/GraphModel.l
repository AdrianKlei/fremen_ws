;; Auto-generated. Do not edit!


(when (boundp 'frongo::GraphModel)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'GraphModel (find-package "FRONGO")))
(unless (find-package "FRONGO::GRAPHMODEL")
  (make-package "FRONGO::GRAPHMODEL"))
(unless (find-package "FRONGO::GRAPHMODELREQUEST")
  (make-package "FRONGO::GRAPHMODELREQUEST"))
(unless (find-package "FRONGO::GRAPHMODELRESPONSE")
  (make-package "FRONGO::GRAPHMODELRESPONSE"))

(in-package "ROS")





(defclass frongo::GraphModelRequest
  :super ros::object
  :slots (_model_name _from_val _until_val _increment ))

(defmethod frongo::GraphModelRequest
  (:init
   (&key
    ((:model_name __model_name) "")
    ((:from_val __from_val) 0)
    ((:until_val __until_val) 0)
    ((:increment __increment) 0)
    )
   (send-super :init)
   (setq _model_name (string __model_name))
   (setq _from_val (round __from_val))
   (setq _until_val (round __until_val))
   (setq _increment (round __increment))
   self)
  (:model_name
   (&optional __model_name)
   (if __model_name (setq _model_name __model_name)) _model_name)
  (:from_val
   (&optional __from_val)
   (if __from_val (setq _from_val __from_val)) _from_val)
  (:until_val
   (&optional __until_val)
   (if __until_val (setq _until_val __until_val)) _until_val)
  (:increment
   (&optional __increment)
   (if __increment (setq _increment __increment)) _increment)
  (:serialization-length
   ()
   (+
    ;; string _model_name
    4 (length _model_name)
    ;; int32 _from_val
    4
    ;; int32 _until_val
    4
    ;; int32 _increment
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _model_name
       (write-long (length _model_name) s) (princ _model_name s)
     ;; int32 _from_val
       (write-long _from_val s)
     ;; int32 _until_val
       (write-long _until_val s)
     ;; int32 _increment
       (write-long _increment s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _from_val
     (setq _from_val (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _until_val
     (setq _until_val (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _increment
     (setq _increment (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass frongo::GraphModelResponse
  :super ros::object
  :slots (_filename ))

(defmethod frongo::GraphModelResponse
  (:init
   (&key
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _filename (string __filename))
   self)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass frongo::GraphModel
  :super ros::object
  :slots ())

(setf (get frongo::GraphModel :md5sum-) "12c8011e5f49767d0aa831627309e4d7")
(setf (get frongo::GraphModel :datatype-) "frongo/GraphModel")
(setf (get frongo::GraphModel :request) frongo::GraphModelRequest)
(setf (get frongo::GraphModel :response) frongo::GraphModelResponse)

(defmethod frongo::GraphModelRequest
  (:response () (instance frongo::GraphModelResponse :init)))

(setf (get frongo::GraphModelRequest :md5sum-) "12c8011e5f49767d0aa831627309e4d7")
(setf (get frongo::GraphModelRequest :datatype-) "frongo/GraphModelRequest")
(setf (get frongo::GraphModelRequest :definition-)
      "string model_name
int32  from_val
int32  until_val
int32  increment
---
string filename

")

(setf (get frongo::GraphModelResponse :md5sum-) "12c8011e5f49767d0aa831627309e4d7")
(setf (get frongo::GraphModelResponse :datatype-) "frongo/GraphModelResponse")
(setf (get frongo::GraphModelResponse :definition-)
      "string model_name
int32  from_val
int32  until_val
int32  increment
---
string filename

")



(provide :frongo/GraphModel "12c8011e5f49767d0aa831627309e4d7")


