;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;


(in-package #:cl-beresta)

(enum PageSizes (
  ;; "ISO 216 4A0" (1682.0mm x 2378.0mm)
  4A0
  ;; "ISO 216 2A0" (1189.0mm x 1682.0mm)
  2A0
  ;; "ISO 216 A0" (841.0mm x 1189.0mm)
  A0
  ;; "ISO 216 A0+" (914.0mm x 1292.0mm)
  A0-PLUS
  ;; "ISO 216 A1" (594.0mm x 841.0mm)
  A1
  ;; "ISO 216 A1+" (609.0mm x 914.0mm)
  A1-PLUS
  ;; "ISO 216 A2" (420.0mm x 594.0mm)
  A2
  ;; "ISO 216 A3" (297.0mm x 420.0mm)
  A3
  ;; "ISO 216 A3+" (329.0mm x 483.0mm)
  A3-PLUS
  ;; "ISO 216 A4" (210.0mm x 297.0mm)
  A4
  ;; "ISO 216 A5" (148.0mm x 210.0mm)
  A5
  ;; "ISO 216 A6" (105.0mm x 148.0mm)
  A6
  ;; "ISO 216 A7" (74.0mm x 105.0mm)
  A7
  ;; "ISO 216 A8" (52.0mm x 74.0mm)
  A8
  ;; "ISO 216 A9" (37.0mm x 52.0mm)
  A9
  ;; "ISO 216 A10" (26.0mm x 37.0mm)
  A10
  ;; "ISO 216 B0" (1000.0mm x 1414.0mm)
  B0
  ;; "ISO 216 B0+" (1118.0mm x 1580.0mm)
  B0-PLUS
  ;; "ISO 216 B1" (707.0mm x 1000.0mm)
  B1
  ;; "ISO 216 B1+" (720.0mm x 1020.0mm)
  B1-PLUS
  ;; "ISO 216 B2" (500.0mm x 707.0mm)
  B2
  ;; "ISO 216 B2+" (520.0mm x 720.0mm)
  B2-PLUS
  ;; "ISO 216 B3" (353.0mm x 500.0mm)
  B3
  ;; "ISO 216 B4" (250.0mm x 353.0mm)
  B4
  ;; "ISO 216 B5" (176.0mm x 250.0mm)
  B5
  ;; "ISO 216 B6" (125.0mm x 176.0mm)
  B6
  ;; "ISO 216 B7" (88.0mm x 125.0mm)
  B7
  ;; "ISO 216 B8" (62.0mm x 88.0mm)
  B8
  ;; "ISO 216 B9" (44.0mm x 62.0mm)
  B9
  ;; "ISO 216 B10" (31.0mm x 44.0mm)
  B10
  ;; "ISO 216 B11" (22.0mm x 31.0mm)
  B11
  ;; "ISO 216 B12" (15.0mm x 22.0mm)
  B12
  ;; "ISO 216 B13" (11.0mm x 15.0mm)
  B13
  ;; "ISO 216 C0" (917.0mm x 1297.0mm)
  C0
  ;; "ISO 216 C1" (648.0mm x 917.0mm)
  C1
  ;; "ISO 216 C2" (458.0mm x 648.0mm)
  C2
  ;; "ISO 216 C3" (324.0mm x 458.0mm)
  C3
  ;; "ISO 216 C4" (229.0mm x 324.0mm)
  C4
  ;; "ISO 216 C5" (162.0mm x 229.0mm)
  C5
  ;; "ISO 216 C6" (114.0mm x 162.0mm)
  C6
  ;; "ISO 216 C7" (81.0mm x 114.0mm)
  C7
  ;; "ISO 216 C8" (57.0mm x 81.0mm)
  C8
  ;; "ISO 216 C9" (40.0mm x 57.0mm)
  C9
  ;; "ISO 216 C10" (28.0mm x 40.0mm)
  C10
))