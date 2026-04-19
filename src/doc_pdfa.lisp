;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-PDFA-SetConformance 
     "BRST_Doc_PDFA_SetConformance" 
      STATUS 
  ((pdf Doc)
   (pdfa-type PDFAType)))

(func Doc-PDFA-AddXmpExtension 
     "BRST_Doc_PDFA_AddXmpExtension" 
      STATUS 
  ((pdf Doc)
   (xmp-description CSTR)))

(func Doc-PDFA-AppendOutputIntents 
     "BRST_Doc_PDFA_AppendOutputIntents" 
      STATUS 
  ((pdf Doc)
   (iccname CSTR)
   (iccdict Dict)))
