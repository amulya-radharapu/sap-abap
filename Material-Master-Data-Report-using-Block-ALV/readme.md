# Material Master Data Report using Block ALV

## Project Description

Developed an SAP ABAP report using Block ALV to retrieve and display material master information from three standard SAP database tables: MARA, MARD, and MAKT. The report allows users to filter records based on Material Number and displays the retrieved information in three separate ALV blocks on a single screen.

## Features

* Material Number selection using SELECT-OPTIONS.
* Retrieves material master data from MARA.
* Retrieves plant-level material data from MARD.
* Retrieves material descriptions from MAKT in English.
* Displays three separate ALV blocks on a single screen.
* Customizes column positions, headings, and output lengths using Field Catalogs.

## SAP Tables Used

 MARA -> General Material Data -> MATNR, ERSDA, MTART, MBRSH 
 MARD -> Storage Location Data -> MATNR, WERKS               
 MAKT -> Material Descriptions -> MATNR, MAKTX               

## ABAP Concepts Used

* Block ALV
* SELECT-OPTIONS
* Open SQL – SELECT Statements
* Internal Tables and Work Areas
* Field Catalog (SLIS_T_FIELDCAT_ALV)
* Column Positioning (COL_POS)
* Field Catalog Properties (FIELDNAME, SELTEXT_M, TABNAME, OUTPUTLEN)
* ALV Event Table (SLIS_T_EVENT)
* ALV Function Modules:
  * REUSE_ALV_BLOCK_LIST_INIT
  * REUSE_ALV_BLOCK_LIST_APPEND
  * REUSE_ALV_BLOCK_LIST_DISPLAY
* SY-REPID and SY-SUBRC

## ALV Processing Flow

1. Accept Material Numbers through the selection screen.
2. Retrieve corresponding records from MARA, MARD, and MAKT.
3. Prepare individual field catalogs for each database table.
4. Initialize Block ALV using REUSE_ALV_BLOCK_LIST_INIT.
5. Append MARA, MARD, and MAKT data as separate ALV blocks using REUSE_ALV_BLOCK_LIST_APPEND.
6. Display all three blocks together using REUSE_ALV_BLOCK_LIST_DISPLAY.

## Output

The report displays three separate ALV blocks on a single screen:

1. MARA Block: Displays general material information.
2. MARD Block: Displays material and plant information.
3. MAKT Block: Displays material numbers and their English descriptions.

## Development Environment

* SAP GUI
* SAP ABAP
* ABAP Dictionary (DDIC)
* Standard SAP Database Tables


## Program Output

### Selection Screen

![Selection Screen](screenshots/selection-screen.png)

### Block ALV Output

![Block ALV Output](screenshots/block-alv-output.png)
