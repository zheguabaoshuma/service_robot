
(cl:in-package :asdf)

(defsystem "homework3-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CustomMessage" :depends-on ("_package_CustomMessage"))
    (:file "_package_CustomMessage" :depends-on ("_package"))
  ))