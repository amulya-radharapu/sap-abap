# BAPI-Based Bank Master Creation and Customer and Vendor Account Data Retrieval

## Project Overview

This project demonstrates the implementation of standard SAP Business Application Programming Interfaces (BAPIs) in ABAP for bank master record creation and financial account data retrieval.

The project consists of three independent ABAP programs that demonstrate how BAPIs can be used to perform business operations in SAP. It covers bank master data creation, vendor open-item retrieval and customer cleared-item retrieval.

The retrieved financial data is displayed using the ALV Grid Display function module, providing a structured and user-friendly output.

## Project Objectives

- Understand the practical implementation of standard SAP BAPIs.
- Create bank master records using a standard BAPI.
- Retrieve vendor open-item details for a specified key date.
- Retrieve customer cleared-item details for a specified date range.
- Understand how BAPIs communicate with ABAP programs through parameters and return structures.
- Display retrieved data using ALV Grid Display.
- Understand transaction handling using BAPI transaction commit.

## Project Structure

This project contains three separate ABAP programs:

| Program Name | Description |
|---|---|
| `Z_BAPI_BANK_MASTER_CREATE` | Creates a bank master record using a standard BAPI. |
| `Z_BAPI_VENDOR_OPEN_ITEMS` | Retrieves vendor open-item details for a specified key date. |
| `Z_BAPI_CUSTOMER_CLEARED_ITEMS` | Retrieves customer cleared-item details for a specified date range. |

## 1. Bank Master Creation

**Program Name:** `Z_BAPI_BANK_MASTER_CREATE`

### Overview

This program demonstrates how to create a bank master record in SAP using the standard function module `BAPI_BANK_CREATE`.

It accepts bank details such as bank country, bank key, bank name, region, city and street. These details are passed to the BAPI through the bank address structure.

After executing the BAPI, the program uses `BAPI_TRANSACTION_COMMIT` to save the transaction.

### BAPI Function Modules Used

| Function Module | Purpose |
|---|---|
| `BAPI_BANK_CREATE` | Creates a new bank master record. |
| `BAPI_TRANSACTION_COMMIT` | Commits the transaction and saves the changes. |

### Bank Details Used

| Field | Value |
|---|---|
| Bank Country | IN |
| Bank Key | SBI1003 |
| Bank Name | SBI BANK |
| Region | 36 |
| City | Hyderabad |
| Street | Ameerpet |

### Working Process

1. Declare the bank address structure using `BAPI1011_ADDRESS`.
2. Assign the required bank details to the structure.
3. Declare the return structure using `BAPIRET2`.
4. Execute `BAPI_BANK_CREATE` by passing the bank country, bank key and address details.
5. Receive the execution message through the return structure.
6. Execute `BAPI_TRANSACTION_COMMIT` to save the created bank record.
7. Display the success or return message.

## 2. Vendor Open Item Retrieval

**Program Name:** `Z_BAPI_VENDOR_OPEN_ITEMS`

### Overview

This program retrieves vendor open-item details from SAP using the standard BAPI `BAPI_AP_ACC_GETOPENITEMS`.

It accepts company code, vendor number and key date as selection-screen inputs. Based on these inputs, the BAPI retrieves the vendor's open-item details.

The retrieved records are stored in an internal table and displayed using `REUSE_ALV_GRID_DISPLAY`.

### BAPI Function Module Used

| Function Module | Purpose |
|---|---|
| `BAPI_AP_ACC_GETOPENITEMS` | Retrieves vendor open-item details for the specified company code, vendor and key date. |

### Input Parameters

| Parameter | Description |
|---|---|
| `P_CCODE` | Company Code |
| `P_VEN` | Vendor Number |
| `P_KDATE` | Key Date |

### Working Process

