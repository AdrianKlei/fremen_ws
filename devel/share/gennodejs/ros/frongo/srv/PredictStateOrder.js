// Auto-generated. Do not edit!

// (in-package frongo.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PredictStateOrderRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.model_name = null;
      this.order = null;
      this.epochs = null;
    }
    else {
      if (initObj.hasOwnProperty('model_name')) {
        this.model_name = initObj.model_name
      }
      else {
        this.model_name = '';
      }
      if (initObj.hasOwnProperty('order')) {
        this.order = initObj.order
      }
      else {
        this.order = 0;
      }
      if (initObj.hasOwnProperty('epochs')) {
        this.epochs = initObj.epochs
      }
      else {
        this.epochs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PredictStateOrderRequest
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [order]
    bufferOffset = _serializer.int32(obj.order, buffer, bufferOffset);
    // Serialize message field [epochs]
    bufferOffset = _arraySerializer.uint32(obj.epochs, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PredictStateOrderRequest
    let len;
    let data = new PredictStateOrderRequest(null);
    // Deserialize message field [model_name]
    data.model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [order]
    data.order = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [epochs]
    data.epochs = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.model_name.length;
    length += 4 * object.epochs.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/PredictStateOrderRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '12294f3ad15fc37d4df0341d7cace8c8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string model_name
    int32    order
    uint32[] epochs
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PredictStateOrderRequest(null);
    if (msg.model_name !== undefined) {
      resolved.model_name = msg.model_name;
    }
    else {
      resolved.model_name = ''
    }

    if (msg.order !== undefined) {
      resolved.order = msg.order;
    }
    else {
      resolved.order = 0
    }

    if (msg.epochs !== undefined) {
      resolved.epochs = msg.epochs;
    }
    else {
      resolved.epochs = []
    }

    return resolved;
    }
};

class PredictStateOrderResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.epochs = null;
      this.predictions = null;
    }
    else {
      if (initObj.hasOwnProperty('epochs')) {
        this.epochs = initObj.epochs
      }
      else {
        this.epochs = [];
      }
      if (initObj.hasOwnProperty('predictions')) {
        this.predictions = initObj.predictions
      }
      else {
        this.predictions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PredictStateOrderResponse
    // Serialize message field [epochs]
    bufferOffset = _arraySerializer.uint32(obj.epochs, buffer, bufferOffset, null);
    // Serialize message field [predictions]
    bufferOffset = _arraySerializer.float64(obj.predictions, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PredictStateOrderResponse
    let len;
    let data = new PredictStateOrderResponse(null);
    // Deserialize message field [epochs]
    data.epochs = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [predictions]
    data.predictions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.epochs.length;
    length += 8 * object.predictions.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/PredictStateOrderResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f0451b77ac97886a262f9931253e48a0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32[] epochs
    float64[] predictions
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PredictStateOrderResponse(null);
    if (msg.epochs !== undefined) {
      resolved.epochs = msg.epochs;
    }
    else {
      resolved.epochs = []
    }

    if (msg.predictions !== undefined) {
      resolved.predictions = msg.predictions;
    }
    else {
      resolved.predictions = []
    }

    return resolved;
    }
};

module.exports = {
  Request: PredictStateOrderRequest,
  Response: PredictStateOrderResponse,
  md5sum() { return 'ae1fcb161afd95e17d99e9fd38349e36'; },
  datatype() { return 'frongo/PredictStateOrder'; }
};
