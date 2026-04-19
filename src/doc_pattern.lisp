;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-Pattern-Tiling-Create 
     "BRST_Doc_Pattern_Tiling_Create" 
      Pattern 
  ((pdf Doc)
   (left REAL)
   (bottom REAL)
   (right REAL)
   (top REAL)
   (xstep REAL)
   (ystep REAL)
   (matrix Matrix)))

(func Doc-Pattern-Stream 
     "BRST_Doc_Pattern_Stream" 
      Stream 
  ((pat Pattern)))
