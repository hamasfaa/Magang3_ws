// Auto-generated. Do not edit!

// (in-package magangros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PosisiTurtleAwal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xawal = null;
      this.yawal = null;
    }
    else {
      if (initObj.hasOwnProperty('xawal')) {
        this.xawal = initObj.xawal
      }
      else {
        this.xawal = 0.0;
      }
      if (initObj.hasOwnProperty('yawal')) {
        this.yawal = initObj.yawal
      }
      else {
        this.yawal = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PosisiTurtleAwal
    // Serialize message field [xawal]
    bufferOffset = _serializer.float64(obj.xawal, buffer, bufferOffset);
    // Serialize message field [yawal]
    bufferOffset = _serializer.float64(obj.yawal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PosisiTurtleAwal
    let len;
    let data = new PosisiTurtleAwal(null);
    // Deserialize message field [xawal]
    data.xawal = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yawal]
    data.yawal = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'magangros/PosisiTurtleAwal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '288aa94287e593d6b2c56dbae4b540d0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 xawal
    float64 yawal
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PosisiTurtleAwal(null);
    if (msg.xawal !== undefined) {
      resolved.xawal = msg.xawal;
    }
    else {
      resolved.xawal = 0.0
    }

    if (msg.yawal !== undefined) {
      resolved.yawal = msg.yawal;
    }
    else {
      resolved.yawal = 0.0
    }

    return resolved;
    }
};

module.exports = PosisiTurtleAwal;
