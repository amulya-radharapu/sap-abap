REPORT Z_BAPI_BANK_MASTER_CREATE.

* Declaration of bank address structure
DATA WA_ADDRESS TYPE BAPI1011_ADDRESS.

* Assigning bank details to the address structure
WA_ADDRESS-BANK_NAME = 'SBI BANK'.
WA_ADDRESS-REGION = '36'.
WA_ADDRESS-CITY = 'Hyderabad'.
WA_ADDRESS-STREET = 'Ameerpet'.

* Declaration of BAPI return structure
DATA WA_RETURN TYPE BAPIRET2.

* BAPI to create a new bank master record
CALL FUNCTION 'BAPI_BANK_CREATE'
  EXPORTING
    BANK_CTRY    = 'IN'
    BANK_KEY     = 'SBI1003'
    BANK_ADDRESS = WA_ADDRESS
  IMPORTING
    RETURN       = WA_RETURN.

* Commit the transaction to save the bank master record
CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
* EXPORTING
*   WAIT          =
* IMPORTING
*   RETURN        =
  .

* Display the success or return message
IF WA_RETURN IS INITIAL.
  WRITE:/ 'Bank is successfully created'.

ELSE.
  WRITE:/ WA_RETURN-MESSAGE.
ENDIF.