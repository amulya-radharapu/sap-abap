REPORT Z_BAPI_CUSTOMER_CLEARED_ITEMS.

* Selection screen to enter company code, customer and date range
PARAMETERS: P_CCODE LIKE BAPI3007_1-COMP_CODE,
            P_CUS   LIKE BAPI3007_1-CUSTOMER,
            P_DFROM LIKE BAPI3007-FROM_DATE,
            P_DTO   LIKE BAPI3007-TO_DATE.

* Declaration of return structure and internal table
DATA: WA_RETURN LIKE BAPIRETURN,
      IT_CCI    TYPE TABLE OF BAPI3007_2.

* BAPI to retrieve customer cleared items for the specified date range
CALL FUNCTION 'BAPI_AR_ACC_GETBALANCEDITEMS'
  EXPORTING
    COMPANYCODE = P_CCODE
    CUSTOMER    = P_CUS
    DATE_FROM   = P_DFROM
    DATE_TO     = P_DTO
  IMPORTING
    RETURN      = WA_RETURN
  TABLES
    LINEITEMS   = IT_CCI.

* Display the return message or retrieved customer items in ALV
IF WA_RETURN IS NOT INITIAL.
  WRITE:/ WA_RETURN-MESSAGE.
ELSE.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      I_STRUCTURE_NAME = 'bapi3007_2'
    TABLES
      T_OUTTAB         = IT_CCI.
ENDIF.