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

class GetModelNameRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.model_name = null;
      this.random_string = null;
    }
    else {
      if (initObj.hasOwnProperty('model_name')) {
        this.model_name = initObj.model_name
      }
      else {
        this.model_name = '';
      }
      if (initObj.hasOwnProperty('random_string')) {
        this.random_string = initObj.random_string
      }
      else {
        this.random_string = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetModelNameRequest
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [random_string]
    bufferOffset = _arraySerializer.uint32(obj.random_string, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetModelNameRequest
    let len;
    let data = new GetModelNameRequest(null);
    // Deserialize message field [model_name]
    data.model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [random_string]
    data.random_string = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.model_name.length;
    length += 4 * object.random_string.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/GetModelNameRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5e334af7af63b0a6c211a5bd62d351ec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string model_name
    uint32[] random_string
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetModelNameRequest(null);
    if (msg.model_name !== undefined) {
      resolved.model_name = msg.model_name;
    }
    else {
      resolved.model_name = ''
    }

    if (msg.random_string !== undefined) {
      resolved.random_string = msg.random_string;
    }
    else {
      resolved.random_string = []
    }

    return resolved;
    }
};

class GetModelNameResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.model_name = null;
      this.random_string = null;
    }
    else {
      if (initObj.hasOwnProperty('model_name')) {
        this.model_name = initObj.model_name
      }
      else {
        this.model_name = '';
      }
      if (initObj.hasOwnProperty('random_string')) {
        this.random_string = initObj.random_string
      }
      else {
        this.random_string = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetModelNameResponse
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [random_string]
    bufferOffset = _arraySerializer.uint32(obj.random_string, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetModelNameResponse
    let len;
    let data = new GetModelNameResponse(null);
    // Deserialize message field [model_name]
    data.model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [random_string]
    data.random_string = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.model_name.length;
    length += 4 * object.random_string.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/GetModelNameResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5e334af7af63b0a6c211a5bd62d351ec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string model_name
    uint32[] random_string
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetModelNameResponse(null);
    if (msg.model_name !== undefined) {
      resolved.model_name = msg.model_name;
    }
    else {
      resolved.model_name = ''
    }

    if (msg.random_string !== undefined) {
      resolved.random_string = msg.random_string;
    }
    else {
      resolved.random_string = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetModelNameRequest,
  Response: GetModelNameResponse,
  md5sum() { return '9018f8bdc32329b5f34846c1b72a4a9c'; },
  datatype() { return 'frongo/GetModelName'; }
};
