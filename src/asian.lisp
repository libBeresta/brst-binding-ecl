;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func UseJPFonts 
     "BRST_UseJPFonts" 
      STATUS 
  ((pdf Doc)))

(func UseKRFonts 
     "BRST_UseKRFonts" 
      STATUS 
  ((pdf Doc)))

(func UseCNSFonts 
     "BRST_UseCNSFonts" 
      STATUS 
  ((pdf Doc)))

(func UseCNTFonts 
     "BRST_UseCNTFonts" 
      STATUS 
  ((pdf Doc)))

(func UseJPEncodings 
     "BRST_UseJPEncodings" 
      STATUS 
  ((pdf Doc)))

(func UseKREncodings 
     "BRST_UseKREncodings" 
      STATUS 
  ((pdf Doc)))

(func UseCNSEncodings 
     "BRST_UseCNSEncodings" 
      STATUS 
  ((pdf Doc)))

(func UseCNTEncodings 
     "BRST_UseCNTEncodings" 
      STATUS 
  ((pdf Doc)))
