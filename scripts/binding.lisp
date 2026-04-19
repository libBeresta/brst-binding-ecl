;; Выгружаем только ISO-216 (Бумага размеров A3, A4, B4, ...)
(defvar *ISO-216-only* t)

;; Список сущностей, экспортируемых из файла macro.lisp
(defparameter +exported-macros+
  '("page-set-dash-pattern"
    "stream-set-dash-pattern"
    "with-page-gsave"
    "with-pdf-document"
    "with-stream-gsave"
    "with-ttf-font"
    "string-to-cstring"))

(defparameter +package-header+
  "(in-package #:cl-user)

(defpackage #:cl-beresta
  (:use #:cl)
  (:nicknames :brst)
  (:export")

(defparameter +package-footer+
  ")
(:shadow :REAL :BYTE :Error :Array :PI))
")

(defparameter +license+
  ";;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;
")


(defun do-render (template-file
                  data-file
                  &optional &key
                              (lang *language*)
                              (output :no))
  (when (not (eql output :no))
    (princ (format nil "Processing ~A...~%" data-file)))

  (mapcar #'(lambda (x)
              (let* ((str (string x))
                     (key (intern str :keyword))
                     (val (string-downcase (concatenate 'string ":" str)))
                     (substitute (gethash (cons val *language*) *substitutes*)))
                (setf (getf djula:*default-template-arguments* key) substitute)))
          +given-substitutes+)

  (let* ((*language* lang)
         (template (djula:compile-template* template-file))
         (data (with-open-file (s data-file) (read s))))
    (let ((res (apply #'djula:render-template*
                      (cons template
                            (cons nil
                                  data)))))

      (if (eq output :no)
          res
          (progn
            (alexandria:write-string-into-file
               res
               output
               :if-exists :supersede
               :if-does-not-exist :create)
            res)))))

;; Генератор привязки ECL
(defun do-create-binding (args)
  (let* (;; Путь до файлов данных генератора
         (gen-dir (first args))

         ;; Путь до файлов-шаблонов
         (templates-dir (second args))

         ;; Папка для сохранения сгенерированных файлов
         (target (third args))

         ;; Список файлов данных генератора
         (data (directory
                (merge-pathnames (pathname gen-dir)
                                 (pathname "*.lsp"))))

         ;; Список файлов-шаблонов
         (ecl-template  (merge-pathnames (pathname templates-dir)
					 (pathname "ecl.dj")))
         ;; Целевая папка
         (target-path (pathname target)))

    (let (;; Таблицы, заполняемые с помощью load-data
          (*enums-lsp*     (make-hash-table :test 'equalp))
          (*functions-lsp* (make-hash-table :test 'equalp))
          (*pointers-lsp*  (make-hash-table :test 'equalp))
          (*sizes-lsp*     nil)
          ;; Список, формируемый из экспортов
          ;; сущностей. Основа для формирования package.lisp
          (exports         nil)
          (package-file    (merge-pathnames target-path
                                            (pathname "package.lisp"))))

      (dolist (data-file data)
        ;; Заполняем хеш-таблицы
        (load-data data-file))

      ;; Указатели (сортируем по имени файла)
      (let ((pointer-header ""))
        (pushnew "" exports)
        (pushnew " ;; Pointers" exports)
        (pushnew " ;; ========" exports)
        (dolist (p (sort
                    (alexandria:hash-table-alist *pointers-lsp*)
                    #'string-lessp :key #'cadr))
          (let ((pointer (car p))
                (filename (cadr p)))
            (when (not (string-equal filename pointer-header))
              (push "" exports)
              (pushnew (str:concat "  ;; " filename) exports)
              (setf pointer-header filename))
            (pushnew (str:concat "  #:" (under pointer)) exports))))

      ;; Функции (сортируем по имени файла)
      (let ((function-header ""))
        (pushnew "" exports)
        (pushnew "  ;; Functions" exports)
        (pushnew "  ;; =========" exports)
        (dolist (f (sort
                    (alexandria:hash-table-alist *functions-lsp*)
                    #'string-lessp :key #'cadr))
          (let ((function (car f))
                (filename (cadr f)))
            (when (not (string-equal filename function-header))
              (push "" exports)
              (pushnew (str:concat "  ;; " filename) exports)
              (setf function-header filename))
            (pushnew (str:concat "  #:" (under function)) exports))))

      ;; Перечисления (сортируем по имени файла)
      (let ((enum-header ""))
        (pushnew "" exports)
        (pushnew "  ;; Enums" exports)
        (pushnew "  ;; =====" exports)
        (dolist (e (sort
                    (alexandria:hash-table-alist *enums-lsp*)
                    #'string-lessp :key #'cadr))
          (let ((enum (car e))
                (filename (cadr e))
                (enum-data (cddr e)))
            (when (not (string-equal filename enum-header))
              (push "" exports)
              (pushnew (str:concat "  ;; " filename) exports)
              (setf function-header filename))
            (pushnew (str:concat "  ;; " enum) exports)
            ;; В перечислениях пишем не название, а элементы
            (dolist (ed (getf enum-data :elements))
              (pushnew (str:concat "  #:" (under (getf ed :element))) exports)))))

      ;; Размеры бумаги
      (pushnew "" exports)
      (pushnew "  ;; Page sizes" exports)
      (pushnew "  ;; ==========" exports)

      ;; Если задано, что нам нужны не все размеры,
      ;; то отсекаем из списка лишнее.
      (dolist (s (if *ISO-216-only*
                     (remove-if-not #'(lambda (x)
                                        (string-equal "ISO 216"
                                                      (getf x :origin)))
                                    *sizes-lsp*)
                     *sizes-lsp*))
        (pushnew (str:concat "  #:PAGE-SIZE-" (under (getf s :id))) exports))

      ;; Макросы, находящиеся в macro.lisp
      (pushnew "" exports)
      (pushnew "  ;; Macro" exports)
      (pushnew "  ;; =====" exports)
      (dolist (m +exported-macros+)
        (pushnew (str:concat "  #:" m) exports))

      ;; Сохранение файла
      (with-open-file (f package-file
                         :if-exists :supersede
                         :if-does-not-exist :create
                         :direction :output)
        (write-line +license+ f)
        (write-line +package-header+ f)
        (write-line (str:join (format nil "~%")
                              (reverse exports))
                    f)
        (write-line +package-footer+ f))

      (setf (getf djula:*default-template-arguments* :license) +license+)
      (dolist (d data)
	(let ((rendered (do-render ecl-template d)))
	  (alexandria:write-string-into-file
	   rendered
	   (change-ext d (namestring target-path) "lisp")
	   :if-exists :supersede
           :if-does-not-exist :create))))))
