## run through roswell
LISP=ros run --

LISPFLAGS=--quit --non-interactive

.PHONY: tests
tests:
	$(LISP) $(LISPFLAGS) --load tests-runner.lisp
