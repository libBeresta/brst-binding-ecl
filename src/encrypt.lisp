;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(enum EncryptMode (
  (ENCRYPT-R0 0)
  (ENCRYPT-R1 1)
  (ENCRYPT-R2 2)
  (ENCRYPT-R3 3)
  (ENCRYPT-R4 4)
))
