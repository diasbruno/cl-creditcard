LISPFLAGS=--quit --non-interactive

.PHONY: tests
tests:
	sbcl $(LISPFLAGS) --load tests-runner.lisp
