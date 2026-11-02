REPORT Z_BLOCKED_ALV.

* TABLES declaration for referring to database table fields
TABLES: MARA, MARD, MAKT.

* Selection screen for entering material numbers
SELECT-OPTIONS S_MATNR FOR MARA-MATNR.

* Internal tables to store data retrieved from database tables
* Work areas to hold individual records
DATA: IT_MARA TYPE STANDARD TABLE OF MARA,
      IT_MARD TYPE STANDARD TABLE OF MARD,
      IT_MAKT TYPE STANDARD TABLE OF MAKT,
      WA_MARA TYPE MARA,
      WA_MARD TYPE MARD,
      WA_MAKT TYPE MAKT.

* Field catalogs for maintaining column properties of each ALV block
* Work areas are used to configure individual field catalog entries
DATA: IT_MARA_FCAT TYPE SLIS_T_FIELDCAT_ALV,
      IT_MARD_FCAT TYPE SLIS_T_FIELDCAT_ALV,
      IT_MAKT_FCAT TYPE SLIS_T_FIELDCAT_ALV,
      WA_MARA_FCaT LIKE LINE OF  IT_MARA_FCAT,
      WA_MARD_FCAT LIKE LINE OF IT_MARD_FCAT,
      WA_MAKT_FcaT LIKE LINE OF IT_MAKT_FCAT.

* Layout, event table and program name declaration
DATA: IT_LAYOUT TYPE SLIS_LAYOUT_ALV,
      it_events type slis_t_event,
      A_REPID   TYPE SY-REPID.

* Assigning the current program name dynamically
A_REPID = SY-REPID.

* Retrieving material master data from MARA
SELECT * FROM MARA INTO TABLE IT_MARA WHERE MATNR IN S_MATNR.

* Retrieving material storage location data from MARD
SELECT * FROM MARD INTO TABLE IT_MARD WHERE MATNR IN S_MATNR.

* Retrieving material description from MAKT
* SPRAS = 'E' restricts the records to English language
SELECT * FROM MAKT INTO TABLE IT_MAKT WHERE MATNR IN S_MATNR and spras = 'E'.

*-------------------- MARA FIELD CATALOG --------------------*

* Defining the first column - Material Number
WA_MARA_FCAT-COL_POS = '1'.
WA_MARA_FCAT-FIELDNAME = 'matnr'.
WA_MARA_FCAT-SELTEXT_M = 'Material number'.
WA_MARA_FCAT-TABNAME = 'mara'.
WA_MARA_FCAT-OUTPUTLEN = '20'.
APPEND WA_MARA_FCAT TO IT_MARA_FCAT.
CLEAR WA_MARA_FCAT.

* Defining the second column - Creation Date
WA_MARA_FCAT-COL_POS = '2'.
WA_MARA_FCAT-FIELDNAME = 'ersda'.
WA_MARA_FCAT-SELTEXT_M = 'Creation date'.
WA_MARA_FCAT-TABNAME = 'mara'.
WA_MARA_FCAT-OUTPUTLEN = '20'.
APPEND WA_MARA_FCAT TO IT_MARA_FCAT.
CLEAR WA_MARA_FCAT.

* Defining the third column - Material Type
WA_MARA_FCAT-COL_POS = '3'.
WA_MARA_FCAT-FIELDNAME = 'mtart'.
WA_MARA_FCAT-SELTEXT_M = 'Material type'.
WA_MARA_FCAT-TABNAME = 'mara'.
WA_MARA_FCAT-OUTPUTLEN = '20'.
APPEND WA_MARA_FCAT TO IT_MARA_FCAT.
CLEAR WA_MARA_FCAT.

* Defining the fourth column - Industry Sector
WA_MARA_FCAT-COL_POS = '4'.
WA_MARA_FCAT-FIELDNAME = 'mbrsh'.
WA_MARA_FCAT-SELTEXT_M = 'Industry sector'.
WA_MARA_FCAT-TABNAME = 'mara'.
WA_MARA_FCAT-OUTPUTLEN = '20'.
APPEND WA_MARA_FCAT TO IT_MARA_FCAT.
CLEAR WA_MARA_FCAT.

*-------------------- MARD FIELD CATALOG --------------------*

