(in-package #:cl-beresta)

(with-pdf-document (pdf "properties.pdf")
  (let ((page (doc-page-add pdf)))
    (page-setsize page
                  page-size-a4
                  page-orientation-landscape)

    (Doc-UseUTFEncodings pdf)
    (Doc-Encoder-SetCurrent pdf "UTF-8")

    (Doc-SetInfoAttr pdf INFO-AUTHOR   (string-to-cstring "Автор / Author / Autor"))
    (Doc-SetInfoAttr pdf INFO-CREATOR  (string-to-cstring "Разработчик / Creator / Creador"))
    (Doc-SetInfoAttr pdf INFO-PRODUCER (string-to-cstring "Продюсер / Producer / Productor"))
    (Doc-SetInfoAttr pdf INFO-TITLE    (string-to-cstring "Заголовок / Title / Título"))
    (Doc-SetInfoAttr pdf INFO-SUBJECT  (string-to-cstring "Тема / Subject / Asunto"))
    (Doc-SetInfoAttr pdf INFO-KEYWORDS (string-to-cstring "Ключевые слова, Keywords, Palabras clave"))

    (let ((date (Date-Now pdf)))
      (Doc-SetInfoDateAttr pdf INFO-CREATION-DATE date)
      (Doc-SetInfoDateAttr pdf INFO-MOD-DATE date))))
