(let ((env (uiop:getenv "ENV")))
  (when (string= env "development")
    (push #P"../cl-sqlite/" ql:*local-project-directories*)))

(push #P"./" ql:*local-project-directories*)

(ql:quickload :creditcard-tests)

(setq fiveam:*on-error* :debug)

(setf *debugger-hook*
      (lambda (c h)
        (declare (ignore c h))
        (uiop:quit -1)))

(unless (fiveam:run-all-tests)
  (exit :code 1 :abort t))
