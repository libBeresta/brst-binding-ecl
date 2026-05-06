(in-package #:cl-beresta-tests)

(def-suite smoke-tests)
(in-suite smoke-tests)

(defun beresta-smoke-tests ()
  (run! 'smoke-tests))

(test smoke.0
      ;; Sanity check
      (is (= 1 1))

      (let ((filename "minimal.pdf")
            (pdf-snippet "%PDF"))

        ;; Create PDF file
        (with-pdf-document (pdf filename)
          (let ((page (doc-page-add pdf)))
            (page-setsize page
                          page-size-a4
                          page-orientation-landscape)))

        ;; File created?
        (is-true (probe-file filename))

        ;; File is PDF (started with PDF prefix)?
        (is (string= (flexi-streams:octets-to-string 
                      (subseq 
                       (alexandria:read-file-into-byte-vector filename)
                       0 4))
                     pdf-snippet))))
