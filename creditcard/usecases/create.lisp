(defpackage #:creditcard.usecases.create
  (:use #:cl)
  (:local-nicknames (#:cc #:creditcard)
                    (#:cc-repo #:creditcard.repository))
  (:export
   #:input
   #:create
   #:make-input))

(in-package #:creditcard.usecases.create)

(defstruct input
  card-holder-id)

(defgeneric create (object storage
                    &optional
                      card-number-generator
                      date-now))

(defmethod create ((object input) storage
                   &optional
                     card-number-generator
                     date-now)
  (cc-repo:create storage
                  (cc:create (input-card-holder-id object)
                             card-number-generator
                             date-now)))
