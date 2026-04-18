;;
;; libBeresta
;;
;; Заголовочные файлы для Embeddable Common Lisp (ecl)
;; Дмитрий Соломенников, (с) 2025-2026
;;

(in-package #:cl-user)

(defpackage #:cl-beresta
  (:use #:cl)
  (:nicknames :brst)
  (:export

 ;; Pointers
 ;; ========

  ;; array.lsp
  #:Array

  ;; date.lsp
  #:Date

  ;; dict.lsp
  #:Dict

  ;; doc.lsp
  #:Doc

  ;; error.lsp
  #:Error

  ;; fontdef.lsp
  #:FontDef

  ;; matrix.lsp
  #:Matrix

  ;; mmgr.lsp
  #:MMgr

  ;; stream.lsp
  #:Stream

  ;; xref.lsp
  #:Xref

  ;; Functions
  ;; =========

  ;; asian.lsp
  #:UseJPEncodings
  #:UseCNSEncodings
  #:UseKREncodings
  #:UseJPFonts
  #:UseCNTFonts
  #:UseCNTEncodings
  #:UseCNSFonts
  #:UseKRFonts

  ;; base.lsp
  #:PageSize-Width
  #:Doc-Destroy-All
  #:Doc-Destroy
  #:Doc-Initialized
  #:Doc-Free
  #:Version
  #:PageSize-Height
  #:Doc-New-Empty
  #:Doc-New-Ex
  #:Doc-New
  #:Doc-MMgr
  #:Doc-Initialize

  ;; date.lsp
  #:Date-Free
  #:Date-Part
  #:Date-Validate
  #:Date-Now

  ;; destination.lsp
  #:Destination-SetFitH
  #:Destination-SetFitBH
  #:Destination-SetFitB
  #:Destination-SetFitR
  #:Destination-SetFitV
  #:Destination-SetFit
  #:Destination-SetFitBV
  #:Destination-SetXYZ

  ;; doc_compression.lsp
  #:Doc-SetCompressionMode

  ;; doc_embedded_file.lsp
  #:Doc-AttachFile

  ;; doc_encoder.lsp
  #:Doc-Encoder-SetCurrent
  #:Doc-Encoder-Current
  #:Doc-Encoder-Prepare

  ;; doc_encoding_utf.lsp
  #:Doc-UseUTFEncodings

  ;; doc_ext_gstate.lsp
  #:Doc-Create-ExtGState

  ;; doc_font.lsp
  #:Doc-Type1Font-LoadFromFile
  #:Doc-TTFont-LoadFromFile
  #:Doc-Font
  #:Doc-TTFont-LoadFromMemory
  #:Doc-TTFont-LoadFromFile2

  ;; doc_image_jpeg.lsp
  #:Doc-Image-Jpeg-LoadFromMemory
  #:Doc-Image-Jpeg-LoadFromFile

  ;; doc_image_png.lsp
  #:Doc-Image-Png-LoadFromFile2
  #:Doc-Image-Png-LoadFromFile
  #:Doc-Image-Png-LoadFromMemory

  ;; doc_image_tiff.lsp
  #:Doc-Image-Raw-LoadFromMemory
  #:Doc-Image-Raw-LoadFromFile
  #:Doc-Image-Raw1Bit-LoadFromMemory

  ;; doc_info.lsp
  #:Doc-SetInfoAttr
  #:Doc-SetInfoDateAttr

  ;; doc_matrix.lsp
  #:Doc-Matrix-Skew
  #:Doc-Matrix-Translate
  #:Doc-Matrix-RotateDeg
  #:Doc-Matrix-Identity
  #:Doc-Matrix-Scale
  #:Doc-Matrix-Multiply
  #:Doc-Matrix-Free
  #:Doc-Matrix-Rotate

  ;; doc_output_intent.lsp
  #:Doc-OutputIntent-Add
  #:Doc-OutputIntent-New

  ;; doc_page.lsp
  #:Doc-Page-AddLabel
  #:Doc-Page-Layout
  #:Doc-Page-Add
  #:Doc-Page-SetLayout
  #:Doc-Page-ByIndex
  #:Doc-Page-Current
  #:Doc-Page-Mode
  #:Doc-Page-Insert
  #:Doc-Page-SetMode
  #:Doc-Pages-SetConfiguration

  ;; doc_page_pattern.lsp
  #:Doc-Dict-RGBPatternFill-Select
  #:Doc-Page-RGBPatternFill-Select
  #:Doc-Pattern-Tiling-Create
  #:Doc-Pattern-Stream
  #:Doc-Dict-RGBPatternFillUint-Select
  #:Doc-Dict-RGBPatternFillHex-Select
  #:Doc-Page-RGBPatternFillHex-Select
  #:Doc-Page-RGBPatternFillUint-Select

  ;; doc_pdfa.lsp
  #:Doc-PDFA-SetConformance
  #:Doc-PDFA-AddXmpExtension
  #:Doc-PDFA-AppendOutputIntents

  ;; doc_save.lsp
  #:Doc-SaveToStream
  #:Doc-SaveToFile

  ;; doc_security.lsp
  #:Doc-SetPassword
  #:Doc-SetEncryptionMode
  #:Doc-SetPermission

  ;; doc_viewer.lsp
  #:Doc-ViewerPreference
  #:Doc-SetViewerPreference
  #:Doc-SetOpenAction

  ;; doc_xobject.lsp
  #:Doc-XObject-CreateAsWhiteRect
  #:Doc-XObject-CreateFromImage
  #:Doc-XObject-Create

  ;; error.lsp
  #:Doc-Error-SetHandler
  #:Doc-Error-DetailCode
  #:Doc-Error-Reset
  #:Doc-Error-Code
  #:Error-Check

  ;; ext_gstate.lsp
  #:ExtGState-SetBlendMode
  #:ExtGState-SetAlphaFill
  #:ExtGState-SetAlphaStroke

  ;; font.lsp
  #:Font-Descent
  #:Font-TextWidth2

  ;; geometry.lsp
  #:Page-Arc
  #:Page-SetRGBStrokeUint
  #:Page-CurveTo3
  #:Page-FillColorSpace
  #:Page-MoveTo
  #:Page-Ellipse
  #:Page-LineJoin
  #:Page-Concat
  #:Page-Eoclip
  #:Page-LineTo
  #:Page-SetLineCap
  #:Page-LineWidth
  #:Page-ClosePath
  #:Page-SetRGBFillUint
  #:Page-EofillStroke
  #:Page-GrayFill
  #:Page-SetDash
  #:Page-SetRGBStrokeHex
  #:Page-ClosePathEofillStroke
  #:Page-Skew
  #:Page-GRestore
  #:Page-CurveTo
  #:Page-Scale
  #:Page-FillStroke
  #:Page-LineCap
  #:Page-SetGrayStroke
  #:Page-Translate
  #:Page-SetLineJoin
  #:Page-GSave
  #:Page-EndPath
  #:Page-StrokeColorSpace
  #:Page-ClosePathStroke
  #:Page-Flat
  #:Page-Matrix
  #:Page-ClosePathFillStroke
  #:Page-CurveTo2
  #:Page-SetLineWidth
  #:Page-SetCMYKStroke
  #:Page-Rectangle
  #:Page-SetMiterLimit
  #:Page-SetCMYKFill
  #:Page-Stroke
  #:Page-SetFlat
  #:Page-Circle
  #:Page-SetRGBStroke
  #:Page-SetRGBFill
  #:Page-SetRGBFillHex
  #:Page-MiterLimit
  #:Page-Eofill
  #:Page-RotateDeg
  #:Page-Fill
  #:Page-Rotate
  #:Page-GrayStroke
  #:Page-Clip
  #:Page-SetGrayFill

  ;; page_routines.lsp
  #:Page-SetExtGState
  #:Page-MMgr
  #:Page-Width
  #:Page-SetRotate
  #:Page-HorizontalScaling
  #:Page-CreateDestination
  #:Page-RawWrite
  #:Page-SetSlideShow
  #:Page-SetBoundary
  #:Page-SetHorizontalScaling
  #:Page-GMode
  #:Page-Insert-Shared-Content-Stream
  #:Page-SetHeight
  #:Page-GStateDepth
  #:Page-Height
  #:Page-SetZoom
  #:Page-SetSize
  #:Page-SetWidth

  ;; page_xobject.lsp
  #:Dict-XObject-Execute
  #:Page-XObject-Execute

  ;; stream_geometry.lsp
  #:Stream-FillStroke
  #:Stream-SetGrayFill
  #:Stream-Rectangle
  #:Stream-GSave
  #:Stream-SetCMYKFill
  #:Stream-SetRGBFillUint
  #:Stream-Rotate
  #:Stream-EofillStroke
  #:Stream-CurveTo
  #:Stream-Concat
  #:Stream-Fill
  #:Stream-ClosePathFillStroke
  #:Stream-SetRGBFill
  #:Stream-SetCMYKStroke
  #:Stream-ClosePath
  #:Stream-SetGrayStroke
  #:Stream-CurveTo2
  #:Stream-SetDash
  #:Stream-RotateDeg
  #:Stream-CurveTo3
  #:Stream-SetLineCap
  #:Stream-SetFlat
  #:Stream-Eoclip
  #:Stream-Circle
  #:Stream-SetRGBStrokeUint
  #:Stream-Scale
  #:Stream-GRestore
  #:Stream-LineTo
  #:Stream-MoveTo
  #:Stream-ClosePathEofillStroke
  #:Stream-SetLineWidth
  #:Stream-Eofill
  #:Stream-SetRGBStrokeHex
  #:Stream-SetLineJoin
  #:Stream-Translate
  #:Stream-ClosePathStroke
  #:Stream-SetRGBFillHex
  #:Stream-SetMiterLimit
  #:Stream-Stroke
  #:Stream-Skew
  #:Stream-EndPath
  #:Stream-SetRGBStroke
  #:Stream-Clip

  ;; stream_text.lsp
  #:Stream-SetTextMatrix
  #:Stream-TextOut
  #:Stream-MoveTextPos2
  #:Stream-SetTextRenderingMode
  #:Stream-BeginText
  #:Stream-ShowText
  #:Stream-MoveToNextLine
  #:Stream-SetTextLeading
  #:Stream-EndText
  #:Stream-MoveTextPos

  ;; text.lsp
  #:Page-TextOut
  #:Page-TextWidth
  #:Page-ShowText
  #:Page-WordSpace
  #:Page-SetTextRise
  #:Page-SetFontAndSize
  #:Page-MeasureText
  #:Page-MoveTextPos2
  #:Page-CharSpace
  #:Page-TextMatrix
  #:Page-CurrentFontSize
  #:Page-SetCharSpace
  #:Page-EndText
  #:Page-TextLeading
  #:Page-MoveToNextLine
  #:Page-ShowTextNextLineEx
  #:Page-SetTextLeading
  #:Page-TextRect
  #:Page-TextRenderingMode
  #:Page-CurrentFont
  #:Dict-SetFontAndSize
  #:Page-MoveTextPos
  #:Page-CurrentTextPos2
  #:Page-SetTextMatrix
  #:Page-ShowTextNextLine
  #:Page-SetWordSpace
  #:Page-TextRise
  #:Page-BeginText
  #:Page-SetTextRenderingMode

  ;; unicode_glyph.lsp
  #:GlyphNameToUnicode
  #:UnicodeToGlyphName

  ;; xobject.lsp
  #:XObject-Stream

  ;; Enums
  ;; =====

  ;; annotation.lsp
  ;; AnnotLineEnd
  #:ANNOT-LINE-END-NONE
  #:ANNOT-LINE-END-SQUARE
  #:ANNOT-LINE-END-CIRCLE
  #:ANNOT-LINE-END-DIAMOND
  #:ANNOT-LINE-END-OPENARROW
  #:ANNOT-LINE-END-CLOSEDARROW
  #:ANNOT-LINE-END-BUTT
  #:ANNOT-LINE-END-ROPENARROW
  #:ANNOT-LINE-END-RCLOSEDARROW
  #:ANNOT-LINE-END-SLASH

  ;; annotation.lsp
  ;; AnnotStampStyle
  #:ANNOT-STAMP-APPROVED
  #:ANNOT-STAMP-EXPERIMENTAL
  #:ANNOT-STAMP-NOTAPPROVED
  #:ANNOT-STAMP-ASIS
  #:ANNOT-STAMP-EXPIRED
  #:ANNOT-STAMP-NOTFORPUBLICRELEASE
  #:ANNOT-STAMP-CONFIDENTIAL
  #:ANNOT-STAMP-FINAL
  #:ANNOT-STAMP-SOLD
  #:ANNOT-STAMP-DEPARTMENTAL
  #:ANNOT-STAMP-FORCOMMENT
  #:ANNOT-STAMP-TOPSECRET
  #:ANNOT-STAMP-DRAFT
  #:ANNOT-STAMP-FORPUBLICRELEASE

  ;; annotation.lsp
  ;; AnnotIcon
  #:ANNOT-ICON-COMMENT
  #:ANNOT-ICON-KEY
  #:ANNOT-ICON-NOTE
  #:ANNOT-ICON-HELP
  #:ANNOT-ICON-NEW-PARAGRAPH
  #:ANNOT-ICON-PARAGRAPH
  #:ANNOT-ICON-INSERT

  ;; annotation.lsp
  ;; AnnotLineCapPosition
  #:ANNOT-LINE-CAP-INLINE
  #:ANNOT-LINE-CAP-TOP

  ;; annotation.lsp
  ;; AnnotType
  #:ANNOT-TEXT
  #:ANNOT-LINK
  #:ANNOT-FREE-TEXT
  #:ANNOT-LINE
  #:ANNOT-SQUARE
  #:ANNOT-CIRCLE
  #:ANNOT-POLYGON
  #:ANNOT-POLYLINE
  #:ANNOT-HIGHLIGHT
  #:ANNOT-UNDERLINE
  #:ANNOT-SQUIGGLY
  #:ANNOT-STRIKEOUT
  #:ANNOT-STAMP
  #:ANNOT-CARET
  #:ANNOT-INK
  #:ANNOT-POPUP
  #:ANNOT-FILE-ATTACHMENT
  #:ANNOT-SOUND
  #:ANNOT-MOVIE
  #:ANNOT-WIDGET
  #:ANNOT-SCREEN
  #:ANNOT-PRINTER-MARK
  #:ANNOT-TRAPNET
  #:ANNOT-WATERMARK
  #:ANNOT-3D
  #:ANNOT-REDACT

  ;; annotation.lsp
  ;; AnnotHighlightMode
  #:ANNOT-HIGHLIGHT-MODE-NONE
  #:ANNOT-HIGHLIGHT-MODE-INVERT
  #:ANNOT-HIGHLIGHT-MODE-OUTLINE
  #:ANNOT-HIGHLIGHT-MODE-PUSH

  ;; annotation.lsp
  ;; AnnotFlags
  #:ANNOT-FLAG-INVISIBLE
  #:ANNOT-FLAG-HIDDEN
  #:ANNOT-FLAG-PRINT
  #:ANNOT-FLAG-NOZOOM
  #:ANNOT-FLAG-NOROTATE
  #:ANNOT-FLAG-NOVIEW
  #:ANNOT-FLAG-READONLY
  #:ANNOT-FLAG-LOCKED
  #:ANNOT-FLAG-TOGGLE-NOVIEW
  #:ANNOT-FLAG-LOCKED-CONTENT

  ;; consts.lsp
  ;; CompressionMode
  #:COMP-MODE-NONE
  #:COMP-MODE-TEXT
  #:COMP-MODE-IMAGE
  #:COMP-MODE-METADATA
  #:COMP-MODE-ALL

  ;; consts.lsp
  ;; ViewerPreference
  #:HIDE-TOOLBAR
  #:HIDE-MENUBAR
  #:HIDE-WINDOW-UI
  #:FIT-WINDOW
  #:CENTER-WINDOW
  #:PRINT-SCALING-NONE
  #:DISPLAY-DOC-TITLE

  ;; consts.lsp
  ;; GMode
  #:GMODE-PAGE-DESCRIPTION
  #:GMODE-PATH-OBJECT
  #:GMODE-TEXT-OBJECT
  #:GMODE-CLIPPING-PATH
  #:GMODE-SHADING
  #:GMODE-INLINE-IMAGE
  #:GMODE-EXTERNAL-OBJECT

  ;; consts.lsp
  ;; Permission
  #:ENABLE-READ
  #:ENABLE-PRINT
  #:ENABLE-EDIT-ALL
  #:ENABLE-COPY
  #:ENABLE-EDIT

  ;; date.lsp
  ;; Date_Parts
  #:DATE-PART-YEAR
  #:DATE-PART-MONTH
  #:DATE-PART-DAY
  #:DATE-PART-HOUR
  #:DATE-PART-MINUTE
  #:DATE-PART-SECOND
  #:DATE-PART-HOUR-OFFSET
  #:DATE-PART-MINUTE-OFFSET
  #:DATE-PART-UT-RELATIONSHIP

  ;; date.lsp
  ;; UT_Relationship
  #:UT-RELATIONSHIP-NONE
  #:UT-RELATIONSHIP-PLUS
  #:UT-RELATIONSHIP-MINUS
  #:UT-RELATIONSHIP-ZERO

  ;; doc.lsp
  ;; PdfVer
  #:VER-10
  #:VER-11
  #:VER-12
  #:VER-13
  #:VER-14
  #:VER-15
  #:VER-16
  #:VER-17
  #:VER-20

  ;; doc_info.lsp
  ;; InfoType
  #:INFO-CREATION-DATE
  #:INFO-MOD-DATE
  #:INFO-AUTHOR
  #:INFO-CREATOR
  #:INFO-PRODUCER
  #:INFO-TITLE
  #:INFO-SUBJECT
  #:INFO-KEYWORDS
  #:INFO-TRAPPED
  #:INFO-GTS-PDFX

  ;; encrypt.lsp
  ;; EncryptMode
  #:ENCRYPT-R0
  #:ENCRYPT-R1
  #:ENCRYPT-R2
  #:ENCRYPT-R3
  #:ENCRYPT-R4

  ;; error.lsp
  ;; ErrorKind
  #:ARRAY-COUNT-ERR
  #:ARRAY-ITEM-NOT-FOUND
  #:ARRAY-ITEM-UNEXPECTED-TYPE
  #:BINARY-LENGTH-ERR
  #:CANNOT-GET-PALETTE
  #:DICT-COUNT-ERR
  #:DICT-ITEM-NOT-FOUND
  #:DICT-ITEM-UNEXPECTED-TYPE
  #:DICT-STREAM-LENGTH-NOT-FOUND
  #:DOC-ENCRYPTDICT-NOT-FOUND
  #:DOC-INVALID-OBJECT
  #:DUPLICATE-REGISTRATION
  #:EXCEED-JWW-CODE-NUM-LIMIT
  #:ENCRYPT-INVALID-PASSWORD
  #:ERR-UNKNOWN-CLASS
  #:EXCEED-GSTATE-LIMIT
  #:FAILED-TO-ALLOC-MEM
  #:FILE-IO-ERROR
  #:FILE-OPEN-ERROR
  #:FONT-EXISTS
  #:FONT-INVALID-WIDTH-TABLE
  #:INVALID-AFM-HEADER
  #:INVALID-ANNOTATION
  #:INVALID-BIT-PER-COMPONENT
  #:INVALID-CHAR-MATRIX-DATA
  #:INVALID-COLOR-SPACE
  #:INVALID-COMPRESSION-MODE
  #:INVALID-DATE-TIME
  #:INVALID-DESTINATION
  #:INVALID-DOCUMENT
  #:INVALID-DOCUMENT-STATE
  #:INVALID-ENCODER
  #:INVALID-ENCODER-TYPE
  #:INVALID-ENCODING-NAME
  #:INVALID-ENCRYPT-KEY-LEN
  #:INVALID-FONTDEF-DATA
  #:INVALID-FONTDEF-TYPE
  #:INVALID-FONT-NAME
  #:INVALID-IMAGE
  #:INVALID-JPEG-DATA
  #:INVALID-N-DATA
  #:INVALID-OBJECT
  #:INVALID-OBJ-ID
  #:INVALID-OPERATION
  #:INVALID-OUTLINE
  #:INVALID-PAGE
  #:INVALID-PAGES
  #:INVALID-PARAMETER
  #:INVALID-PNG-IMAGE
  #:INVALID-STREAM
  #:MISSING-FILE-NAME-ENTRY
  #:INVALID-TTC-FILE
  #:INVALID-TTC-INDEX
  #:INVALID-WX-DATA
  #:ITEM-NOT-FOUND
  #:LIBPNG-ERROR
  #:NAME-INVALID-VALUE
  #:NAME-OUT-OF-RANGE
  #:PAGES-MISSING-KIDS-ENTRY
  #:PAGE-CANNOT-FIND-OBJECT
  #:PAGE-CANNOT-GET-ROOT-PAGES
  #:PAGE-CANNOT-RESTORE-GSTATE
  #:PAGE-CANNOT-SET-PARENT
  #:PAGE-FONT-NOT-FOUND
  #:PAGE-INVALID-FONT
  #:PAGE-INVALID-FONT-SIZE
  #:PAGE-INVALID-GMODE
  #:PAGE-INVALID-INDEX
  #:PAGE-INVALID-ROTATE-VALUE
  #:PAGE-INVALID-SIZE
  #:PAGE-INVALID-XOBJECT
  #:PAGE-OUT-OF-RANGE
  #:REAL-OUT-OF-RANGE
  #:STREAM-EOF
  #:STREAM-READLN-CONTINUE
  #:STRING-OUT-OF-RANGE
  #:THIS-FUNC-WAS-SKIPPED
  #:TTF-CANNOT-EMBED-FONT
  #:TTF-INVALID-CMAP
  #:TTF-INVALID-FORMAT
  #:TTF-MISSING-TABLE
  #:UNSUPPORTED-FONT-TYPE
  #:UNSUPPORTED-JPEG-FORMAT
  #:UNSUPPORTED-TYPE1-FONT
  #:XREF-COUNT-ERR
  #:ZLIB-ERROR
  #:INVALID-PAGE-INDEX
  #:INVALID-URI
  #:PAGE-LAYOUT-OUT-OF-RANGE
  #:PAGE-MODE-OUT-OF-RANGE
  #:PAGE-NUM-STYLE-OUT-OF-RANGE
  #:ANNOT-INVALID-ICON
  #:ANNOT-INVALID-BORDER-STYLE
  #:PAGE-INVALID-DIRECTION
  #:PAGE-INSUFFICIENT-SPACE
  #:PAGE-INVALID-DISPLAY-TIME
  #:PAGE-INVALID-TRANSITION-TIME
  #:INVALID-PAGE-SLIDESHOW-TYPE
  #:EXT-GSTATE-OUT-OF-RANGE
  #:INVALID-EXT-GSTATE
  #:EXT-GSTATE-READ-ONLY
  #:INVALID-ICC-COMPONENT-NUM
  #:PAGE-INVALID-BOUNDARY
  #:INVALID-SHADING-TYPE

  ;; geometry_defines.lsp
  ;; LineCap
  #:BUTT-CAP
  #:ROUND-CAP
  #:PROJECTING-SQUARE-CAP

  ;; geometry_defines.lsp
  ;; LineJoin
  #:MITER-JOIN
  #:ROUND-JOIN
  #:BEVEL-JOIN

  ;; geometry_defines.lsp
  ;; ColorSpace
  #:COLORSPACE-DEVICEGRAY
  #:COLORSPACE-DEVICERGB
  #:COLORSPACE-DEVICECMYK
  #:COLORSPACE-CALGRAY
  #:COLORSPACE-CALRGB
  #:COLORSPACE-LAB
  #:COLORSPACE-ICCBASED
  #:COLORSPACE-SEPARATION
  #:COLORSPACE-DEVICEN
  #:COLORSPACE-INDEXED
  #:COLORSPACE-PATTERN

  ;; geometry_defines.lsp
  ;; BorderStyle
  #:BORDERSTYLE-SOLID
  #:BORDERSTYLE-DASHED
  #:BORDERSTYLE-BEVELED
  #:BORDERSTYLE-INSET
  #:BORDERSTYLE-UNDERLINED

  ;; geometry_defines.lsp
  ;; BlendMode
  #:BLENDMODE-NORMAL
  #:BLENDMODE-COMPATIBLE
  #:BLENDMODE-MULTIPLY
  #:BLENDMODE-SCREEN
  #:BLENDMODE-OVERLAY
  #:BLENDMODE-DARKEN
  #:BLENDMODE-LIGHTEN
  #:BLENDMODE-COLOR-DODGE
  #:BLENDMODE-COLOR-BURN
  #:BLENDMODE-HARD-LIGHT
  #:BLENDMODE-SOFT-LIGHT
  #:BLENDMODE-DIFFERENCE
  #:BLENDMODE-EXCLUSION

  ;; page.lsp
  ;; PageTransition
  #:PAGE-TRANSITION-WIPE-RIGHT
  #:PAGE-TRANSITION-WIPE-UP
  #:PAGE-TRANSITION-WIPE-LEFT
  #:PAGE-TRANSITION-WIPE-DOWN
  #:PAGE-TRANSITION-BARN-DOORS-HORIZONTAL-OUT
  #:PAGE-TRANSITION-BARN-DOORS-HORIZONTAL-IN
  #:PAGE-TRANSITION-BARN-DOORS-VERTICAL-OUT
  #:PAGE-TRANSITION-BARN-DOORS-VERTICAL-IN
  #:PAGE-TRANSITION-BOX-OUT
  #:PAGE-TRANSITION-BOX-IN
  #:PAGE-TRANSITION-BLINDS-HORIZONTAL
  #:PAGE-TRANSITION-BLINDS-VERTICAL
  #:PAGE-TRANSITION-DISSOLVE
  #:PAGE-TRANSITION-GLITTER-RIGHT
  #:PAGE-TRANSITION-GLITTER-DOWN
  #:PAGE-TRANSITION-GLITTER-TOP-LEFT-TO-BOTTOM-RIGHT
  #:PAGE-TRANSITION-REPLACE

  ;; page.lsp
  ;; PageOrientation
  #:PAGE-ORIENTATION-PORTRAIT
  #:PAGE-ORIENTATION-LANDSCAPE

  ;; page.lsp
  ;; PageMode
  #:PAGE-MODE-USE-NONE
  #:PAGE-MODE-USE-OUTLINE
  #:PAGE-MODE-USE-THUMBS
  #:PAGE-MODE-FULL-SCREEN
  #:PAGE-MODE-USE-OC
  #:PAGE-MODE-USE-ATTACHMENTS

  ;; page.lsp
  ;; PageNum
  #:PAGE-NUM-DECIMAL
  #:PAGE-NUM-UPPER-ROMAN
  #:PAGE-NUM-LOWER-ROMAN
  #:PAGE-NUM-UPPER-LETTERS
  #:PAGE-NUM-LOWER-LETTERS

  ;; page.lsp
  ;; PageLayout
  #:PAGE-LAYOUT-SINGLE
  #:PAGE-LAYOUT-ONE-COLUMN
  #:PAGE-LAYOUT-TWO-COLUMN-LEFT
  #:PAGE-LAYOUT-TWO-COLUMN-RIGHT
  #:PAGE-LAYOUT-TWO-PAGE-LEFT
  #:PAGE-LAYOUT-TWO-PAGE-RIGHT

  ;; page.lsp
  ;; PageBoundary
  #:PAGE-MEDIABOX
  #:PAGE-CROPBOX
  #:PAGE-BLEEDBOX
  #:PAGE-TRIMBOX
  #:PAGE-ARTBOX

  ;; text_defines.lsp
  ;; TextAlignment
  #:TEXT-ALIGN-LEFT
  #:TEXT-ALIGN-RIGHT
  #:TEXT-ALIGN-CENTER
  #:TEXT-ALIGN-JUSTIFY

  ;; text_defines.lsp
  ;; TextRenderingMode
  #:TEXT-RENDERING-MODE-FILL
  #:TEXT-RENDERING-MODE-STROKE
  #:TEXT-RENDERING-MODE-FILL-THEN-STROKE
  #:TEXT-RENDERING-MODE-INVISIBLE
  #:TEXT-RENDERING-MODE-FILL-CLIPPING
  #:TEXT-RENDERING-MODE-STROKE-CLIPPING
  #:TEXT-RENDERING-MODE-FILL-STROKE-CLIPPING
  #:TEXT-RENDERING-MODE-CLIPPING

  ;; text_defines.lsp
  ;; WritingMode
  #:WRITING-MODE-HORIZONTAL
  #:WRITING-MODE-VERTICAL

  ;; Page sizes
  ;; ==========
  #:PAGE-SIZE-4A0
  #:PAGE-SIZE-2A0
  #:PAGE-SIZE-A0
  #:PAGE-SIZE-A0-PLUS
  #:PAGE-SIZE-A1
  #:PAGE-SIZE-A1-PLUS
  #:PAGE-SIZE-A2
  #:PAGE-SIZE-A3
  #:PAGE-SIZE-A3-PLUS
  #:PAGE-SIZE-A4
  #:PAGE-SIZE-A5
  #:PAGE-SIZE-A6
  #:PAGE-SIZE-A7
  #:PAGE-SIZE-A8
  #:PAGE-SIZE-A9
  #:PAGE-SIZE-A10
  #:PAGE-SIZE-B0
  #:PAGE-SIZE-B0-PLUS
  #:PAGE-SIZE-B1
  #:PAGE-SIZE-B1-PLUS
  #:PAGE-SIZE-B2
  #:PAGE-SIZE-B2-PLUS
  #:PAGE-SIZE-B3
  #:PAGE-SIZE-B4
  #:PAGE-SIZE-B5
  #:PAGE-SIZE-B6
  #:PAGE-SIZE-B7
  #:PAGE-SIZE-B8
  #:PAGE-SIZE-B9
  #:PAGE-SIZE-B10
  #:PAGE-SIZE-B11
  #:PAGE-SIZE-B12
  #:PAGE-SIZE-B13
  #:PAGE-SIZE-C0
  #:PAGE-SIZE-C1
  #:PAGE-SIZE-C2
  #:PAGE-SIZE-C3
  #:PAGE-SIZE-C4
  #:PAGE-SIZE-C5
  #:PAGE-SIZE-C6
  #:PAGE-SIZE-C7
  #:PAGE-SIZE-C8
  #:PAGE-SIZE-C9
  #:PAGE-SIZE-C10

  ;; Macro
  ;; =====
  #:page-set-dash-pattern
  #:stream-set-dash-pattern
  #:with-page-gsave
  #:with-pdf-document
  #:with-stream-gsave
  #:with-ttf-font
  #:string-to-cstring
)
(:shadow :REAL :BYTE :Error :Array :PI))

