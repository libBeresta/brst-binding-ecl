;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(synonym Image Dict)

(func Image-AddSMask 
     "BRST_Image_AddSMask" 
      STATUS 
  ((image Image)
   (smask Image)))

(func Image-Width 
     "BRST_Image_Width" 
      UINT 
  ((image Image)))

(func Image-Height 
     "BRST_Image_Height" 
      UINT 
  ((image Image)))

(func Image-BitsPerComponent 
     "BRST_Image_BitsPerComponent" 
      UINT 
  ((image Image)))

(func Image-ColorSpace 
     "BRST_Image_ColorSpace" 
      CSTR 
  ((image Image)))

(func Image-SetColorMask 
     "BRST_Image_SetColorMask" 
      STATUS 
  ((image Image)
   (rmin UINT)
   (rmax UINT)
   (gmin UINT)
   (gmax UINT)
   (bmin UINT)
   (bmax UINT)))

(func Image-SetMaskImage 
     "BRST_Image_SetMaskImage" 
      STATUS 
  ((image Image)
   (mask-image Image)))
