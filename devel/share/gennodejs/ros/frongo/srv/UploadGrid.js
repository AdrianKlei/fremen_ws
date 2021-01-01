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

class UploadGridRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.grid_name = null;
    }
    else {
      if (initObj.hasOwnProperty('grid_name')) {
        this.grid_name = initObj.grid_name
      }
      else {
        this.grid_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UploadGridRequest
    // Serialize message field [grid_name]
    bufferOffset = _serializer.string(obj.grid_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UploadGridRequest
    let len;
    let data = new UploadGridRequest(null);
    // Deserialize message field [grid_name]
    data.grid_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.grid_name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/UploadGridRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bc567f7c16280c57bc13a5f26eb3e4e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string grid_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UploadGridRequest(null);
    if (msg.grid_name !== undefined) {
      resolved.grid_name = msg.grid_name;
    }
    else {
      resolved.grid_name = ''
    }

    return resolved;
    }
};

class UploadGridResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UploadGridResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UploadGridResponse
    let len;
    let data = new UploadGridResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/UploadGridResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UploadGridResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: UploadGridRequest,
  Response: UploadGridResponse,
  md5sum() { return '6090d744392c14e9793f5e7c1616c9e2'; },
  datatype() { return 'frongo/UploadGrid'; }
};
