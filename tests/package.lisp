(defpackage #:cl-beresta-tests
  (:use #:common-lisp #:cl-beresta #:fiveam)

  (:export #:run! #:beresta-smoke-tests)

  ;; Some idents must be shadowed since used in library
  (:shadow :REAL :BYTE :Error :Array :PI))