1. Define selection-screen parameters for company code, vendor number and key date.
2. Declare the return structure using `BAPIRETURN`.
3. Declare an internal table of type `BAPI3008_2` to store the retrieved vendor line items.
4. Execute `BAPI_AP_ACC_GETOPENITEMS` by passing the required input parameters.
5. Receive the execution message through the return structure.
6. Store the retrieved vendor open-item records in the internal table.
7. Display the retrieved records using `REUSE_ALV_GRID_DISPLAY`.

## 3. Customer Cleared Item Retrieval

**Program Name:** `Z_BAPI_CUSTOMER_CLEARED_ITEMS`

### Overview

This program retrieves customer cleared-item details from SAP using the standard BAPI `BAPI_AR_ACC_GETBALANCEDITEMS`.

It accepts company code, customer number, start date and end date as selection-screen inputs.

Based on the specified inputs, the BAPI retrieves the customer's cleared-item details within the given date range.

The retrieved records are stored in an internal table and displayed using ALV Grid Display.

### BAPI Function Module Used

| Function Module | Purpose |
|---|---|
| `BAPI_AR_ACC_GETBALANCEDITEMS` | Retrieves customer cleared-item details for the specified company code, customer and date range. |

### Input Parameters

| Parameter | Description |
|---|---|
| `P_CCODE` | Company Code |
| `P_CUS` | Customer Number |
| `P_DFROM` | Starting Date |
| `P_DTO` | Ending Date |

### Working Process

1. Define selection-screen parameters for company code, customer number and date range.
2. Declare the return structure using `BAPIRETURN`.
3. Declare an internal table of type `BAPI3007_2` to store the retrieved customer line items.
4. Execute `BAPI_AR_ACC_GETBALANCEDITEMS` by passing the required input parameters.
5. Receive the execution message through the return structure.
6. Store the retrieved customer cleared-item records in the internal table.
7. Display the retrieved records using `REUSE_ALV_GRID_DISPLAY`.

## ABAP Concepts Covered

| Concept | Description |
|---|---|
| BAPI | Standard SAP interfaces used to perform business operations and access SAP business data. |
| Function Modules | Reusable ABAP processing units used to execute specific operations. |
| DATA Declarations | Used to declare variables, structures and internal tables. |
| PARAMETERS | Used to accept input values through the selection screen. |
| Structures | Used to group related fields into a single data object. |
| Internal Tables | Used to store multiple records retrieved from BAPIs. |
| Importing Parameters | Used to pass input values to function modules. |
| Exporting Parameters | Used to receive output values from function modules. |
| Tables Parameters | Used to pass or receive internal tables through function modules. |
| Return Structures | Used to receive messages and status information from BAPIs. |
| BAPI_TRANSACTION_COMMIT | Used to commit and save changes performed through BAPIs. |
| Conditional Statements | Used to control program execution based on return information. |
| ALV Grid Display | Used to display retrieved records in a structured tabular format. |
| `REUSE_ALV_GRID_DISPLAY` | Standard function module used for classical ALV Grid output. |

## Technical Environment

- **ERP System:** SAP ECC
- **Programming Language:** ABAP
- **Development Environment:** SAP GUI
- **ABAP Editor:** SE38
- **Output Display:** ALV Grid
- **Interface Technology:** Standard SAP BAPIs

## Key Learning Outcomes

Through this project, I gained practical experience in:

- Understanding and implementing standard SAP BAPIs.
- Creating bank master records using BAPI function modules.
- Retrieving vendor and customer financial line-item information.
- Working with BAPI input and output parameters.
- Handling BAPI return structures.
- Understanding transaction management using BAPI transaction commit.
- Working with structures and internal tables.
- Displaying business data using ALV Grid.

## Conclusion

This project provides practical exposure to standard SAP BAPIs and their application in business data processing. It demonstrates how ABAP programs can interact with SAP business functionality to create master data and retrieve financial information.

The three programs cover different BAPI operations and help build a foundation for working with standard SAP interfaces in real-world ABAP development.