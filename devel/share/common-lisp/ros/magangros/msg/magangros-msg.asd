
(cl:in-package :asdf)

(defsystem "magangros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PosisiTurtle" :depends-on ("_package_PosisiTurtle"))
    (:file "_package_PosisiTurtle" :depends-on ("_package"))
  ))