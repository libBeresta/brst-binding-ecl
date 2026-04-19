;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-Image-Png-LoadFromMemory 
     "BRST_Doc_Image_Png_LoadFromMemory" 
      Image 
  ((pdf Doc)
   (buf BYTE*)
   (size UINT)))

(func Doc-Image-Png-LoadFromFile 
     "BRST_Doc_Image_Png_LoadFromFile" 
      Image 
  ((pdf Doc)
   (filename CSTR)))

(func Doc-Image-Png-LoadFromFile2 
     "BRST_Doc_Image_Png_LoadFromFile2" 
      Image 
  ((pdf Doc)
   (filename CSTR)))
