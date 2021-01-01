;; Auto-generated. Do not edit!


(when (boundp 'frongo::SaveGrid)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'SaveGrid (find-package "FRONGO")))
(unless (find-package "FRONGO::SAVEGRID")
  (make-package "FRONGO::SAVEGRID"))
(unless (find-package "FRONGO::SAVEGRIDREQUEST")
  (make-package "FRONGO::SAVEGRIDREQUEST"))
(unless (find-package "FRONGO::SAVEGRIDRESPONSE")
  (make-package "FRONGO::SAVEGRIDRESPONSE"))

(in-package "ROS")





(defclass frongo::SaveGridRequest
  :super ros::object
  :slots (_grid_name ))

(defmethod frongo::SaveGridRequest
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

(defclass frongo::SaveGridResponse
  :super ros::object
  :slots (_result ))

(defmethod frongo::SaveGridResponse
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

(defclass frongo::SaveGrid
  :super ros::object
  :slots ())

(setf (get frongo::SaveGrid :md5sum-) "6090d744392c14e9793f5e7c1616c9e2")
(setf (get frongo::SaveGrid :datatype-) "frongo/SaveGrid")
(setf (get frongo::SaveGrid :request) frongo::SaveGridRequest)
(setf (get frongo::SaveGrid :response) frongo::SaveGridResponse)

(defmethod frongo::SaveGridRequest
  (:response () (instance frongo::SaveGridResponse :init)))

(setf (get frongo::SaveGridRequest :md5sum-) "6090d744392c14e9793f5e7c1616c9e2")
(setf (get frongo::SaveGridRequest :datatype-) "frongo/SaveGridRequest")
(setf (get frongo::SaveGridRequest :definition-)
      "string grid_name
---
bool result

")

(setf (get frongo::SaveGridResponse :md5sum-) "6090d744392c14e9793f5e7c1616c9e2")
(setf (get frongo::SaveGridResponse :datatype-) "frongo/SaveGridResponse")
(setf (get frongo::SaveGridResponse :definition-)
      "string grid_name
---
bool result

")



(provide :frongo/SaveGrid "6090d744392c14e9793f5e7c1616c9e2")


