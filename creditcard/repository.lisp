(defpackage #:creditcard.repository
  (:use #:cl)
  (:local-nicknames (#:cc #:creditcard))
  (:export
   #:create
   #:model-id))

(in-package :creditcard.repository)

(defclass creditcard-model (cc:creditcard database:model)
  ())

(defun creditcard->model (card)
  (make-instance 'creditcard-model
                 :card-number (cc:credit-card-number card)
                 :card-holder-id (cc:credit-card-holder card)
                 :cvv (cc:credit-card-cvv card)
                 :expiration-date (cc:credit-card-expiration-date card)))

(defgeneric create (storage object))

(defvar insert-query
  (str:concat
   "insert into cards (card_holder_id, card_number, cvv, expiration_date, created_at) "
   "values (?,?,?,?,datetime('now', 'utc')) returning id"))

(defmethod create ((storage database:database-storage) object)
  (with-slots (database:connection)
      storage
    (let* ((instance (creditcard->model object))
           (query (dbi:prepare database:connection insert-query)))
      (with-slots (cc::card-holder-id cc::card-number cc::cvv cc::expiration-date)
          instance
        (prog1 instance
          (let ((key (intern "id" :keyword)))
            (dbi:execute query (list cc::card-holder-id cc::card-number cc::cvv
                                     (local-time:format-timestring nil cc::expiration-date)))
            (database:update-model-id instance
                                      (cadr (assoc key (dbi.driver:query-results query))))))))))
