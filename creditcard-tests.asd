(asdf:defsystem #:creditcard-tests
  :description "package with automated testing for creditcard."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.0"
  :serial t
  :depends-on (#:database
               #:cl-migratum
               #:cl-migratum.provider.local-path
               #:cl-migratum.driver.dbi
               #:fiveam
               #:creditcard
               #:creditcard.repository
               #:creditcard.usecases.create
               #:creditcard-tests.database)
  :components ((:module "t"
                :components ((:file "suites")
                             (:file "creditcard")))))
