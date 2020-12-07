// Auto-generated. Do not edit!

// (in-package fremenserver.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class FremenGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.operation = null;
      this.id = null;
      this.ids = null;
      this.times = null;
      this.order = null;
      this.orders = null;
      this.states = null;
      this.values = null;
      this.confidence = null;
    }
    else {
      if (initObj.hasOwnProperty('operation')) {
        this.operation = initObj.operation
      }
      else {
        this.operation = '';
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('ids')) {
        this.ids = initObj.ids
      }
      else {
        this.ids = [];
      }
      if (initObj.hasOwnProperty('times')) {
        this.times = initObj.times
      }
      else {
        this.times = [];
      }
      if (initObj.hasOwnProperty('order')) {
        this.order = initObj.order
      }
      else {
        this.order = 0;
      }
      if (initObj.hasOwnProperty('orders')) {
        this.orders = initObj.orders
      }
      else {
        this.orders = [];
      }
      if (initObj.hasOwnProperty('states')) {
        this.states = initObj.states
      }
      else {
        this.states = [];
      }
      if (initObj.hasOwnProperty('values')) {
        this.values = initObj.values
      }
      else {
        this.values = [];
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FremenGoal
    // Serialize message field [operation]
    bufferOffset = _serializer.string(obj.operation, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [ids]
    bufferOffset = _arraySerializer.string(obj.ids, buffer, bufferOffset, null);
    // Serialize message field [times]
    bufferOffset = _arraySerializer.uint32(obj.times, buffer, bufferOffset, null);
    // Serialize message field [order]
    bufferOffset = _serializer.int32(obj.order, buffer, bufferOffset);
    // Serialize message field [orders]
    bufferOffset = _arraySerializer.int32(obj.orders, buffer, bufferOffset, null);
    // Serialize message field [states]
    bufferOffset = _arraySerializer.bool(obj.states, buffer, bufferOffset, null);
    // Serialize message field [values]
    bufferOffset = _arraySerializer.float32(obj.values, buffer, bufferOffset, null);
    // Serialize message field [confidence]
    bufferOffset = _serializer.float32(obj.confidence, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FremenGoal
    let len;
    let data = new FremenGoal(null);
    // Deserialize message field [operation]
    data.operation = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [ids]
    data.ids = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [times]
    data.times = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [order]
    data.order = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [orders]
    data.orders = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [states]
    data.states = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [values]
    data.values = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [confidence]
    data.confidence = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.operation.length;
    length += object.id.length;
    object.ids.forEach((val) => {
      length += 4 + val.length;
    });
    length += 4 * object.times.length;
    length += 4 * object.orders.length;
    length += object.states.length;
    length += 4 * object.values.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'fremenserver/FremenGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3da51b48cac313fb0b866f25a6c94989';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new FremenGoal(null);
    if (msg.operation !== undefined) {
      resolved.operation = msg.operation;
    }
    else {
      resolved.operation = ''
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.ids !== undefined) {
      resolved.ids = msg.ids;
    }
    else {
      resolved.ids = []
    }

    if (msg.times !== undefined) {
      resolved.times = msg.times;
    }
    else {
      resolved.times = []
    }

    if (msg.order !== undefined) {
      resolved.order = msg.order;
    }
    else {
      resolved.order = 0
    }

    if (msg.orders !== undefined) {
      resolved.orders = msg.orders;
    }
    else {
      resolved.orders = []
    }

    if (msg.states !== undefined) {
      resolved.states = msg.states;
    }
    else {
      resolved.states = []
    }

    if (msg.values !== undefined) {
      resolved.values = msg.values;
    }
    else {
      resolved.values = []
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = 0.0
    }

    return resolved;
    }
};

module.exports = FremenGoal;
