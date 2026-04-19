;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-Image-Raw1Bit-LoadFromMemory 
     "BRST_Doc_Image_Raw1Bit_LoadFromMemory" 
      Image 
  ((pdf Doc)
   (buf BYTE*)
   (width UINT)
   (height UINT)
   (line-width UINT)
   (black-is1 BOOL)
   (top-is-first BOOL)))

(func Doc-Image-Raw-LoadFromFile 
     "BRST_Doc_Image_Raw_LoadFromFile" 
      Image 
  ((pdf Doc)
   (filename CSTR)
   (width UINT)
   (height UINT)
   (color-space ColorSpace)))

(func Doc-Image-Raw-LoadFromMemory 
     "BRST_Doc_Image_Raw_LoadFromMemory" 
      Image 
  ((pdf Doc)
   (buf BYTE*)
   (width UINT)
   (height UINT)
   (color-space ColorSpace)
   (bits-per-component UINT)))
