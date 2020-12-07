;; Auto-generated. Do not edit!


(when (boundp 'frongo::GetModelName)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'GetModelName (find-package "FRONGO")))
(unless (find-package "FRONGO::GETMODELNAME")
  (make-package "FRONGO::GETMODELNAME"))
(unless (find-package "FRONGO::GETMODELNAMEREQUEST")
  (make-package "FRONGO::GETMODELNAMEREQUEST"))
(unless (find-package "FRONGO::GETMODELNAMERESPONSE")
  (make-package "FRONGO::GETMODELNAMERESPONSE"))

(in-package "ROS")





(defclass frongo::GetModelNameRequest
  :super ros::object
  :slots (_model_name _random_string ))

(defmethod frongo::GetModelNameRequest
  (:init
   (&key
    ((:model_name __model_name) "")
    ((:random_string __random_string) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _model_name (string __model_name))
   (setq _random_string __random_string)
   self)
  (:model_name
   (&optional __model_name)
   (if __model_name (setq _model_name __model_name)) _model_name)
  (:random_string
   (&optional __random_string)
   (if __random_string (setq _random_string __random_string)) _random_string)
  (:serialization-length
   ()
   (+
    ;; string _model_name
    4 (length _model_name)
    ;; uint32[] _random_string
    (* 4    (length _random_string)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _model_name
       (write-long (length _model_name) s) (princ _model_name s)
     ;; uint32[] _random_string
     (write-long (length _random_string) s)
     (dotimes (i (length _random_string))
       (write-long (elt _random_string i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32[] _random_string
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _random_string (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _random_string i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass frongo::GetModelNameResponse
  :super ros::object
  :slots (_model_name _random_string ))

(defmethod frongo::GetModelNameResponse
  (:init
   (&key
    ((:model_name __model_name) "")
    ((:random_string __random_string) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _model_name (string __model_name))
   (setq _random_string __random_string)
   self)
  (:model_name
   (&optional __model_name)
   (if __model_name (setq _model_name __model_name)) _model_name)
  (:random_string
   (&optional __random_string)
   (if __random_string (setq _random_string __random_string)) _random_string)
  (:serialization-length
   ()
   (+
    ;; string _model_name
    4 (length _model_name)
    ;; uint32[] _random_string
    (* 4    (length _random_string)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _model_name
       (write-long (length _model_name) s) (princ _model_name s)
     ;; uint32[] _random_string
     (write-long (length _random_string) s)
     (dotimes (i (length _random_string))
       (write-long (elt _random_string i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32[] _random_string
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _random_string (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _random_string i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass frongo::GetModelName
  :super ros::object
  :slots ())

(setf (get frongo::GetModelName :md5sum-) "9018f8bdc32329b5f34846c1b72a4a9c")
(setf (get frongo::GetModelName :datatype-) "frongo/GetModelName")
(setf (get frongo::GetModelName :request) frongo::GetModelNameRequest)
(setf (get frongo::GetModelName :response) frongo::GetModelNameResponse)

(defmethod frongo::GetModelNameRequest
  (:response () (instance frongo::GetModelNameResponse :init)))

(setf (get frongo::GetModelNameRequest :md5sum-) "9018f8bdc32329b5f34846c1b72a4a9c")
(setf (get frongo::GetModelNameRequest :datatype-) "frongo/GetModelNameRequest")
(setf (get frongo::GetModelNameRequest :definition-)
      "string model_name
uint32[] random_string
---
string model_name
uint32[] random_string

")

(setf (get frongo::GetModelNameResponse :md5sum-) "9018f8bdc32329b5f34846c1b72a4a9c")
(setf (get frongo::GetModelNameResponse :datatype-) "frongo/GetModelNameResponse")
(setf (get frongo::GetModelNameResponse :definition-)
      "string model_name
uint32[] random_string
---
string model_name
uint32[] random_string

")



(provide :frongo/GetModelName "9018f8bdc32329b5f34846c1b72a4a9c")


