;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(synonym OutputIntent Dict)

(func Doc-OutputIntent-New 
     "BRST_Doc_OutputIntent_New" 
      OutputIntent 
  ((pdf Doc)
   (identifier CSTR)
   (condition CSTR)
   (registry CSTR)
   (info CSTR)
   (outputProfile Array)))

(func Doc-OutputIntent-Add 
     "BRST_Doc_OutputIntent_Add" 
      STATUS 
  ((pdf Doc)
   (intent OutputIntent)))
