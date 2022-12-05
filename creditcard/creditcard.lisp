(in-package :creditcard)

(defclass creditcard ()
  ((card-holder-id :accessor card-holder-id
                   :initarg :card-holder-id
                   :initform 0
                   :type integer)
   (card-number :accessor card-number
                :initarg :card-number
                :initform ""
                :type string)
   (cvv :accessor cvv
        :initarg :cvv
        :initform +CREDIT-CARD-VALID-CVV+
        :type string)
   (expiration-date :accessor expiration-date
                    :initarg :expiration-date
                    :initform nil
                    :type local-time:date)
   (created-at :accessor created-at
               :initarg :created-at
               :initform nil
               :type local-time:date)
   (updated-at :accessor created-at
               :initarg :updated-at
               :initform nil
               :type local-time:date)
   (deleted-at :accessor deleted-at
               :initarg :deleted-at
               :initform nil
               :type local-time:date)))

(defmethod credit-card-number ((object creditcard))
  (slot-value object 'card-number))

(defmethod credit-card-holder ((object creditcard))
  (slot-value object 'card-holder-id))

(defmethod credit-card-cvv ((object creditcard))
  (slot-value object 'cvv))

(defmethod credit-card-expiration-date ((object creditcard))
  (slot-value object 'expiration-date))

(defun generate-credit-card-number ()
  (let ((card-number (make-string +CREDIT-CARD-NUMBER-LENGTH+)))
    (setf (aref card-number (- +CREDIT-CARD-NUMBER-LENGTH+ 1)) #\0)
    (loop :for x :upto (- +CREDIT-CARD-NUMBER-LENGTH+ 2)
          :do (setf (aref card-number x) (digit-char (random 10))))
    card-number))

(defun create
    (card-holder-id
     &optional
       card-number-generator
       date-now)
  (let ((created-at (funcall (or date-now
                                 #'local-time:now))))
    (make-instance 'creditcard
                   :card-holder-id card-holder-id
                   :card-number (funcall (or card-number-generator
                                             #'generate-credit-card-number))
                   :cvv +CREDIT-CARD-VALID-CVV+
                   :expiration-date created-at)))
