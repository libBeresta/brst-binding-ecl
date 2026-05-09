;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-UseJPFonts 
     "BRST_Doc_UseJPFonts" 
      STATUS 
  ((pdf Doc)))

(func Doc-UseKRFonts 
     "BRST_Doc_UseKRFonts" 
      STATUS 
  ((pdf Doc)))

(func Doc-UseCNSFonts 
     "BRST_Doc_UseCNSFonts" 
      STATUS 
  ((pdf Doc)))

(func Doc-UseCNTFonts 
     "BRST_Doc_UseCNTFonts" 
      STATUS 
  ((pdf Doc)))

(func Doc-UseJPEncodings 
     "BRST_Doc_UseJPEncodings" 
      STATUS 
  ((pdf Doc)))

(func Doc-UseKREncodings 
     "BRST_Doc_UseKREncodings" 
      STATUS 
  ((pdf Doc)))

(func Doc-UseCNSEncodings 
     "BRST_Doc_UseCNSEncodings" 
      STATUS 
  ((pdf Doc)))

(func Doc-UseCNTEncodings 
     "BRST_Doc_UseCNTEncodings" 
      STATUS 
  ((pdf Doc)))
