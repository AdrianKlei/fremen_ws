; Auto-generated. Do not edit!


(cl:in-package fremenserver-msg)


;//! \htmlinclude FremenActionGoal.msg.html

(cl:defclass <FremenActionGoal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (goal_id
    :reader goal_id
    :initarg :goal_id
    :type actionlib_msgs-msg:GoalID
    :initform (cl:make-instance 'actionlib_msgs-msg:GoalID))
   (goal
    :reader goal
    :initarg :goal
    :type fremenserver-msg:FremenGoal
    :initform (cl:make-instance 'fremenserver-msg:FremenGoal)))
)

(cl:defclass FremenActionGoal (<FremenActionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FremenActionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FremenActionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fremenserver-msg:<FremenActionGoal> is deprecated: use fremenserver-msg:FremenActionGoal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FremenActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fremenserver-msg:header-val is deprecated.  Use fremenserver-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'goal_id-val :lambda-list '(m))
(cl:defmethod goal_id-val ((m <FremenActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fremenserver-msg:goal_id-val is deprecated.  Use fremenserver-msg:goal_id instead.")
  (goal_id m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <FremenActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fremenserver-msg:goal-val is deprecated.  Use fremenserver-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FremenActionGoal>) ostream)
  "Serializes a message object of type '<FremenActionGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_id) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FremenActionGoal>) istream)
  "Deserializes a message object of type '<FremenActionGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_id) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FremenActionGoal>)))
  "Returns string type for a message object of type '<FremenActionGoal>"
  "fremenserver/FremenActionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FremenActionGoal)))
  "Returns string type for a message object of type 'FremenActionGoal"
  "fremenserver/FremenActionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FremenActionGoal>)))
  "Returns md5sum for a message object of type '<FremenActionGoal>"
  "eccf1b2174bc29e6477991e5b4b82f80")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FremenActionGoal)))
  "Returns md5sum for a message object of type 'FremenActionGoal"
  "eccf1b2174bc29e6477991e5b4b82f80")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FremenActionGoal>)))
  "Returns full string definition for message of type '<FremenActionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%FremenGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: fremenserver/FremenGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%string   operation 	#the operation can be 'add', 'addvalues', 'predict', 'forecast', 'entropy', 'evaluate', 'detect', 'update', 'delete'~%			#'add' adds a sequence of given (by ID) state measurements and the times these have been obtained to the state's model, if ID is given for the first time, a new state is created and added to the model~%			#'addvalues' adds a sequence of given (by ID) value measurements and the times these have been obtained to the state's model, if ID is given for the first time, a new state is created and added to the model~%			#'predict'  calculates a sequence of probabilities of the state ID for the given times (i.e. prediction of one state for multiple time instants)~%			#'forecast'  calculates a sequence of probabilities of the states with given 'ids' for the given time (i.e. prediction of mutiple states for a single time instant)~%			#'entropy'  calculates a sequence of entropies of the state ID for the given times - this is to support exploration~%			#'evaluate' predicts the state for the given times, compares the prediction with ground truth and returns the prediction errors for model orders from 0 to the order specified. Meant to help to decide which order to use for the 'predict' action. ~%			#'detect' detects anomalies by predicting the state for the given times, comparing with ground truth and flagging up discrepancies that were beyond a certain 'confidence' level ~%			#'delete' removes the current state from the collection of states   ~%			#'update' is reserved, will be used int the future for recalculating the models~%~%string  id	  	#specifies the ID of the state to be manipulated ~%string[]  ids	  	#specifies the IDs of the states to be manipulated - explusively fot the 'forecast' action~%uint32[]  times 	#the time instants for the 'predict', 'add', 'entropy' and 'evaluate' actions~%~%#specific for the 'predict', 'evaluate' and 'detect' actions~%int32    order 		#number of periodic processes to use for the purpose of prediction (0 means a static model, typical value is 2), maximal order used for evaluation of the 'evaluate' action~%~%#specific for the 'forecast' actions~%int32[]  orders	  	#same as previous one, but for all states in the **ids** ~%~%#specific for the 'add' and 'evaluate' action~%bool[]      states   	#sequence of states observed at the particular times - specific to the 'add' action 	(this is for backward compatibility)~%float32[]   values   	#sequence of values observed at the particular times - specific to the 'addvalues' action, (I recommend to normalize the values so they fit 0-1)~%~%#specific for the 'detect' ~%float32   confidence   	#confidence level for the anomaly detection~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FremenActionGoal)))
  "Returns full string definition for message of type 'FremenActionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%FremenGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: fremenserver/FremenGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%string   operation 	#the operation can be 'add', 'addvalues', 'predict', 'forecast', 'entropy', 'evaluate', 'detect', 'update', 'delete'~%			#'add' adds a sequence of given (by ID) state measurements and the times these have been obtained to the state's model, if ID is given for the first time, a new state is created and added to the model~%			#'addvalues' adds a sequence of given (by ID) value measurements and the times these have been obtained to the state's model, if ID is given for the first time, a new state is created and added to the model~%			#'predict'  calculates a sequence of probabilities of the state ID for the given times (i.e. prediction of one state for multiple time instants)~%			#'forecast'  calculates a sequence of probabilities of the states with given 'ids' for the given time (i.e. prediction of mutiple states for a single time instant)~%			#'entropy'  calculates a sequence of entropies of the state ID for the given times - this is to support exploration~%			#'evaluate' predicts the state for the given times, compares the prediction with ground truth and returns the prediction errors for model orders from 0 to the order specified. Meant to help to decide which order to use for the 'predict' action. ~%			#'detect' detects anomalies by predicting the state for the given times, comparing with ground truth and flagging up discrepancies that were beyond a certain 'confidence' level ~%			#'delete' removes the current state from the collection of states   ~%			#'update' is reserved, will be used int the future for recalculating the models~%~%string  id	  	#specifies the ID of the state to be manipulated ~%string[]  ids	  	#specifies the IDs of the states to be manipulated - explusively fot the 'forecast' action~%uint32[]  times 	#the time instants for the 'predict', 'add', 'entropy' and 'evaluate' actions~%~%#specific for the 'predict', 'evaluate' and 'detect' actions~%int32    order 		#number of periodic processes to use for the purpose of prediction (0 means a static model, typical value is 2), maximal order used for evaluation of the 'evaluate' action~%~%#specific for the 'forecast' actions~%int32[]  orders	  	#same as previous one, but for all states in the **ids** ~%~%#specific for the 'add' and 'evaluate' action~%bool[]      states   	#sequence of states observed at the particular times - specific to the 'add' action 	(this is for backward compatibility)~%float32[]   values   	#sequence of values observed at the particular times - specific to the 'addvalues' action, (I recommend to normalize the values so they fit 0-1)~%~%#specific for the 'detect' ~%float32   confidence   	#confidence level for the anomaly detection~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FremenActionGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FremenActionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'FremenActionGoal
    (cl:cons ':header (header msg))
    (cl:cons ':goal_id (goal_id msg))
    (cl:cons ':goal (goal msg))
))
