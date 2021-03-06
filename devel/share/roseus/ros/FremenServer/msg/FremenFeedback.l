;; Auto-generated. Do not edit!


(when (boundp 'FremenServer::FremenFeedback)
  (if (not (find-package "FREMENSERVER"))
    (make-package "FREMENSERVER"))
  (shadow 'FremenFeedback (find-package "FREMENSERVER")))
(unless (find-package "FREMENSERVER::FREMENFEEDBACK")
  (make-package "FREMENSERVER::FREMENFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude FremenFeedback.msg.html


(defclass FremenServer::FremenFeedback
  :super ros::object
  :slots (_status ))

(defmethod FremenServer::FremenFeedback
  (:init
   (&key
    ((:status __status) "")
    )
   (send-super :init)
   (setq _status (string __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get FremenServer::FremenFeedback :md5sum-) "4fe5af303955c287688e7347e9b00278")
(setf (get FremenServer::FremenFeedback :datatype-) "FremenServer/FremenFeedback")
(setf (get FremenServer::FremenFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#feedback
string status


")



(provide :FremenServer/FremenFeedback "4fe5af303955c287688e7347e9b00278")


