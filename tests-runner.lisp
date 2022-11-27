(push #P"./" ql:*local-project-directories*)

(quicklisp:quickload :cl-creditcard-test)

(setq fiveam:*on-error* :debug)

(in-package #:cl-user)

(setf *debugger-hook*
      (lambda (c h)
	(declare (ignore c h))
	(uiop:quit -1)))

(unless (fiveam:run-all-tests)
  (exit :code 1 :abort t))
