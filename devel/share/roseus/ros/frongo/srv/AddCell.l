;; Auto-generated. Do not edit!


(when (boundp 'frongo::AddCell)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'AddCell (find-package "FRONGO")))
(unless (find-package "FRONGO::ADDCELL")
  (make-package "FRONGO::ADDCELL"))
(unless (find-package "FRONGO::ADDCELLREQUEST")
  (make-package "FRONGO::ADDCELLREQUEST"))
(unless (find-package "FRONGO::ADDCELLRESPONSE")
  (make-package "FRONGO::ADDCELLRESPONSE"))

(in-package "ROS")





(defclass frongo::AddCellRequest
  :super ros::object
  :slots (_model_def ))

(defmethod frongo::AddCellRequest
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

(defclass frongo::AddCellResponse
  :super ros::object
  :slots (_result ))

(defmethod frongo::AddCellResponse
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

(defclass frongo::AddCell
  :super ros::object
  :slots ())

(setf (get frongo::AddCell :md5sum-) "9703095a7d44bb2a973590113ee73ad2")
(setf (get frongo::AddCell :datatype-) "frongo/AddCell")
(setf (get frongo::AddCell :request) frongo::AddCellRequest)
(setf (get frongo::AddCell :response) frongo::AddCellResponse)

(defmethod frongo::AddCellRequest
  (:response () (instance frongo::AddCellResponse :init)))

(setf (get frongo::AddCellRequest :md5sum-) "9703095a7d44bb2a973590113ee73ad2")
(setf (get frongo::AddCellRequest :datatype-) "frongo/AddCellRequest")
(setf (get frongo::AddCellRequest :definition-)
      "string model_def
---
bool result

")

(setf (get frongo::AddCellResponse :md5sum-) "9703095a7d44bb2a973590113ee73ad2")
(setf (get frongo::AddCellResponse :datatype-) "frongo/AddCellResponse")
(setf (get frongo::AddCellResponse :definition-)
      "string model_def
---
bool result

")



(provide :frongo/AddCell "9703095a7d44bb2a973590113ee73ad2")


