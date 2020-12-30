;; Auto-generated. Do not edit!


(when (boundp 'frongo::EvaluateModels)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'EvaluateModels (find-package "FRONGO")))
(unless (find-package "FRONGO::EVALUATEMODELS")
  (make-package "FRONGO::EVALUATEMODELS"))
(unless (find-package "FRONGO::EVALUATEMODELSREQUEST")
  (make-package "FRONGO::EVALUATEMODELSREQUEST"))
(unless (find-package "FRONGO::EVALUATEMODELSRESPONSE")
  (make-package "FRONGO::EVALUATEMODELSRESPONSE"))

(in-package "ROS")





(defclass frongo::EvaluateModelsRequest
  :super ros::object
  :slots (_data ))

(defmethod frongo::EvaluateModelsRequest
  (:init
   (&key
    ((:data __data) nil)
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; bool _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _data
       (if _data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _data
     (setq _data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass frongo::EvaluateModelsResponse
  :super ros::object
  :slots (_result ))

(defmethod frongo::EvaluateModelsResponse
  (:init
   (&key
    ((:result __result) "")
    )
   (send-super :init)
   (setq _result (string __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass frongo::EvaluateModels
  :super ros::object
  :slots ())

(setf (get frongo::EvaluateModels :md5sum-) "b39707c144dc811845d1401dd6f773fb")
(setf (get frongo::EvaluateModels :datatype-) "frongo/EvaluateModels")
(setf (get frongo::EvaluateModels :request) frongo::EvaluateModelsRequest)
(setf (get frongo::EvaluateModels :response) frongo::EvaluateModelsResponse)

(defmethod frongo::EvaluateModelsRequest
  (:response () (instance frongo::EvaluateModelsResponse :init)))

(setf (get frongo::EvaluateModelsRequest :md5sum-) "b39707c144dc811845d1401dd6f773fb")
(setf (get frongo::EvaluateModelsRequest :datatype-) "frongo/EvaluateModelsRequest")
(setf (get frongo::EvaluateModelsRequest :definition-)
      "bool data
---
string result

")

(setf (get frongo::EvaluateModelsResponse :md5sum-) "b39707c144dc811845d1401dd6f773fb")
(setf (get frongo::EvaluateModelsResponse :datatype-) "frongo/EvaluateModelsResponse")
(setf (get frongo::EvaluateModelsResponse :definition-)
      "bool data
---
string result

")



(provide :frongo/EvaluateModels "b39707c144dc811845d1401dd6f773fb")


