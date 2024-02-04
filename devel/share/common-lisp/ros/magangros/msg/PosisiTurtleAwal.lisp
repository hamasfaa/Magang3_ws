; Auto-generated. Do not edit!


(cl:in-package magangros-msg)


;//! \htmlinclude PosisiTurtleAwal.msg.html

(cl:defclass <PosisiTurtleAwal> (roslisp-msg-protocol:ros-message)
  ((xawal
    :reader xawal
    :initarg :xawal
    :type cl:float
    :initform 0.0)
   (yawal
    :reader yawal
    :initarg :yawal
    :type cl:float
    :initform 0.0))
)

(cl:defclass PosisiTurtleAwal (<PosisiTurtleAwal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PosisiTurtleAwal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PosisiTurtleAwal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name magangros-msg:<PosisiTurtleAwal> is deprecated: use magangros-msg:PosisiTurtleAwal instead.")))

(cl:ensure-generic-function 'xawal-val :lambda-list '(m))
(cl:defmethod xawal-val ((m <PosisiTurtleAwal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader magangros-msg:xawal-val is deprecated.  Use magangros-msg:xawal instead.")
  (xawal m))

(cl:ensure-generic-function 'yawal-val :lambda-list '(m))
(cl:defmethod yawal-val ((m <PosisiTurtleAwal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader magangros-msg:yawal-val is deprecated.  Use magangros-msg:yawal instead.")
  (yawal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PosisiTurtleAwal>) ostream)
  "Serializes a message object of type '<PosisiTurtleAwal>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'xawal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yawal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PosisiTurtleAwal>) istream)
  "Deserializes a message object of type '<PosisiTurtleAwal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xawal) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yawal) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PosisiTurtleAwal>)))
  "Returns string type for a message object of type '<PosisiTurtleAwal>"
  "magangros/PosisiTurtleAwal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PosisiTurtleAwal)))
  "Returns string type for a message object of type 'PosisiTurtleAwal"
  "magangros/PosisiTurtleAwal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PosisiTurtleAwal>)))
  "Returns md5sum for a message object of type '<PosisiTurtleAwal>"
  "288aa94287e593d6b2c56dbae4b540d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PosisiTurtleAwal)))
  "Returns md5sum for a message object of type 'PosisiTurtleAwal"
  "288aa94287e593d6b2c56dbae4b540d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PosisiTurtleAwal>)))
  "Returns full string definition for message of type '<PosisiTurtleAwal>"
  (cl:format cl:nil "float64 xawal~%float64 yawal~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PosisiTurtleAwal)))
  "Returns full string definition for message of type 'PosisiTurtleAwal"
  (cl:format cl:nil "float64 xawal~%float64 yawal~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PosisiTurtleAwal>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PosisiTurtleAwal>))
  "Converts a ROS message object to a list"
  (cl:list 'PosisiTurtleAwal
    (cl:cons ':xawal (xawal msg))
    (cl:cons ':yawal (yawal msg))
))
