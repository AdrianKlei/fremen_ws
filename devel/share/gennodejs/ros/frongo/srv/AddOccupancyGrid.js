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

class AddOccupancyGridRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.specifications_file = null;
    }
    else {
      if (initObj.hasOwnProperty('specifications_file')) {
        this.specifications_file = initObj.specifications_file
      }
      else {
        this.specifications_file = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddOccupancyGridRequest
    // Serialize message field [specifications_file]
    bufferOffset = _serializer.string(obj.specifications_file, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddOccupancyGridRequest
    let len;
    let data = new AddOccupancyGridRequest(null);
    // Deserialize message field [specifications_file]
    data.specifications_file = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.specifications_file.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/AddOccupancyGridRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f380ed868f85299f5d2c3f2c5a17099';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string specifications_file
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddOccupancyGridRequest(null);
    if (msg.specifications_file !== undefined) {
      resolved.specifications_file = msg.specifications_file;
    }
    else {
      resolved.specifications_file = ''
    }

    return resolved;
    }
};

class AddOccupancyGridResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddOccupancyGridResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddOccupancyGridResponse
    let len;
    let data = new AddOccupancyGridResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'frongo/AddOccupancyGridResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddOccupancyGridResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: AddOccupancyGridRequest,
  Response: AddOccupancyGridResponse,
  md5sum() { return 'd80d29e273fcfeeabf6b0b84dde04fa1'; },
  datatype() { return 'frongo/AddOccupancyGrid'; }
};
