;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-SetOpenAction 
     "BRST_Doc_SetOpenAction" 
      STATUS 
  ((pdf Doc)
   (open-action Destination)))

(func Doc-ViewerPreference 
     "BRST_Doc_ViewerPreference" 
      ViewerPreference 
  ((pdf Doc)))

(func Doc-SetViewerPreference 
     "BRST_Doc_SetViewerPreference" 
      STATUS 
  ((pdf Doc)
   (value ViewerPreference)))
