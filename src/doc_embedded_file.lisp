;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-AttachFile 
     "BRST_Doc_AttachFile" 
      EmbeddedFile 
  ((pdf Doc)
   (file CSTR)))
