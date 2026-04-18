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
  #:PageSize_Width
  #:Doc_Destroy_All
  #:Doc_Destroy
  #:Doc_Initialized
  #:Doc_Free
  #:Version
  #:PageSize_Height
  #:Doc_New_Empty
  #:Doc_New_Ex
  #:Doc_New
  #:Doc_MMgr
  #:Doc_Initialize

  ;; date.lsp
  #:Date_Free
  #:Date_Part
  #:Date_Validate
  #:Date_Now

  ;; destination.lsp
  #:Destination_SetFitH
  #:Destination_SetFitBH
  #:Destination_SetFitB
  #:Destination_SetFitR
  #:Destination_SetFitV
  #:Destination_SetFit
  #:Destination_SetFitBV
  #:Destination_SetXYZ

  ;; doc_compression.lsp
  #:Doc_SetCompressionMode

  ;; doc_embedded_file.lsp
  #:Doc_AttachFile

  ;; doc_encoder.lsp
  #:Doc_Encoder_SetCurrent
  #:Doc_Encoder_Current
  #:Doc_Encoder_Prepare

  ;; doc_encoding_utf.lsp
  #:Doc_UseUTFEncodings

  ;; doc_ext_gstate.lsp
  #:Doc_Create_ExtGState

  ;; doc_font.lsp
  #:Doc_Type1Font_LoadFromFile
  #:Doc_TTFont_LoadFromFile
  #:Doc_Font
  #:Doc_TTFont_LoadFromMemory
  #:Doc_TTFont_LoadFromFile2

  ;; doc_image_jpeg.lsp
  #:Doc_Image_Jpeg_LoadFromMemory
  #:Doc_Image_Jpeg_LoadFromFile

  ;; doc_image_png.lsp
  #:Doc_Image_Png_LoadFromFile2
  #:Doc_Image_Png_LoadFromFile
  #:Doc_Image_Png_LoadFromMemory

  ;; doc_image_tiff.lsp
  #:Doc_Image_Raw_LoadFromMemory
  #:Doc_Image_Raw_LoadFromFile
  #:Doc_Image_Raw1Bit_LoadFromMemory

  ;; doc_info.lsp
  #:Doc_SetInfoAttr
  #:Doc_SetInfoDateAttr

  ;; doc_matrix.lsp
  #:Doc_Matrix_Skew
  #:Doc_Matrix_Translate
  #:Doc_Matrix_RotateDeg
  #:Doc_Matrix_Identity
  #:Doc_Matrix_Scale
  #:Doc_Matrix_Multiply
  #:Doc_Matrix_Free
  #:Doc_Matrix_Rotate

  ;; doc_output_intent.lsp
  #:Doc_OutputIntent_Add
  #:Doc_OutputIntent_New

  ;; doc_page.lsp
  #:Doc_Page_AddLabel
  #:Doc_Page_Layout
  #:Doc_Page_Add
  #:Doc_Page_SetLayout
  #:Doc_Page_ByIndex
  #:Doc_Page_Current
  #:Doc_Page_Mode
  #:Doc_Page_Insert
  #:Doc_Page_SetMode
  #:Doc_Pages_SetConfiguration

  ;; doc_page_pattern.lsp
  #:Doc_Dict_RGBPatternFill_Select
  #:Doc_Page_RGBPatternFill_Select
  #:Doc_Pattern_Tiling_Create
  #:Doc_Pattern_Stream
  #:Doc_Dict_RGBPatternFillUint_Select
  #:Doc_Dict_RGBPatternFillHex_Select
  #:Doc_Page_RGBPatternFillHex_Select
  #:Doc_Page_RGBPatternFillUint_Select

  ;; doc_pdfa.lsp
  #:Doc_PDFA_SetConformance
  #:Doc_PDFA_AddXmpExtension
  #:Doc_PDFA_AppendOutputIntents

  ;; doc_save.lsp
  #:Doc_SaveToStream
  #:Doc_SaveToFile

  ;; doc_security.lsp
  #:Doc_SetPassword
  #:Doc_SetEncryptionMode
  #:Doc_SetPermission

  ;; doc_viewer.lsp
  #:Doc_ViewerPreference
  #:Doc_SetViewerPreference
  #:Doc_SetOpenAction

  ;; doc_xobject.lsp
  #:Doc_XObject_CreateAsWhiteRect
  #:Doc_XObject_CreateFromImage
  #:Doc_XObject_Create

  ;; error.lsp
  #:Doc_Error_SetHandler
  #:Doc_Error_DetailCode
  #:Doc_Error_Reset
  #:Doc_Error_Code
  #:Error_Check

  ;; ext_gstate.lsp
  #:ExtGState_SetBlendMode
  #:ExtGState_SetAlphaFill
  #:ExtGState_SetAlphaStroke

  ;; font.lsp
  #:Font_Descent
  #:Font_TextWidth2

  ;; geometry.lsp
  #:Page_Arc
  #:Page_SetRGBStrokeUint
  #:Page_CurveTo3
  #:Page_FillColorSpace
  #:Page_MoveTo
  #:Page_Ellipse
  #:Page_LineJoin
  #:Page_Concat
  #:Page_Eoclip
  #:Page_LineTo
  #:Page_SetLineCap
  #:Page_LineWidth
  #:Page_ClosePath
  #:Page_SetRGBFillUint
  #:Page_EofillStroke
  #:Page_GrayFill
  #:Page_SetDash
  #:Page_SetRGBStrokeHex
  #:Page_ClosePathEofillStroke
  #:Page_Skew
  #:Page_GRestore
  #:Page_CurveTo
  #:Page_Scale
  #:Page_FillStroke
  #:Page_LineCap
  #:Page_SetGrayStroke
  #:Page_Translate
  #:Page_SetLineJoin
  #:Page_GSave
  #:Page_EndPath
  #:Page_StrokeColorSpace
  #:Page_ClosePathStroke
  #:Page_Flat
  #:Page_Matrix
  #:Page_ClosePathFillStroke
  #:Page_CurveTo2
  #:Page_SetLineWidth
  #:Page_SetCMYKStroke
  #:Page_Rectangle
  #:Page_SetMiterLimit
  #:Page_SetCMYKFill
  #:Page_Stroke
  #:Page_SetFlat
  #:Page_Circle
  #:Page_SetRGBStroke
  #:Page_SetRGBFill
  #:Page_SetRGBFillHex
  #:Page_MiterLimit
  #:Page_Eofill
  #:Page_RotateDeg
  #:Page_Fill
  #:Page_Rotate
  #:Page_GrayStroke
  #:Page_Clip
  #:Page_SetGrayFill

  ;; page_routines.lsp
  #:Page_SetExtGState
  #:Page_MMgr
  #:Page_Width
  #:Page_SetRotate
  #:Page_HorizontalScaling
  #:Page_CreateDestination
  #:Page_RawWrite
  #:Page_SetSlideShow
  #:Page_SetBoundary
  #:Page_SetHorizontalScaling
  #:Page_GMode
  #:Page_Insert_Shared_Content_Stream
  #:Page_SetHeight
  #:Page_GStateDepth
  #:Page_Height
  #:Page_SetZoom
  #:Page_SetSize
  #:Page_SetWidth

  ;; page_xobject.lsp
  #:Dict_XObject_Execute
  #:Page_XObject_Execute

  ;; stream_geometry.lsp
  #:Stream_FillStroke
  #:Stream_SetGrayFill
  #:Stream_Rectangle
  #:Stream_GSave
  #:Stream_SetCMYKFill
  #:Stream_SetRGBFillUint
  #:Stream_Rotate
  #:Stream_EofillStroke
  #:Stream_CurveTo
  #:Stream_Concat
  #:Stream_Fill
  #:Stream_ClosePathFillStroke
  #:Stream_SetRGBFill
  #:Stream_SetCMYKStroke
  #:Stream_ClosePath
  #:Stream_SetGrayStroke
  #:Stream_CurveTo2
  #:Stream_SetDash
  #:Stream_RotateDeg
  #:Stream_CurveTo3
  #:Stream_SetLineCap
  #:Stream_SetFlat
  #:Stream_Eoclip
  #:Stream_Circle
  #:Stream_SetRGBStrokeUint
  #:Stream_Scale
  #:Stream_GRestore
  #:Stream_LineTo
  #:Stream_MoveTo
  #:Stream_ClosePathEofillStroke
  #:Stream_SetLineWidth
  #:Stream_Eofill
  #:Stream_SetRGBStrokeHex
  #:Stream_SetLineJoin
  #:Stream_Translate
  #:Stream_ClosePathStroke
  #:Stream_SetRGBFillHex
  #:Stream_SetMiterLimit
  #:Stream_Stroke
  #:Stream_Skew
  #:Stream_EndPath
  #:Stream_SetRGBStroke
  #:Stream_Clip

  ;; stream_text.lsp
  #:Stream_SetTextMatrix
  #:Stream_TextOut
  #:Stream_MoveTextPos2
  #:Stream_SetTextRenderingMode
  #:Stream_BeginText
  #:Stream_ShowText
  #:Stream_MoveToNextLine
  #:Stream_SetTextLeading
  #:Stream_EndText
  #:Stream_MoveTextPos

  ;; text.lsp
  #:Page_TextOut
  #:Page_TextWidth
  #:Page_ShowText
  #:Page_WordSpace
  #:Page_SetTextRise
  #:Page_SetFontAndSize
  #:Page_MeasureText
  #:Page_MoveTextPos2
  #:Page_CharSpace
  #:Page_TextMatrix
  #:Page_CurrentFontSize
  #:Page_SetCharSpace
  #:Page_EndText
  #:Page_TextLeading
  #:Page_MoveToNextLine
  #:Page_ShowTextNextLineEx
  #:Page_SetTextLeading
  #:Page_TextRect
  #:Page_TextRenderingMode
  #:Page_CurrentFont
  #:Dict_SetFontAndSize
  #:Page_MoveTextPos
  #:Page_CurrentTextPos2
  #:Page_SetTextMatrix
  #:Page_ShowTextNextLine
  #:Page_SetWordSpace
  #:Page_TextRise
  #:Page_BeginText
  #:Page_SetTextRenderingMode

  ;; unicode_glyph.lsp
  #:GlyphNameToUnicode
  #:UnicodeToGlyphName

  ;; xobject.lsp
  #:XObject_Stream

  ;; Enums
  ;; =====

  ;; annotation.lsp
  ;; AnnotLineEnd
  #:ANNOT_LINE_END_NONE
  #:ANNOT_LINE_END_SQUARE
  #:ANNOT_LINE_END_CIRCLE
  #:ANNOT_LINE_END_DIAMOND
  #:ANNOT_LINE_END_OPENARROW
  #:ANNOT_LINE_END_CLOSEDARROW
  #:ANNOT_LINE_END_BUTT
  #:ANNOT_LINE_END_ROPENARROW
  #:ANNOT_LINE_END_RCLOSEDARROW
  #:ANNOT_LINE_END_SLASH

  ;; annotation.lsp
  ;; AnnotStampStyle
  #:ANNOT_STAMP_APPROVED
  #:ANNOT_STAMP_EXPERIMENTAL
  #:ANNOT_STAMP_NOTAPPROVED
  #:ANNOT_STAMP_ASIS
  #:ANNOT_STAMP_EXPIRED
  #:ANNOT_STAMP_NOTFORPUBLICRELEASE
  #:ANNOT_STAMP_CONFIDENTIAL
  #:ANNOT_STAMP_FINAL
  #:ANNOT_STAMP_SOLD
  #:ANNOT_STAMP_DEPARTMENTAL
  #:ANNOT_STAMP_FORCOMMENT
  #:ANNOT_STAMP_TOPSECRET
  #:ANNOT_STAMP_DRAFT
  #:ANNOT_STAMP_FORPUBLICRELEASE

  ;; annotation.lsp
  ;; AnnotIcon
  #:ANNOT_ICON_COMMENT
  #:ANNOT_ICON_KEY
  #:ANNOT_ICON_NOTE
  #:ANNOT_ICON_HELP
  #:ANNOT_ICON_NEW_PARAGRAPH
  #:ANNOT_ICON_PARAGRAPH
  #:ANNOT_ICON_INSERT

  ;; annotation.lsp
  ;; AnnotLineCapPosition
  #:ANNOT_LINE_CAP_INLINE
  #:ANNOT_LINE_CAP_TOP

  ;; annotation.lsp
  ;; AnnotType
  #:ANNOT_TEXT
  #:ANNOT_LINK
  #:ANNOT_FREE_TEXT
  #:ANNOT_LINE
  #:ANNOT_SQUARE
  #:ANNOT_CIRCLE
  #:ANNOT_POLYGON
  #:ANNOT_POLYLINE
  #:ANNOT_HIGHLIGHT
  #:ANNOT_UNDERLINE
  #:ANNOT_SQUIGGLY
  #:ANNOT_STRIKEOUT
  #:ANNOT_STAMP
  #:ANNOT_CARET
  #:ANNOT_INK
  #:ANNOT_POPUP
  #:ANNOT_FILE_ATTACHMENT
  #:ANNOT_SOUND
  #:ANNOT_MOVIE
  #:ANNOT_WIDGET
  #:ANNOT_SCREEN
  #:ANNOT_PRINTER_MARK
  #:ANNOT_TRAPNET
  #:ANNOT_WATERMARK
  #:ANNOT_3D
  #:ANNOT_REDACT

  ;; annotation.lsp
  ;; AnnotHighlightMode
  #:ANNOT_HIGHLIGHT_MODE_NONE
  #:ANNOT_HIGHLIGHT_MODE_INVERT
  #:ANNOT_HIGHLIGHT_MODE_OUTLINE
  #:ANNOT_HIGHLIGHT_MODE_PUSH

  ;; annotation.lsp
  ;; AnnotFlags
  #:ANNOT_FLAG_INVISIBLE
  #:ANNOT_FLAG_HIDDEN
  #:ANNOT_FLAG_PRINT
  #:ANNOT_FLAG_NOZOOM
  #:ANNOT_FLAG_NOROTATE
  #:ANNOT_FLAG_NOVIEW
  #:ANNOT_FLAG_READONLY
  #:ANNOT_FLAG_LOCKED
  #:ANNOT_FLAG_TOGGLE_NOVIEW
  #:ANNOT_FLAG_LOCKED_CONTENT

  ;; consts.lsp
  ;; CompressionMode
  #:COMP_MODE_NONE
  #:COMP_MODE_TEXT
  #:COMP_MODE_IMAGE
  #:COMP_MODE_METADATA
  #:COMP_MODE_ALL

  ;; consts.lsp
  ;; ViewerPreference
  #:HIDE_TOOLBAR
  #:HIDE_MENUBAR
  #:HIDE_WINDOW_UI
  #:FIT_WINDOW
  #:CENTER_WINDOW
  #:PRINT_SCALING_NONE
  #:DISPLAY_DOC_TITLE

  ;; consts.lsp
  ;; GMode
  #:GMODE_PAGE_DESCRIPTION
  #:GMODE_PATH_OBJECT
  #:GMODE_TEXT_OBJECT
  #:GMODE_CLIPPING_PATH
  #:GMODE_SHADING
  #:GMODE_INLINE_IMAGE
  #:GMODE_EXTERNAL_OBJECT

  ;; consts.lsp
  ;; Permission
  #:ENABLE_READ
  #:ENABLE_PRINT
  #:ENABLE_EDIT_ALL
  #:ENABLE_COPY
  #:ENABLE_EDIT

  ;; date.lsp
  ;; Date_Parts
  #:DATE_PART_YEAR
  #:DATE_PART_MONTH
  #:DATE_PART_DAY
  #:DATE_PART_HOUR
  #:DATE_PART_MINUTE
  #:DATE_PART_SECOND
  #:DATE_PART_HOUR_OFFSET
  #:DATE_PART_MINUTE_OFFSET
  #:DATE_PART_UT_RELATIONSHIP

  ;; date.lsp
  ;; UT_Relationship
  #:UT_RELATIONSHIP_NONE
  #:UT_RELATIONSHIP_PLUS
  #:UT_RELATIONSHIP_MINUS
  #:UT_RELATIONSHIP_ZERO

  ;; doc.lsp
  ;; PdfVer
  #:VER_10
  #:VER_11
  #:VER_12
  #:VER_13
  #:VER_14
  #:VER_15
  #:VER_16
  #:VER_17
  #:VER_20

  ;; doc_info.lsp
  ;; InfoType
  #:INFO_CREATION_DATE
  #:INFO_MOD_DATE
  #:INFO_AUTHOR
  #:INFO_CREATOR
  #:INFO_PRODUCER
  #:INFO_TITLE
  #:INFO_SUBJECT
  #:INFO_KEYWORDS
  #:INFO_TRAPPED
  #:INFO_GTS_PDFX

  ;; encrypt.lsp
  ;; EncryptMode
  #:ENCRYPT_R0
  #:ENCRYPT_R1
  #:ENCRYPT_R2
  #:ENCRYPT_R3
  #:ENCRYPT_R4

  ;; error.lsp
  ;; ErrorKind
  #:ARRAY_COUNT_ERR
  #:ARRAY_ITEM_NOT_FOUND
  #:ARRAY_ITEM_UNEXPECTED_TYPE
  #:BINARY_LENGTH_ERR
  #:CANNOT_GET_PALETTE
  #:DICT_COUNT_ERR
  #:DICT_ITEM_NOT_FOUND
  #:DICT_ITEM_UNEXPECTED_TYPE
  #:DICT_STREAM_LENGTH_NOT_FOUND
  #:DOC_ENCRYPTDICT_NOT_FOUND
  #:DOC_INVALID_OBJECT
  #:DUPLICATE_REGISTRATION
  #:EXCEED_JWW_CODE_NUM_LIMIT
  #:ENCRYPT_INVALID_PASSWORD
  #:ERR_UNKNOWN_CLASS
  #:EXCEED_GSTATE_LIMIT
  #:FAILED_TO_ALLOC_MEM
  #:FILE_IO_ERROR
  #:FILE_OPEN_ERROR
  #:FONT_EXISTS
  #:FONT_INVALID_WIDTH_TABLE
  #:INVALID_AFM_HEADER
  #:INVALID_ANNOTATION
  #:INVALID_BIT_PER_COMPONENT
  #:INVALID_CHAR_MATRIX_DATA
  #:INVALID_COLOR_SPACE
  #:INVALID_COMPRESSION_MODE
  #:INVALID_DATE_TIME
  #:INVALID_DESTINATION
  #:INVALID_DOCUMENT
  #:INVALID_DOCUMENT_STATE
  #:INVALID_ENCODER
  #:INVALID_ENCODER_TYPE
  #:INVALID_ENCODING_NAME
  #:INVALID_ENCRYPT_KEY_LEN
  #:INVALID_FONTDEF_DATA
  #:INVALID_FONTDEF_TYPE
  #:INVALID_FONT_NAME
  #:INVALID_IMAGE
  #:INVALID_JPEG_DATA
  #:INVALID_N_DATA
  #:INVALID_OBJECT
  #:INVALID_OBJ_ID
  #:INVALID_OPERATION
  #:INVALID_OUTLINE
  #:INVALID_PAGE
  #:INVALID_PAGES
  #:INVALID_PARAMETER
  #:INVALID_PNG_IMAGE
  #:INVALID_STREAM
  #:MISSING_FILE_NAME_ENTRY
  #:INVALID_TTC_FILE
  #:INVALID_TTC_INDEX
  #:INVALID_WX_DATA
  #:ITEM_NOT_FOUND
  #:LIBPNG_ERROR
  #:NAME_INVALID_VALUE
  #:NAME_OUT_OF_RANGE
  #:PAGES_MISSING_KIDS_ENTRY
  #:PAGE_CANNOT_FIND_OBJECT
  #:PAGE_CANNOT_GET_ROOT_PAGES
  #:PAGE_CANNOT_RESTORE_GSTATE
  #:PAGE_CANNOT_SET_PARENT
  #:PAGE_FONT_NOT_FOUND
  #:PAGE_INVALID_FONT
  #:PAGE_INVALID_FONT_SIZE
  #:PAGE_INVALID_GMODE
  #:PAGE_INVALID_INDEX
  #:PAGE_INVALID_ROTATE_VALUE
  #:PAGE_INVALID_SIZE
  #:PAGE_INVALID_XOBJECT
  #:PAGE_OUT_OF_RANGE
  #:REAL_OUT_OF_RANGE
  #:STREAM_EOF
  #:STREAM_READLN_CONTINUE
  #:STRING_OUT_OF_RANGE
  #:THIS_FUNC_WAS_SKIPPED
  #:TTF_CANNOT_EMBED_FONT
  #:TTF_INVALID_CMAP
  #:TTF_INVALID_FORMAT
  #:TTF_MISSING_TABLE
  #:UNSUPPORTED_FONT_TYPE
  #:UNSUPPORTED_JPEG_FORMAT
  #:UNSUPPORTED_TYPE1_FONT
  #:XREF_COUNT_ERR
  #:ZLIB_ERROR
  #:INVALID_PAGE_INDEX
  #:INVALID_URI
  #:PAGE_LAYOUT_OUT_OF_RANGE
  #:PAGE_MODE_OUT_OF_RANGE
  #:PAGE_NUM_STYLE_OUT_OF_RANGE
  #:ANNOT_INVALID_ICON
  #:ANNOT_INVALID_BORDER_STYLE
  #:PAGE_INVALID_DIRECTION
  #:PAGE_INSUFFICIENT_SPACE
  #:PAGE_INVALID_DISPLAY_TIME
  #:PAGE_INVALID_TRANSITION_TIME
  #:INVALID_PAGE_SLIDESHOW_TYPE
  #:EXT_GSTATE_OUT_OF_RANGE
  #:INVALID_EXT_GSTATE
  #:EXT_GSTATE_READ_ONLY
  #:INVALID_ICC_COMPONENT_NUM
  #:PAGE_INVALID_BOUNDARY
  #:INVALID_SHADING_TYPE

  ;; geometry_defines.lsp
  ;; LineCap
  #:BUTT_CAP
  #:ROUND_CAP
  #:PROJECTING_SQUARE_CAP

  ;; geometry_defines.lsp
  ;; LineJoin
  #:MITER_JOIN
  #:ROUND_JOIN
  #:BEVEL_JOIN

  ;; geometry_defines.lsp
  ;; ColorSpace
  #:COLORSPACE_DEVICEGRAY
  #:COLORSPACE_DEVICERGB
  #:COLORSPACE_DEVICECMYK
  #:COLORSPACE_CALGRAY
  #:COLORSPACE_CALRGB
  #:COLORSPACE_LAB
  #:COLORSPACE_ICCBASED
  #:COLORSPACE_SEPARATION
  #:COLORSPACE_DEVICEN
  #:COLORSPACE_INDEXED
  #:COLORSPACE_PATTERN

  ;; geometry_defines.lsp
  ;; BorderStyle
  #:BORDERSTYLE_SOLID
  #:BORDERSTYLE_DASHED
  #:BORDERSTYLE_BEVELED
  #:BORDERSTYLE_INSET
  #:BORDERSTYLE_UNDERLINED

  ;; geometry_defines.lsp
  ;; BlendMode
  #:BLENDMODE_NORMAL
  #:BLENDMODE_COMPATIBLE
  #:BLENDMODE_MULTIPLY
  #:BLENDMODE_SCREEN
  #:BLENDMODE_OVERLAY
  #:BLENDMODE_DARKEN
  #:BLENDMODE_LIGHTEN
  #:BLENDMODE_COLOR_DODGE
  #:BLENDMODE_COLOR_BURN
  #:BLENDMODE_HARD_LIGHT
  #:BLENDMODE_SOFT_LIGHT
  #:BLENDMODE_DIFFERENCE
  #:BLENDMODE_EXCLUSION

  ;; page.lsp
  ;; PageTransition
  #:PAGE_TRANSITION_WIPE_RIGHT
  #:PAGE_TRANSITION_WIPE_UP
  #:PAGE_TRANSITION_WIPE_LEFT
  #:PAGE_TRANSITION_WIPE_DOWN
  #:PAGE_TRANSITION_BARN_DOORS_HORIZONTAL_OUT
  #:PAGE_TRANSITION_BARN_DOORS_HORIZONTAL_IN
  #:PAGE_TRANSITION_BARN_DOORS_VERTICAL_OUT
  #:PAGE_TRANSITION_BARN_DOORS_VERTICAL_IN
  #:PAGE_TRANSITION_BOX_OUT
  #:PAGE_TRANSITION_BOX_IN
  #:PAGE_TRANSITION_BLINDS_HORIZONTAL
  #:PAGE_TRANSITION_BLINDS_VERTICAL
  #:PAGE_TRANSITION_DISSOLVE
  #:PAGE_TRANSITION_GLITTER_RIGHT
  #:PAGE_TRANSITION_GLITTER_DOWN
  #:PAGE_TRANSITION_GLITTER_TOP_LEFT_TO_BOTTOM_RIGHT
  #:PAGE_TRANSITION_REPLACE

  ;; page.lsp
  ;; PageOrientation
  #:PAGE_ORIENTATION_PORTRAIT
  #:PAGE_ORIENTATION_LANDSCAPE

  ;; page.lsp
  ;; PageMode
  #:PAGE_MODE_USE_NONE
  #:PAGE_MODE_USE_OUTLINE
  #:PAGE_MODE_USE_THUMBS
  #:PAGE_MODE_FULL_SCREEN
  #:PAGE_MODE_USE_OC
  #:PAGE_MODE_USE_ATTACHMENTS

  ;; page.lsp
  ;; PageNum
  #:PAGE_NUM_DECIMAL
  #:PAGE_NUM_UPPER_ROMAN
  #:PAGE_NUM_LOWER_ROMAN
  #:PAGE_NUM_UPPER_LETTERS
  #:PAGE_NUM_LOWER_LETTERS

  ;; page.lsp
  ;; PageLayout
  #:PAGE_LAYOUT_SINGLE
  #:PAGE_LAYOUT_ONE_COLUMN
  #:PAGE_LAYOUT_TWO_COLUMN_LEFT
  #:PAGE_LAYOUT_TWO_COLUMN_RIGHT
  #:PAGE_LAYOUT_TWO_PAGE_LEFT
  #:PAGE_LAYOUT_TWO_PAGE_RIGHT

  ;; page.lsp
  ;; PageBoundary
  #:PAGE_MEDIABOX
  #:PAGE_CROPBOX
  #:PAGE_BLEEDBOX
  #:PAGE_TRIMBOX
  #:PAGE_ARTBOX

  ;; text_defines.lsp
  ;; TextAlignment
  #:TEXT_ALIGN_LEFT
  #:TEXT_ALIGN_RIGHT
  #:TEXT_ALIGN_CENTER
  #:TEXT_ALIGN_JUSTIFY

  ;; text_defines.lsp
  ;; TextRenderingMode
  #:TEXT_RENDERING_MODE_FILL
  #:TEXT_RENDERING_MODE_STROKE
  #:TEXT_RENDERING_MODE_FILL_THEN_STROKE
  #:TEXT_RENDERING_MODE_INVISIBLE
  #:TEXT_RENDERING_MODE_FILL_CLIPPING
  #:TEXT_RENDERING_MODE_STROKE_CLIPPING
  #:TEXT_RENDERING_MODE_FILL_STROKE_CLIPPING
  #:TEXT_RENDERING_MODE_CLIPPING

  ;; text_defines.lsp
  ;; WritingMode
  #:WRITING_MODE_HORIZONTAL
  #:WRITING_MODE_VERTICAL

  ;; Page sizes
  ;; ==========
  #:PAGE-SIZE-4A0
  #:PAGE-SIZE-2A0
  #:PAGE-SIZE-A0
  #:PAGE-SIZE-A0_PLUS
  #:PAGE-SIZE-A1
  #:PAGE-SIZE-A1_PLUS
  #:PAGE-SIZE-A2
  #:PAGE-SIZE-A3
  #:PAGE-SIZE-A3_PLUS
  #:PAGE-SIZE-A4
  #:PAGE-SIZE-A5
  #:PAGE-SIZE-A6
  #:PAGE-SIZE-A7
  #:PAGE-SIZE-A8
  #:PAGE-SIZE-A9
  #:PAGE-SIZE-A10
  #:PAGE-SIZE-B0
  #:PAGE-SIZE-B0_PLUS
  #:PAGE-SIZE-B1
  #:PAGE-SIZE-B1_PLUS
  #:PAGE-SIZE-B2
  #:PAGE-SIZE-B2_PLUS
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

