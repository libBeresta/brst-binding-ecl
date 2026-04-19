;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func UnicodeToGlyphName 
     "BRST_UnicodeToGlyphName" 
      CSTR 
  ((unicode UNICODE)))

(func GlyphNameToUnicode 
     "BRST_GlyphNameToUnicode" 
      UNICODE 
  ((glyph-name CSTR)))
