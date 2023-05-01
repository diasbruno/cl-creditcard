(asdf:defsystem #:creditcard.test
  :description "package with automated testing for creditcard."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.0"
  :serial t
  :depends-on (#:fiveam
               #:creditcard)
  :components ((:module "t"
                :components ((:file "suites")))))
