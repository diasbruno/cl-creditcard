(defpackage #:creditcard
            (:use #:cl)
            (:export
             #:+CREDIT-CARD-VERSION+))

(in-package #:creditcard)

(defvar +CREDIT-CARD-VERSION+ "0.0.0"
  "creditcard library version.")
