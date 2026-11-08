
REPORT Z_BAPI_VENDOR_OPEN_ITEMS.

* Selection screen to enter company code, vendor and key date
PARAMETERS: P_CCODE LIKE BAPI3008_1-COMP_CODE,
            P_VEN   LIKE BAPI3008_1-VENDOR,
            P_KDATE LIKE BAPI3008-KEY_DATE.

* Declaration of return structure and internal table
DATA: WA_RETURN LIKE BAPIRETURN,
      IT_VOI    TYPE TABLE OF BAPI3008_2.

* BAPI to retrieve vendor open items for the specified key date
CALL FUNCTION 'BAPI_AP_ACC_GETOPENITEMS'
  EXPORTING
    COMPANYCODE = P_CCODE
    VENDOR      = P_VEN
    KEYDATE     = P_KDATE
  IMPORTING
    RETURN      = WA_RETURN
  TABLES
    LINEITEMS   = IT_VOI.

* Display the return message or retrieved vendor items in ALV
IF WA_RETURN IS NOT INITIAL.
  WRITE:/ WA_RETURN-MESSAGE.
ELSE.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      I_STRUCTURE_NAME = 'bapi3008_2'
    TABLES
      T_OUTTAB         = IT_VOI.
ENDIF.