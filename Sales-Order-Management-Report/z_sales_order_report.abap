REPORT z_sales_order_report line-count 20(1).

TABLES vbak.
* Selection screen

SELECT-OPTIONS s_vbeln FOR vbak-vbeln.

* Structure for sales order and item data
TYPES: BEGIN OF ty_structure,
         vbeln  TYPE vbak-vbeln,
         erdat  TYPE vbak-erdat,
         auart  TYPE vbak-auart,
         posnr  TYPE vbap-posnr,
         matnr  TYPE vbap-matnr,
         kwmeng TYPE vbap-kwmeng,
         netpr  TYPE vbap-netpr,
       END OF ty_structure.
* Fetch sales order and item data
start-of-Selection.
SELECT a~vbeln, a~erdat, a~auart, b~posnr, b~matnr, b~kwmeng, b~netpr
   FROM vbak AS a
  INNER JOIN vbap AS b ON a~vbeln = b~vbeln INTO TABLE @DATA(it_table) WHERE a~vbeln in @s_vbeln.
end-of-selection.
IF it_table is not initial.
skip 1 .
write:/'Sales order',
       19 'Created on',
       31 'Order type',
       45 'Item No',
       53 'Material',
       75 'Quantity',
       91 'Net Price'.

  LOOP AT it_table INTO DATA(wa_table).

    WRITE:/ wa_table-vbeln,
           19 wa_table-erdat,
           31 wa_table-auart,
           45 wa_table-posnr,
           53 wa_table-matnr,
           63 wa_table-kwmeng,
           81 wa_table-netpr.

  ENDLOOP.
ELSE.
  MESSAGE 'The Entered Sales Document Number is Incorrect' TYPE 'I'.

ENDIF.
*header at the start of each page.
top-of-page.

write:/37'Sales Order Details'.
skip 1.

* Footer at the bottom of each list page
end-of-page.
write:/35'End of Sales Order Report'.
skip 1.