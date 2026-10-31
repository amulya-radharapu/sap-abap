# Purchase Order Interactive Drill-Down Report

## Project Overview

Developed an interactive classical report in SAP ABAP to display Purchase Order details and navigate through related item, material master, and plant-specific information using multiple secondary lists.

The report uses the HIDE statement and AT LINE-SELECTION event to provide drill-down navigation across four SAP standard database tables.

## SAP Tables Used

 EKKO   Purchasing Document Header 
 EKPO   Purchasing Document Item   
 MARA   General Material Data      
 MARC   Plant Data for Material    

## Report Navigation

1. Primary List – EKKO: Displays Purchase Order header details such as Purchase Order Number, Company Code, Created By, Document Date, and Document Type.

2. Secondary List 1 – EKPO: Displays Purchase Order item details, including Purchase Order Number, Item Number, and Material Number.

3. Secondary List 2 – MARA: Displays material master details such as Material Number, Material Type, Industry Sector, and Material Group.

4. Secondary List 3 – MARC: Displays plant-specific material details, including Material Number and Plant.

## ABAP Concepts Used

* Classical Reports
* Interactive Reports
* Selection Screens – SELECT-OPTIONS
* TYPES and Structures
* Internal Tables and Work Areas
* Open SQL – SELECT
* SORT Statement
* LOOP AT
* IF Conditions
* HIDE Statement
* AT LINE-SELECTION
* SY-LSIND
* CASE Statement
* TOP-OF-PAGE
* END-OF-PAGE
* TOP-OF-PAGE DURING LINE-SELECTION
* END-OF-PAGE DURING LINE-SELECTION

## Key Learning Outcomes

* Understanding interactive classical reporting in SAP ABAP.
* Implementing multi-level drill-down navigation.
* Passing selected values between list levels using the HIDE statement.
* Understanding primary and secondary list processing.
* Working with related SAP standard database tables.

## Development Environment

* Technology: SAP ABAP
* Platform: SAP GUI
* Report Type: Interactive Classical Report
* Database Tables: EKKO, EKPO, MARA, MARC


Project Category: SAP ABAP – Interactive Reporting
