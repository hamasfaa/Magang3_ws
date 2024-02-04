;; Auto-generated. Do not edit!


(when (boundp 'magangros::PosisiTurtleAwal)
  (if (not (find-package "MAGANGROS"))
    (make-package "MAGANGROS"))
  (shadow 'PosisiTurtleAwal (find-package "MAGANGROS")))
(unless (find-package "MAGANGROS::POSISITURTLEAWAL")
  (make-package "MAGANGROS::POSISITURTLEAWAL"))

(in-package "ROS")
;;//! \htmlinclude PosisiTurtleAwal.msg.html


(defclass magangros::PosisiTurtleAwal
  :super ros::object
  :slots (_xawal _yawal ))

(defmethod magangros::PosisiTurtleAwal
  (:init
   (&key
    ((:xawal __xawal) 0.0)
    ((:yawal __yawal) 0.0)
    )
   (send-super :init)
   (setq _xawal (float __xawal))
   (setq _yawal (float __yawal))
   self)
  (:xawal
   (&optional __xawal)
   (if __xawal (setq _xawal __xawal)) _xawal)
  (:yawal
   (&optional __yawal)
   (if __yawal (setq _yawal __yawal)) _yawal)
  (:serialization-length
   ()
   (+
    ;; float64 _xawal
    8
    ;; float64 _yawal
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _xawal
       (sys::poke _xawal (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yawal
       (sys::poke _yawal (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _xawal
     (setq _xawal (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yawal
     (setq _yawal (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get magangros::PosisiTurtleAwal :md5sum-) "288aa94287e593d6b2c56dbae4b540d0")
(setf (get magangros::PosisiTurtleAwal :datatype-) "magangros/PosisiTurtleAwal")
(setf (get magangros::PosisiTurtleAwal :definition-)
      "float64 xawal
float64 yawal
")



(provide :magangros/PosisiTurtleAwal "288aa94287e593d6b2c56dbae4b540d0")


