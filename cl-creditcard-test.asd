(asdf:defsystem #:cl-creditcard-test
  :description "package with automated testing for creditcard."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.0"
  :serial t
  :depends-on (#:cl-creditcard #:fiveam)
  :components ((:module "t"
			:components ((:file "suites")))))
