
(cl:in-package :asdf)

(defsystem "FindOS-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "FollowMsg" :depends-on ("_package_FollowMsg"))
    (:file "_package_FollowMsg" :depends-on ("_package"))
    (:file "navigate_msg" :depends-on ("_package_navigate_msg"))
    (:file "_package_navigate_msg" :depends-on ("_package"))
  ))