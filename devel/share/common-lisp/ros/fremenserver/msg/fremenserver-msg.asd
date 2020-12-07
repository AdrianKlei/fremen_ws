
(cl:in-package :asdf)

(defsystem "fremenserver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "FremenAction" :depends-on ("_package_FremenAction"))
    (:file "_package_FremenAction" :depends-on ("_package"))
    (:file "FremenActionFeedback" :depends-on ("_package_FremenActionFeedback"))
    (:file "_package_FremenActionFeedback" :depends-on ("_package"))
    (:file "FremenActionGoal" :depends-on ("_package_FremenActionGoal"))
    (:file "_package_FremenActionGoal" :depends-on ("_package"))
    (:file "FremenActionResult" :depends-on ("_package_FremenActionResult"))
    (:file "_package_FremenActionResult" :depends-on ("_package"))
    (:file "FremenFeedback" :depends-on ("_package_FremenFeedback"))
    (:file "_package_FremenFeedback" :depends-on ("_package"))
    (:file "FremenGoal" :depends-on ("_package_FremenGoal"))
    (:file "_package_FremenGoal" :depends-on ("_package"))
    (:file "FremenResult" :depends-on ("_package_FremenResult"))
    (:file "_package_FremenResult" :depends-on ("_package"))
  ))