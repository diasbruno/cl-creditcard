(defpackage #:creditcard-tests.database
  (:use #:cl)
  (:export
   #:setup-database
   #:teardown-database
   #:with-database))

(in-package :creditcard-tests.database)

(defparameter *provider*
  (migratum.provider.local-path:make-provider
   (list #P"./db/")))

(defparameter *connection* nil)

(defparameter *driver* nil)

(defun setup-database ()
  (setf *connection* (dbi:connect :sqlite3 :database-name ":memory:")
        *driver* (migratum.driver.dbi:make-driver *provider* *connection*))
  (migratum:provider-init *provider*)
  (migratum:driver-init *driver*)
  (migratum:apply-pending *driver*))

(defun teardown-database ()
  (setf *connection* (dbi:disconnect *connection*)
        *driver* nil))

(defmacro with-database (var &body body)
  `(progn
    (setup-database)
    (let ((,(car var) *connection*))
      ,@body)
    (teardown-database)))
