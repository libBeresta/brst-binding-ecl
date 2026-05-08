;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-XObject-Create 
     "BRST_Doc_XObject_Create" 
      XObject 
  ((pdf Doc)
   (width REAL)
   (height REAL)
   (scalex REAL)
   (scaley REAL)))
