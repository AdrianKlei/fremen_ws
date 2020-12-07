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

class GraphModelRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.model_name = null;
      this.from_val = null;
      this.until_val = null;
      this.increment = null;
    }
    else {
      if (initObj.hasOwnProperty('model_name')) {
        this.model_name = initObj.model_name
      }
      else {
        this.model_name = '';
      }
      if (initObj.hasOwnProperty('from_val')) {
        this.from_val = initObj.from_val
      }
      else {
        this.from_val = 0;
      }
      if (initObj.hasOwnProperty('until_val')) {
        this.until_val = initObj.until_val
      }
      else {
        this.until_val = 0;
      }
      if (initObj.hasOwnProperty('increment')) {
        this.increment = initObj.increment
      }
      else {
        this.increment = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphModelRequest
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [from_val]
    bufferOffset = _serializer.int32(obj.from_val, buffer, bufferOffset);
    // Serialize message field [until_val]
    bufferOffset = _serializer.int32(obj.until_val, buffer, bufferOffset);
    // Serialize message field [increment]
    bufferOffset = _serializer.int32(obj.increment, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphModelRequest
    let len;
    let data = new GraphModelRequest(null);
    // Deserialize message field [model_name]
    data.model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [from_val]
    data.from_val = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [until_val]
    data.until_val = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [increment]
    data.increment = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.model_name.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/GraphModelRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '32cb64561f7cbcfca1ab9245b16357c6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string model_name
    int32  from_val
    int32  until_val
    int32  increment
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraphModelRequest(null);
    if (msg.model_name !== undefined) {
      resolved.model_name = msg.model_name;
    }
    else {
      resolved.model_name = ''
    }

    if (msg.from_val !== undefined) {
      resolved.from_val = msg.from_val;
    }
    else {
      resolved.from_val = 0
    }

    if (msg.until_val !== undefined) {
      resolved.until_val = msg.until_val;
    }
    else {
      resolved.until_val = 0
    }

    if (msg.increment !== undefined) {
      resolved.increment = msg.increment;
    }
    else {
      resolved.increment = 0
    }

    return resolved;
    }
};

class GraphModelResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.filename = null;
    }
    else {
      if (initObj.hasOwnProperty('filename')) {
        this.filename = initObj.filename
      }
      else {
        this.filename = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphModelResponse
    // Serialize message field [filename]
    bufferOffset = _serializer.string(obj.filename, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphModelResponse
    let len;
    let data = new GraphModelResponse(null);
    // Deserialize message field [filename]
    data.filename = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.filename.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/GraphModelResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '030824f52a0628ead956fb9d67e66ae9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string filename
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraphModelResponse(null);
    if (msg.filename !== undefined) {
      resolved.filename = msg.filename;
    }
    else {
      resolved.filename = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: GraphModelRequest,
  Response: GraphModelResponse,
  md5sum() { return '12c8011e5f49767d0aa831627309e4d7'; },
  datatype() { return 'frongo/GraphModel'; }
};
