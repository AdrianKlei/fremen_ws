;; Auto-generated. Do not edit!


(when (boundp 'frongo::PredictStateOrder)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'PredictStateOrder (find-package "FRONGO")))
(unless (find-package "FRONGO::PREDICTSTATEORDER")
  (make-package "FRONGO::PREDICTSTATEORDER"))
(unless (find-package "FRONGO::PREDICTSTATEORDERREQUEST")
  (make-package "FRONGO::PREDICTSTATEORDERREQUEST"))
(unless (find-package "FRONGO::PREDICTSTATEORDERRESPONSE")
  (make-package "FRONGO::PREDICTSTATEORDERRESPONSE"))

(in-package "ROS")





(defclass frongo::PredictStateOrderRequest
  :super ros::object
  :slots (_model_name _order _epochs ))

(defmethod frongo::PredictStateOrderRequest
  (:init
   (&key
    ((:model_name __model_name) "")
    ((:order __order) 0)
    ((:epochs __epochs) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _model_name (string __model_name))
   (setq _order (round __order))
   (setq _epochs __epochs)
   self)
  (:model_name
   (&optional __model_name)
   (if __model_name (setq _model_name __model_name)) _model_name)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:epochs
   (&optional __epochs)
   (if __epochs (setq _epochs __epochs)) _epochs)
  (:serialization-length
   ()
   (+
    ;; string _model_name
    4 (length _model_name)
    ;; int32 _order
    4
    ;; uint32[] _epochs
    (* 4    (length _epochs)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _model_name
       (write-long (length _model_name) s) (princ _model_name s)
     ;; int32 _order
       (write-long _order s)
     ;; uint32[] _epochs
     (write-long (length _epochs) s)
     (dotimes (i (length _epochs))
       (write-long (elt _epochs i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _order
     (setq _order (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32[] _epochs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _epochs (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _epochs i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass frongo::PredictStateOrderResponse
  :super ros::object
  :slots (_epochs _predictions ))

(defmethod frongo::PredictStateOrderResponse
  (:init
   (&key
    ((:epochs __epochs) (make-array 0 :initial-element 0 :element-type :integer))
    ((:predictions __predictions) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _epochs __epochs)
   (setq _predictions __predictions)
   self)
  (:epochs
   (&optional __epochs)
   (if __epochs (setq _epochs __epochs)) _epochs)
  (:predictions
   (&optional __predictions)
   (if __predictions (setq _predictions __predictions)) _predictions)
  (:serialization-length
   ()
   (+
    ;; uint32[] _epochs
    (* 4    (length _epochs)) 4
    ;; float64[] _predictions
    (* 8    (length _predictions)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32[] _epochs
     (write-long (length _epochs) s)
     (dotimes (i (length _epochs))
       (write-long (elt _epochs i) s)
       )
     ;; float64[] _predictions
     (write-long (length _predictions) s)
     (dotimes (i (length _predictions))
       (sys::poke (elt _predictions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32[] _epochs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _epochs (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _epochs i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float64[] _predictions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _predictions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _predictions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass frongo::PredictStateOrder
  :super ros::object
  :slots ())

(setf (get frongo::PredictStateOrder :md5sum-) "ae1fcb161afd95e17d99e9fd38349e36")
(setf (get frongo::PredictStateOrder :datatype-) "frongo/PredictStateOrder")
(setf (get frongo::PredictStateOrder :request) frongo::PredictStateOrderRequest)
(setf (get frongo::PredictStateOrder :response) frongo::PredictStateOrderResponse)

(defmethod frongo::PredictStateOrderRequest
  (:response () (instance frongo::PredictStateOrderResponse :init)))

(setf (get frongo::PredictStateOrderRequest :md5sum-) "ae1fcb161afd95e17d99e9fd38349e36")
(setf (get frongo::PredictStateOrderRequest :datatype-) "frongo/PredictStateOrderRequest")
(setf (get frongo::PredictStateOrderRequest :definition-)
      "string model_name
int32    order
uint32[] epochs
---
uint32[] epochs
float64[] predictions

")

(setf (get frongo::PredictStateOrderResponse :md5sum-) "ae1fcb161afd95e17d99e9fd38349e36")
(setf (get frongo::PredictStateOrderResponse :datatype-) "frongo/PredictStateOrderResponse")
(setf (get frongo::PredictStateOrderResponse :definition-)
      "string model_name
int32    order
uint32[] epochs
---
uint32[] epochs
float64[] predictions

")



(provide :frongo/PredictStateOrder "ae1fcb161afd95e17d99e9fd38349e36")


