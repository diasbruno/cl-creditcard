(defpackage #:creditcard-tests.creditcard
  (:use #:cl #:fiveam)
  (:local-nicknames (#:cc #:creditcard)
                    (#:cc-repo #:creditcard.repository)
                    (#:cc-create #:creditcard.usecases.create)
                    (#:cc-db #:creditcard-tests.database)))

(in-package :creditcard-tests.creditcard)

(5am:def-suite test-credit-card-suite
  :description "Suite for credit card tests.")

(defvar +TEST-CREDIT-CARD-HODER-ID+
  1)

(defvar +TEST-CREDIT-CARD-NUMBER+
  "1111111111111110")

(defvar +TEST-CREDIT-CARD-EXPIRATION-DATE+
  "2022-11-27T19:21:00-0300")

(defun const-card ()
  +TEST-CREDIT-CARD-NUMBER+)

(defun const-date-now ()
  (local-time:parse-rfc3339-timestring
   +TEST-CREDIT-CARD-EXPIRATION-DATE+))

(5am:def-test test-create-credit-card
    (:suite test-credit-card-suite)
  (let ((card (cc:create +TEST-CREDIT-CARD-HODER-ID+
                         #'const-card
                         #'const-date-now)))
    (5am:is (equal (cc:credit-card-number card)
                   +TEST-CREDIT-CARD-NUMBER+))
    (5am:is (equal (cc:credit-card-holder card)
                   +TEST-CREDIT-CARD-HODER-ID+))
    (5am:is (equal (cc:credit-card-cvv card)
                   creditcard::+CREDIT-CARD-VALID-CVV+))
    (5am:is (local-time:timestamp=
             (cc:credit-card-expiration-date card)
             (const-date-now)))))

(5am:def-test test-use-case-create-credit-card
    (:suite test-credit-card-suite)
  (cc-db:with-database (connection)
    (let ((card-holder-id 1))
      (let* ((input (cc-create:make-input
                     :card-holder-id
                     +TEST-CREDIT-CARD-HODER-ID+))
             (card (cc-create:create input
                                     (make-instance 'database:database-storage
                                                    :connection connection)
                                     #'const-card
                                     #'const-date-now)))
        (5am:is (equal (database:model-id card) 1))
        (5am:is (equal (cc:credit-card-number card)
                       +TEST-CREDIT-CARD-NUMBER+))
        (5am:is (equal (cc:credit-card-holder card)
                       +TEST-CREDIT-CARD-HODER-ID+))
        (5am:is (equal (cc:credit-card-cvv card)
                       cc:+CREDIT-CARD-VALID-CVV+))
        (5am:is (local-time:timestamp=
                 (cc:credit-card-expiration-date card)
                 (const-date-now)))))))
