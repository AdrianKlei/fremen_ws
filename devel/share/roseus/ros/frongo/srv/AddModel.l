;; Auto-generated. Do not edit!


(when (boundp 'frongo::AddModel)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'AddModel (find-package "FRONGO")))
(unless (find-package "FRONGO::ADDMODEL")
  (make-package "FRONGO::ADDMODEL"))
(unless (find-package "FRONGO::ADDMODELREQUEST")
  (make-package "FRONGO::ADDMODELREQUEST"))
(unless (find-package "FRONGO::ADDMODELRESPONSE")
  (make-package "FRONGO::ADDMODELRESPONSE"))

(in-package "ROS")





(defclass frongo::AddModelRequest
  :super ros::object
  :slots (_model_def ))

(defmethod frongo::AddModelRequest
  (:init
   (&key
    ((:model_def __model_def) "")
    )
   (send-super :init)
   (setq _model_def (string __model_def))
   self)
  (:model_def
   (&optional __model_def)
   (if __model_def (setq _model_def __model_def)) _model_def)
  (:serialization-length
   ()
   (+
    ;; string _model_def
    4 (length _model_def)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _model_def
       (write-long (length _model_def) s) (princ _model_def s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _model_def
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_def (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass frongo::AddModelResponse
  :super ros::object
  :slots (_result ))

(defmethod frongo::AddModelResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass frongo::AddModel
  :super ros::object
  :slots ())

(setf (get frongo::AddModel :md5sum-) "9703095a7d44bb2a973590113ee73ad2")
(setf (get frongo::AddModel :datatype-) "frongo/AddModel")
(setf (get frongo::AddModel :request) frongo::AddModelRequest)
(setf (get frongo::AddModel :response) frongo::AddModelResponse)

(defmethod frongo::AddModelRequest
  (:response () (instance frongo::AddModelResponse :init)))

(setf (get frongo::AddModelRequest :md5sum-) "9703095a7d44bb2a973590113ee73ad2")
(setf (get frongo::AddModelRequest :datatype-) "frongo/AddModelRequest")
(setf (get frongo::AddModelRequest :definition-)
      "string model_def
---
bool result

")

(setf (get frongo::AddModelResponse :md5sum-) "9703095a7d44bb2a973590113ee73ad2")
(setf (get frongo::AddModelResponse :datatype-) "frongo/AddModelResponse")
(setf (get frongo::AddModelResponse :definition-)
      "string model_def
---
bool result

")



(provide :frongo/AddModel "9703095a7d44bb2a973590113ee73ad2")


