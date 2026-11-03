# Purchase Order Hierarchical ALV Report

## Project Overview

An SAP ABAP program that retrieves and displays purchase order header and item details using Hierarchical Sequential ALV.

## What is Hierarchical Sequential ALV?

Hierarchical Sequential ALV is a reporting technique used to display related header and item records in a structured parent-child format.

* **Header:** Displays general purchase order information, such as purchase order number, vendor number, and document date.
* **Item:** Displays corresponding purchase order item details, such as item number, material, quantity, unit of measure, and net price.

It helps users understand the relationship between header-level and item-level data in a structured format.

## Features

* Select purchase orders using SELECT-OPTIONS.
* Retrieve purchase order header details from EKKO.
* Retrieve corresponding item details from EKPO using FOR ALL ENTRIES.
* Establish the header-item relationship using the purchase order number (EBELN).
* Customize column headings, positions, and output lengths using the field catalog.
* Configure ALV layout properties for better data presentation.
* Display related header and item records using Hierarchical Sequential ALV.

## SAP Environment

* SAP ECC 6.0
* ABAP Workbench (SE38)

## SAP Tables

* EKKO — Purchasing Document Header Data
* EKPO — Purchasing Document Item Data

## ABAP Concepts

* **SELECT-OPTIONS:** Enables users to select purchase orders using a range of values.
* **TYPES and DATA Declarations:** Used to define structures, internal tables, and work areas.
* **Structures and Internal Tables:** Used to store purchase order header and item records.
* **Open SQL and SELECT:** Used to retrieve data from EKKO and EKPO.
* **FOR ALL ENTRIES:** Retrieves corresponding item records based on the purchase orders selected in the header table.
* **IF Condition:** Checks whether header records are available before fetching item details.
* **Field Catalog:** Defines ALV column properties such as field names, column positions, headings, output lengths, and key fields.
* **ALV Layout:** Controls display settings such as expansion fields, window title, and column width optimization.
* **Header-Item Relationship:** Establishes the relationship between EKKO and EKPO using the common purchase order number (EBELN).
* **REUSE_ALV_HIERSEQ_LIST_DISPLAY:** Function module used to display header and item records in a hierarchical parent-child structure.

## Program Name

Z_ALV_HIERARICAL