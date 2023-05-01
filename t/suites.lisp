(defpackage #:creditcard.tests
  (:use #:cl #:fiveam))

(in-package :creditcard.tests)

(5am:def-suite test-suite
  :description "Suite for tests.")

(5am:def-test test-is-setup-working (:suite test-suite)
  (5am:is (equal creditcard:+CREDIT-CARD-VERSION+ "0.0.0")))
