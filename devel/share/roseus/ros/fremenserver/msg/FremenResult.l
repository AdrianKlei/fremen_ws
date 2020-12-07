;; Auto-generated. Do not edit!


(when (boundp 'fremenserver::FremenResult)
  (if (not (find-package "FREMENSERVER"))
    (make-package "FREMENSERVER"))
  (shadow 'FremenResult (find-package "FREMENSERVER")))
(unless (find-package "FREMENSERVER::FREMENRESULT")
  (make-package "FREMENSERVER::FREMENRESULT"))

(in-package "ROS")
;;//! \htmlinclude FremenResult.msg.html


(defclass fremenserver::FremenResult
  :super ros::object
  :slots (_success _message _probabilities _entropies _errors _anomalyTimes _anomalyValues ))

(defmethod fremenserver::FremenResult
  (:init
   (&key
    ((:success __success) 0)
    ((:message __message) "")
    ((:probabilities __probabilities) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:entropies __entropies) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:errors __errors) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:anomalyTimes __anomalyTimes) (make-array 0 :initial-element 0 :element-type :integer))
    ((:anomalyValues __anomalyValues) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _success (round __success))
   (setq _message (string __message))
   (setq _probabilities __probabilities)
   (setq _entropies __entropies)
   (setq _errors __errors)
   (setq _anomalyTimes __anomalyTimes)
   (setq _anomalyValues __anomalyValues)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:probabilities
   (&optional __probabilities)
   (if __probabilities (setq _probabilities __probabilities)) _probabilities)
  (:entropies
   (&optional __entropies)
   (if __entropies (setq _entropies __entropies)) _entropies)
  (:errors
   (&optional __errors)
   (if __errors (setq _errors __errors)) _errors)
  (:anomalyTimes
   (&optional __anomalyTimes)
   (if __anomalyTimes (setq _anomalyTimes __anomalyTimes)) _anomalyTimes)
  (:anomalyValues
   (&optional __anomalyValues)
   (if __anomalyValues (setq _anomalyValues __anomalyValues)) _anomalyValues)
  (:serialization-length
   ()
   (+
    ;; int32 _success
    4
    ;; string _message
    4 (length _message)
    ;; float32[] _probabilities
    (* 4    (length _probabilities)) 4
    ;; float32[] _entropies
    (* 4    (length _entropies)) 4
    ;; float32[] _errors
    (* 4    (length _errors)) 4
    ;; uint32[] _anomalyTimes
    (* 4    (length _anomalyTimes)) 4
    ;; uint32[] _anomalyValues
    (* 4    (length _anomalyValues)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _success
       (write-long _success s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; float32[] _probabilities
     (write-long (length _probabilities) s)
     (dotimes (i (length _probabilities))
       (sys::poke (elt _probabilities i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _entropies
     (write-long (length _entropies) s)
     (dotimes (i (length _entropies))
       (sys::poke (elt _entropies i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _errors
     (write-long (length _errors) s)
     (dotimes (i (length _errors))
       (sys::poke (elt _errors i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; uint32[] _anomalyTimes
     (write-long (length _anomalyTimes) s)
     (dotimes (i (length _anomalyTimes))
       (write-long (elt _anomalyTimes i) s)
       )
     ;; uint32[] _anomalyValues
     (write-long (length _anomalyValues) s)
     (dotimes (i (length _anomalyValues))
       (write-long (elt _anomalyValues i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _success
     (setq _success (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32[] _probabilities
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _probabilities (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _probabilities i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _entropies
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _entropies (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _entropies i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _errors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _errors (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _errors i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; uint32[] _anomalyTimes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _anomalyTimes (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _anomalyTimes i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; uint32[] _anomalyValues
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _anomalyValues (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _anomalyValues i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get fremenserver::FremenResult :md5sum-) "c4d21afc2fe08d781143d26587909bbe")
(setf (get fremenserver::FremenResult :datatype-) "fremenserver/FremenResult")
(setf (get fremenserver::FremenResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#result definition
int32 success		#action result - positive value indicates success, negative indicates error
string message 		#detailed message
float32[] probabilities	#probabilities of the states calculated by the 'predict' action for the particular 'times', probability of a given observation for the 'detect' action
float32[] entropies	#entropies of the states calculated by the 'entropy' action for the particular 'times'
float32[] errors 	#prediction errors for the various model orders given by the 'evaluate' action
uint32[]  anomalyTimes 	#the time instants of detected anomalies 
uint32[]  anomalyValues	#the observed anomaous states 

")



(provide :fremenserver/FremenResult "c4d21afc2fe08d781143d26587909bbe")


