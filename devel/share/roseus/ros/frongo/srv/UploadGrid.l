;; Auto-generated. Do not edit!


(when (boundp 'frongo::UploadGrid)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'UploadGrid (find-package "FRONGO")))
(unless (find-package "FRONGO::UPLOADGRID")
  (make-package "FRONGO::UPLOADGRID"))
(unless (find-package "FRONGO::UPLOADGRIDREQUEST")
  (make-package "FRONGO::UPLOADGRIDREQUEST"))
(unless (find-package "FRONGO::UPLOADGRIDRESPONSE")
  (make-package "FRONGO::UPLOADGRIDRESPONSE"))

(in-package "ROS")





(defclass frongo::UploadGridRequest
  :super ros::object
  :slots (_grid_name ))

(defmethod frongo::UploadGridRequest
  (:init
   (&key
    ((:grid_name __grid_name) "")
    )
   (send-super :init)
   (setq _grid_name (string __grid_name))
   self)
  (:grid_name
   (&optional __grid_name)
   (if __grid_name (setq _grid_name __grid_name)) _grid_name)
  (:serialization-length
   ()
   (+
    ;; string _grid_name
    4 (length _grid_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _grid_name
       (write-long (length _grid_name) s) (princ _grid_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _grid_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _grid_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass frongo::UploadGridResponse
  :super ros::object
  :slots (_result ))

(defmethod frongo::UploadGridResponse
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

(defclass frongo::UploadGrid
  :super ros::object
  :slots ())

(setf (get frongo::UploadGrid :md5sum-) "6090d744392c14e9793f5e7c1616c9e2")
(setf (get frongo::UploadGrid :datatype-) "frongo/UploadGrid")
(setf (get frongo::UploadGrid :request) frongo::UploadGridRequest)
(setf (get frongo::UploadGrid :response) frongo::UploadGridResponse)

(defmethod frongo::UploadGridRequest
  (:response () (instance frongo::UploadGridResponse :init)))

(setf (get frongo::UploadGridRequest :md5sum-) "6090d744392c14e9793f5e7c1616c9e2")
(setf (get frongo::UploadGridRequest :datatype-) "frongo/UploadGridRequest")
(setf (get frongo::UploadGridRequest :definition-)
      "string grid_name
---
bool result

")

(setf (get frongo::UploadGridResponse :md5sum-) "6090d744392c14e9793f5e7c1616c9e2")
(setf (get frongo::UploadGridResponse :datatype-) "frongo/UploadGridResponse")
(setf (get frongo::UploadGridResponse :definition-)
      "string grid_name
---
bool result

")



(provide :frongo/UploadGrid "6090d744392c14e9793f5e7c1616c9e2")


