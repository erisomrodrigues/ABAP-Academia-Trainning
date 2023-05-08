FUNCTION ZMF30_CALC_DIAS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(DATAI) TYPE  D
*"     REFERENCE(DATAF) TYPE  D
*"  EXPORTING
*"     REFERENCE(NDIAS) TYPE  I
*"  EXCEPTIONS
*"      EDATAI
*"      EDATAF
*"      EDATFM
*"----------------------------------------------------------------------
IF DATAI IS INITIAL.
    RAISE EDATAI.
ENDIF.

IF DATAF < DATAI.
  RAISE EDATFM.
ENDIF.

NDIAS = DATAF - DATAI.

ENDFUNCTION.

