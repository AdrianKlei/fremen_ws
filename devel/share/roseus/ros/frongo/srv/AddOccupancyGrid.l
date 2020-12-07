;; Auto-generated. Do not edit!


(when (boundp 'frongo::AddOccupancyGrid)
  (if (not (find-package "FRONGO"))
    (make-package "FRONGO"))
  (shadow 'AddOccupancyGrid (find-package "FRONGO")))
(unless (find-package "FRONGO::ADDOCCUPANCYGRID")
  (make-package "FRONGO::ADDOCCUPANCYGRID"))
(unless (find-package "FRONGO::ADDOCCUPANCYGRIDREQUEST")
  (make-package "FRONGO::ADDOCCUPANCYGRIDREQUEST"))
(unless (find-package "FRONGO::ADDOCCUPANCYGRIDRESPONSE")
  (make-package "FRONGO::ADDOCCUPANCYGRIDRESPONSE"))

(in-package "ROS")





(defclass frongo::AddOccupancyGridRequest
  :super ros::object
  :slots (_specifications_file ))

(defmethod frongo::AddOccupancyGridRequest
  (:init
   (&key
    ((:specifications_file __specifications_file) "")
    )
   (send-super :init)
   (setq _specifications_file (string __specifications_file))
   self)
  (:specifications_file
   (&optional __specifications_file)
   (if __specifications_file (setq _specifications_file __specifications_file)) _specifications_file)
  (:serialization-length
   ()
   (+
    ;; string _specifications_file
    4 (length _specifications_file)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _specifications_file
       (write-long (length _specifications_file) s) (princ _specifications_file s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _specifications_file
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _specifications_file (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass frongo::AddOccupancyGridResponse
  :super ros::object
  :slots (_success ))

(defmethod frongo::AddOccupancyGridResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass frongo::AddOccupancyGrid
  :super ros::object
  :slots ())

(setf (get frongo::AddOccupancyGrid :md5sum-) "d80d29e273fcfeeabf6b0b84dde04fa1")
(setf (get frongo::AddOccupancyGrid :datatype-) "frongo/AddOccupancyGrid")
(setf (get frongo::AddOccupancyGrid :request) frongo::AddOccupancyGridRequest)
(setf (get frongo::AddOccupancyGrid :response) frongo::AddOccupancyGridResponse)

(defmethod frongo::AddOccupancyGridRequest
  (:response () (instance frongo::AddOccupancyGridResponse :init)))

(setf (get frongo::AddOccupancyGridRequest :md5sum-) "d80d29e273fcfeeabf6b0b84dde04fa1")
(setf (get frongo::AddOccupancyGridRequest :datatype-) "frongo/AddOccupancyGridRequest")
(setf (get frongo::AddOccupancyGridRequest :definition-)
      "string specifications_file
---
bool success

")

(setf (get frongo::AddOccupancyGridResponse :md5sum-) "d80d29e273fcfeeabf6b0b84dde04fa1")
(setf (get frongo::AddOccupancyGridResponse :datatype-) "frongo/AddOccupancyGridResponse")
(setf (get frongo::AddOccupancyGridResponse :definition-)
      "string specifications_file
---
bool success

")



(provide :frongo/AddOccupancyGrid "d80d29e273fcfeeabf6b0b84dde04fa1")


