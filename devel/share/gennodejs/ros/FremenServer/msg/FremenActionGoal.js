// Auto-generated. Do not edit!

// (in-package FremenServer.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let FremenGoal = require('./FremenGoal.js');
let actionlib_msgs = _finder('actionlib_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FremenActionGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.goal_id = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('goal_id')) {
        this.goal_id = initObj.goal_id
      }
      else {
        this.goal_id = new actionlib_msgs.msg.GoalID();
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = new FremenGoal();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FremenActionGoal
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [goal_id]
    bufferOffset = actionlib_msgs.msg.GoalID.serialize(obj.goal_id, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = FremenGoal.serialize(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FremenActionGoal
    let len;
    let data = new FremenActionGoal(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal_id]
    data.goal_id = actionlib_msgs.msg.GoalID.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = FremenGoal.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += actionlib_msgs.msg.GoalID.getMessageSize(object.goal_id);
    length += FremenGoal.getMessageSize(object.goal);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'FremenServer/FremenActionGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eccf1b2174bc29e6477991e5b4b82f80';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    
    Header header
    actionlib_msgs/GoalID goal_id
    FremenGoal goal
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: actionlib_msgs/GoalID
    # The stamp should store the time at which this goal was requested.
    # It is used by an action server when it tries to preempt all
    # goals that were requested before a certain time
    time stamp
    
    # The id provides a way to associate feedback and
    # result message with specific goal requests. The id
    # specified must be unique.
    string id
    
    
    ================================================================================
    MSG: FremenServer/FremenGoal
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
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
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FremenActionGoal(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.goal_id !== undefined) {
      resolved.goal_id = actionlib_msgs.msg.GoalID.Resolve(msg.goal_id)
    }
    else {
      resolved.goal_id = new actionlib_msgs.msg.GoalID()
    }

    if (msg.goal !== undefined) {
      resolved.goal = FremenGoal.Resolve(msg.goal)
    }
    else {
      resolved.goal = new FremenGoal()
    }

    return resolved;
    }
};

module.exports = FremenActionGoal;
