REPORT z_po_tracking_report.
TABLES: ekko.

SELECT-OPTIONS:
  s_ebeln FOR ekko-ebeln,
  s_bedat FOR ekko-bedat.

TYPES: BEGIN OF ty_po,
         ebeln TYPE ekko-ebeln,
         bedat TYPE ekko-bedat,
         lifnr TYPE ekko-lifnr,
         name1 TYPE lfa1-name1,
         menge TYPE ekpo-menge,
         meins TYPE ekpo-meins,
         netpr TYPE ekpo-netpr,
       END OF ty_po.

DATA: it_po TYPE TABLE OF ty_po,
      wa_po TYPE ty_po.

START-OF-SELECTION.

  SELECT A~ebeln,
         A~bedat,
         A~lifnr,
         B~name1,
         C~menge,
         C~meins,
         C~netpr
    FROM ekko AS A
    INNER JOIN ekpo AS C
      ON A~ebeln = C~ebeln
    LEFT OUTER JOIN lfa1 AS B
      ON A~lifnr = B~lifnr
    WHERE A~ebeln IN @s_ebeln
      AND A~bedat IN @s_bedat
    INTO CORRESPONDING FIELDS OF TABLE @it_po.

  IF it_po IS INITIAL.
    WRITE: / 'No purchase orders found.'.
  ELSE.

    WRITE: / 'PURCHASE ORDER TRACKING REPORT'.
    ULINE.
    WRITE:/ 'PO Number',
       15 'Doc. Date',
       28 'Vendor No.',
       42 'Vendor Name',
       68 'Quantity',
       78 'Unit',
       88 'Net Price'.

ULINE.

    LOOP AT it_po INTO wa_po.

     WRITE:/ wa_po-ebeln,
          15 wa_po-bedat,
          28 wa_po-lifnr,
          42 wa_po-name1,
          68 wa_po-menge,
          78 wa_po-meins,
          88 wa_po-netpr.

    ENDLOOP.

  ENDIF.