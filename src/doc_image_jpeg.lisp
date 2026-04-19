;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-Image-Jpeg-LoadFromFile 
     "BRST_Doc_Image_Jpeg_LoadFromFile" 
      Image 
  ((pdf Doc)
   (filename CSTR)))

(func Doc-Image-Jpeg-LoadFromMemory 
     "BRST_Doc_Image_Jpeg_LoadFromMemory" 
      Image 
  ((pdf Doc)
   (buf BYTE*)
   (size UINT)))
