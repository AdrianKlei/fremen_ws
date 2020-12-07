;; Auto-generated. Do not edit!


(when (boundp 'fremenserver::FremenGoal)
  (if (not (find-package "FREMENSERVER"))
    (make-package "FREMENSERVER"))
  (shadow 'FremenGoal (find-package "FREMENSERVER")))
(unless (find-package "FREMENSERVER::FREMENGOAL")
  (make-package "FREMENSERVER::FREMENGOAL"))

(in-package "ROS")
;;//! \htmlinclude FremenGoal.msg.html


(defclass fremenserver::FremenGoal
  :super ros::object
  :slots (_operation _id _ids _times _order _orders _states _values _confidence ))

(defmethod fremenserver::FremenGoal
  (:init
   (&key
    ((:operation __operation) "")
    ((:id __id) "")
    ((:ids __ids) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:times __times) (make-array 0 :initial-element 0 :element-type :integer))
    ((:order __order) 0)
    ((:orders __orders) (make-array 0 :initial-element 0 :element-type :integer))
    ((:states __states) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:values __values) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:confidence __confidence) 0.0)
    )
   (send-super :init)
   (setq _operation (string __operation))
   (setq _id (string __id))
   (setq _ids __ids)
   (setq _times __times)
   (setq _order (round __order))
   (setq _orders __orders)
   (setq _states __states)
   (setq _values __values)
   (setq _confidence (float __confidence))
   self)
  (:operation
   (&optional __operation)
   (if __operation (setq _operation __operation)) _operation)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:ids
   (&optional __ids)
   (if __ids (setq _ids __ids)) _ids)
  (:times
   (&optional __times)
   (if __times (setq _times __times)) _times)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:orders
   (&optional __orders)
   (if __orders (setq _orders __orders)) _orders)
  (:states
   (&optional __states)
   (if __states (setq _states __states)) _states)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; string _operation
    4 (length _operation)
    ;; string _id
    4 (length _id)
    ;; string[] _ids
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _ids)) 4
    ;; uint32[] _times
    (* 4    (length _times)) 4
    ;; int32 _order
    4
    ;; int32[] _orders
    (* 4    (length _orders)) 4
    ;; bool[] _states
    (* 1    (length _states)) 4
    ;; float32[] _values
    (* 4    (length _values)) 4
    ;; float32 _confidence
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _operation
       (write-long (length _operation) s) (princ _operation s)
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; string[] _ids
     (write-long (length _ids) s)
     (dolist (elem _ids)
       (write-long (length elem) s) (princ elem s)
       )
     ;; uint32[] _times
     (write-long (length _times) s)
     (dotimes (i (length _times))
       (write-long (elt _times i) s)
       )
     ;; int32 _order
       (write-long _order s)
     ;; int32[] _orders
     (write-long (length _orders) s)
     (dotimes (i (length _orders))
       (write-long (elt _orders i) s)
       )
     ;; bool[] _states
     (write-long (length _states) s)
     (dotimes (i (length _states))
       (if (elt _states i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; float32[] _values
     (write-long (length _values) s)
     (dotimes (i (length _values))
       (sys::poke (elt _values i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _operation
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _operation (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ids (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _ids i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; uint32[] _times
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _times (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _times i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _order
     (setq _order (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _orders
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _orders (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _orders i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; bool[] _states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _states (make-list n))
     (dotimes (i n)
     (setf (elt _states i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; float32[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _values i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get fremenserver::FremenGoal :md5sum-) "3da51b48cac313fb0b866f25a6c94989")
(setf (get fremenserver::FremenGoal :datatype-) "fremenserver/FremenGoal")
(setf (get fremenserver::FremenGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#goal definition
string   operation 	#the operation can be 'add', 'addvalues', 'predict', 'forecast', 'entropy', 'evaluate', 'detect', 'update', 'delete'
			#'add' adds a sequence of given (by ID) state measurements and the times these have been obtained to the state's model, if ID is given for the first time, a new state is created and added to the model
			#'addvalues' adds a sequence of given (by ID) value measurements and the times these have been obtained to the state's model, if ID is given for the first time, a new state is created and added to the model
			#'predict'  calculates a sequence of probabilities of the state ID for the given times (i.e. prediction of one state for multiple time instants)
			#'forecast'  calculates a sequence of probabilities of the states with given 'ids' for the given time (i.e. prediction of mutiple states for a single time instant)
			#'entropy'  calculates a sequence of entropies of the state ID for the given times - this is to support exploration
			#'evaluate' predicts the state for the given times, compares the prediction with ground truth and returns the prediction errors for model orders from 0 to the order specified. Meant to help to decide which order to use for the 'predict' action. 
			#'detect' detects anomalies by predicting the state for the given times, comparing with ground truth and flagging up discrepancies that were beyond a certain 'confidence' level 
			#'delete' removes the current state from the collection of states   
			#'update' is reserved, will be used int the future for recalculating the models

string  id	  	#specifies the ID of the state to be manipulated 
string[]  ids	  	#specifies the IDs of the states to be manipulated - explusively fot the 'forecast' action
uint32[]  times 	#the time instants for the 'predict', 'add', 'entropy' and 'evaluate' actions

#specific for the 'predict', 'evaluate' and 'detect' actions
int32    order 		#number of periodic processes to use for the purpose of prediction (0 means a static model, typical value is 2), maximal order used for evaluation of the 'evaluate' action

#specific for the 'forecast' actions
int32[]  orders	  	#same as previous one, but for all states in the **ids** 

#specific for the 'add' and 'evaluate' action
bool[]      states   	#sequence of states observed at the particular times - specific to the 'add' action 	(this is for backward compatibility)
float32[]   values   	#sequence of values observed at the particular times - specific to the 'addvalues' action, (I recommend to normalize the values so they fit 0-1)

#specific for the 'detect' 
float32   confidence   	#confidence level for the anomaly detection


")



(provide :fremenserver/FremenGoal "3da51b48cac313fb0b866f25a6c94989")


