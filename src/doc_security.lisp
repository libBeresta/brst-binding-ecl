;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-beresta)

(include-header)

(func Doc-SetPassword 
     "BRST_Doc_SetPassword" 
      STATUS 
  ((pdf Doc)
   (owner-password CSTR)
   (user-password CSTR)))

(func Doc-SetPermission 
     "BRST_Doc_SetPermission" 
      STATUS 
  ((pdf Doc)
   (permission Permission)))

(func Doc-SetEncryptionMode 
     "BRST_Doc_SetEncryptionMode" 
      STATUS 
  ((pdf Doc)
   (mode EncryptMode)
   (key-len UINT)))
