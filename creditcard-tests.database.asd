(asdf:defsystem #:creditcard-tests.database
  :description "package with automated testing for creditcard."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.0"
  :serial t
  :depends-on (#:cl-dbi)
  :components ((:module "t"
                :components ((:file "database")))))
