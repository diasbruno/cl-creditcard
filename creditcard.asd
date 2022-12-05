(asdf:defsystem #:creditcard
  :description "main package."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.0"
  :serial t
  :depends-on (#:local-time)
  :components ((:module "creditcard"
                :components ((:file "package")
                             (:file "constants")
                             (:file "protocol")
                             (:file "creditcard")))))