* Defining the first column - Material Number
WA_MARD_FCAT-COL_POS = '1'.
WA_MARD_FCAT-FIELDNAME = 'matnr'.
WA_MARD_FCAT-SELTEXT_M = 'Material number'.
WA_MARD_FCAT-TABNAME = 'mard'.
WA_MARD_FCAT-OUTPUTLEN = '20'.
APPEND WA_MARD_FCAT TO IT_MARD_FCAT.
CLEAR WA_MARD_FCAT.

* Defining the second column - Plant
WA_MARD_FCAT-COL_POS = '2'.
WA_MARD_FCAT-FIELDNAME = 'werks'.
WA_MARD_FCAT-SELTEXT_M = 'Plant'.
WA_MARD_FCAT-TABNAME = 'mard'.
WA_MARD_FCAT-OUTPUTLEN = '20'.
APPEND WA_MARD_FCAT TO IT_MARD_FCAT.
CLEAR WA_MARD_FCAT.

*-------------------- MAKT FIELD CATALOG --------------------*

* Defining the first column - Material Number
WA_MAKT_FCAT-COL_POS = '1'.
WA_MAKT_FCAT-FIELDNAME = 'matnr'.
WA_MAKT_FCAT-SELTEXT_M = 'Material number'.
WA_MAKT_FCAT-TABNAME = 'makt'.
WA_MAKT_FCAT-OUTPUTLEN = '20'.
APPEND WA_MAkt_FCAT TO IT_MAKT_FCAT.
CLEAR WA_MAKT_FCAT.

* Defining the second column - Material Description
WA_MAKT_FCAT-COL_POS = '2'.
WA_MAKT_FCAT-FIELDNAME = 'maktx'.
WA_MAKT_FCAT-SELTEXT_M = 'Material Description'.
WA_MAKT_FCAT-TABNAME = 'makt'.
WA_MAKT_FCAT-OUTPUTLEN = '25'.
APPEND WA_MAkt_FCAT TO IT_MAKT_FCAT.
CLEAR WA_MAKT_FCAT.

*-------------------- BLOCK ALV INITIALIZATION --------------------*

* Initializes the Block ALV display
* A_REPID identifies the current ABAP program
CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_INIT'
  EXPORTING
    I_CALLBACK_PROGRAM = A_REPID
*   I_CALLBACK_PF_STATUS_SET       = ' '
*   I_CALLBACK_USER_COMMAND        = ' '
*   IT_EXCLUDING       =
  .

*-------------------- APPENDING MARA BLOCK --------------------*

* Adds the MARA internal table as the first ALV block
* IT_FIELDCAT contains the column definitions for MARA
* IT_EVENTS passes the event information
CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_APPEND'
  EXPORTING
    IS_LAYOUT                        = it_layout
    IT_FIELDCAT                      = it_mara_fcat
    I_TABNAME                        = 'mara'
     IT_EVENTS   = IT_EVENTS
  TABLES
    T_OUTTAB                         = it_mara.

*-------------------- APPENDING MARD BLOCK --------------------*

* Adds the MARD internal table as the second ALV block
CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_APPEND'
  EXPORTING
    IS_LAYOUT                        = it_layout
    IT_FIELDCAT                      = it_mard_fcat
    I_TABNAME                        = 'mard'
     IT_EVENTS   = IT_EVENTS
  TABLES
    T_OUTTAB                         = it_mard.

*-------------------- APPENDING MAKT BLOCK --------------------*

* Adds the MAKT internal table as the third ALV block
CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_APPEND'
  EXPORTING
    IS_LAYOUT                        = it_layout
    IT_FIELDCAT                      = it_makt_fcat
    I_TABNAME                        = 'makt'
     IT_EVENTS   = IT_EVENTS
  TABLES
    T_OUTTAB                         = it_makt.

*-------------------- DISPLAYING ALL ALV BLOCKS --------------------*

* Displays all appended ALV blocks together on one screen
CALL FUNCTION 'REUSE_ALV_BLOCK_LIST_DISPLAY'
* EXPORTING
*   I_INTERFACE_CHECK             = ' '
*   IS_PRINT                      =
*   I_SCREEN_START_COLUMN         = 0
*   I_SCREEN_START_LINE           = 0
*   I_SCREEN_END_COLUMN           = 0
*   I_SCREEN_END_LINE             = 0
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER       =
*   ES_EXIT_CAUSED_BY_USER        =
* EXCEPTIONS
*   PROGRAM_ERROR                 = 1
*   OTHERS                        = 2
          .

* Checking whether the function module executed successfully
IF SY-SUBRC <> 0.
Message 'Entered Material Number in Invalid' type 'E'.
ENDIF.