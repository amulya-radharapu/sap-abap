REPORT Z_INVENTORY.

* Variable declaration for material number selection
DATA V TYPE I.

SELECT-OPTIONS S_MATNR FOR V.

* Parameter for entering Plant
PARAMETERS P_WERKS TYPE MARD-WERKS.

* Defining a custom structure for material and stock details
TYPES: BEGIN OF TY_MARA,
         MATNR TYPE MARA-MATNR,
         MTART TYPE MARA-MTART,
         WERKS TYPE MARD-WERKS,
         LGORT TYPE MARD-LGORT,
         LABST TYPE MARD-LABST,
       END OF TY_MARA.

* Internal table and work area declarations
DATA IT_MARA TYPE TABLE OF TY_MARA.
DATA WA_MARA TYPE TY_MARA.

* Retrieving material and stock details using INNER JOIN
* MARA contains general material data and MARD contains storage data
SELECT  A~MATNR
        A~MTART
        B~WERKS
        B~LGORT
        B~LABST  FROM MARA AS A
        INNER JOIN MARD AS B
  ON A~MATNR = B~MATNR
  INTO TABLE IT_MARA where b~werks = p_werks and a~matnr in s_matnr .

* Checking whether records were retrieved successfully
IF SY-SUBRC = 0.

* Displaying column headings
  WRITE: /'material',
          11 'material_type',
          27 'plant',
          35 'storage_location',
           63'stock'.
  ULINE.

* Looping through the internal table to display records
  LOOP AT IT_MARA INTO WA_MARA.
    WRITE:/ WA_MARA-MATNR,
           11 WA_MARA-MTART,
           27 WA_MARA-WERKS,
           35 WA_MARA-LGORT,
           53 WA_MARA-LABST.

  ENDLOOP.

* Displaying an error message when no records are retrieved
ELSE.
  MESSAGE E000(ZMESSAGE).

ENDIF.

