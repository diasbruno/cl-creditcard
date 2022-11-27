(asdf:defsystem #:database
  :description "database infra."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.0"
  :serial t
  :components ((:module "database"
                :components ((:file "model")))))
