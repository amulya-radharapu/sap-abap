REPORT Z_ALV_SALES_ANALYTICS.

TYPE-POOLS: SLIS. "Provides data types required for classical ALV
TABLES: vbak.
* Using SELECT-OPTIONS to retrieve a range of records or exclude records.
SELECT-OPTIONS: s_vbeln FOR vbak-vbeln.

* START-OF-SELECTION event is triggered when the report execution begins.
START-OF-SELECTION.

* Selecting sales order details from VBAK using an inline-declared internal table.
  SELECT vbeln,
         erdat,
         auart,
         vkorg,
         vtweg,
         spart,
         kunnr
    FROM vbak
    INTO TABLE @DATA(it_vbak)
    WHERE vbeln IN @s_vbeln.

* Checking whether the SELECT statement retrieved any records.
  IF it_vbak IS INITIAL.
    WRITE: / 'No sales orders found.'.
  ELSE.
    PERFORM display_alv.
  ENDIF.

* Subroutine to prepare the field catalog and display ALV output.
FORM display_alv.

* Declaring the field catalog internal table and work area.
  DATA: it_fcat TYPE slis_t_fieldcat_alv,
        wa_fcat TYPE slis_fieldcat_alv.

  wa_fcat-fieldname = 'VBELN'.
  wa_fcat-col_pos = '1'.
  wa_fcat-seltext_m = 'Sales Order'.
  wa_fcat-emphasize = 'C510'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'ERDAT'.
  wa_fcat-seltext_m = 'Created Date'.
  wa_fcat-col_pos = '2'.
  wa_fcat-edit = 'X'.
  wa_fcat-emphasize = 'C410'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'AUART'.
  wa_fcat-col_pos = '3'.
  wa_fcat-seltext_m = 'Order Type'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'VKORG'.
  wa_fcat-col_pos = '5'.
  wa_fcat-seltext_m = 'Sales Organization'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.

  wa_fcat-fieldname = 'VTWEG'.
  wa_fcat-col_pos = '4'.
  wa_fcat-seltext_m = 'Distribution Channel'.
  APPEND wa_fcat TO it_fcat.
  CLEAR wa_fcat.


  wa_fcat-fieldname = 'KUNNR'.
  wa_fcat-col_pos = '6'.
  wa_fcat-seltext_m = 'Customer Number'.
  wa_fcat-hotspot = 'X'.
  APPEND wa_fcat TO it_fcat.

* Calling the classical ALV function module to display the output.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      it_fieldcat        = it_fcat
    TABLES
      t_outtab           = it_vbak
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.

* Checking whether the ALV function module executed successfully.
  IF sy-subrc <> 0.
    MESSAGE 'Error displaying ALV report' TYPE 'I'.
  ENDIF.

ENDFORM.