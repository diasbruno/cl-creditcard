(defpackage #:database
  (:use #:cl)
  (:export
   #:model
   #:model-id
   #:update-model-id
   #:database-storage
   #:connection))

(in-package :database)

(defclass storage ()
  ())

(defclass database-storage (storage)
  ((connection :accessor connection
               :initarg :connection
               :initform nil)))

(defclass model ()
  ((id :accessor id :initform 0 :type integer)))

(defgeneric model-id (model))

(defmethod model-id ((model model))
  (slot-value model 'id))

(defun update-model-id (model id)
  (setf (slot-value model 'id) id))
