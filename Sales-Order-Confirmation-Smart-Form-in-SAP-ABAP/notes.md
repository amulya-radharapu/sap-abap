# Project Notes

Notes on what I learnt while building the Sales Order Confirmation Smart Form.

## What I Learnt

- How to upload a logo in SE78 (BMAP) and show it with a Graphic node
- How to pass select-options from a driver program to a Smart Form using the Tables tab ('IS_VBELN TYPE ZTT_VBELN')
- How to fetch data inside the form with a Program Lines node on the Initialization tab
- Why every variable used in the Initialization code must be listed under Input or Output Parameters
- How to define global types, work areas and internal tables
- How to fetch the customer address from KNA1 using the customer number from VBAK
- How 'FOR ALL ENTRIES' fetches the items of every order in an internal table, and why the table must be checked for being empty first
- How a Table node works with line types, a Header row and a Main Area row
- The difference between a Main window and Secondary windows
- How to find the generated function module name and call it from a driver program

## Problems I Faced and How I Fixed Them

1. Error: width of line type does not correspond to total table width. Cause: Column widths did not add up to the table width. Fix: Changed the line type widths so they add up exactly to the table width (17.00 CM) 
2. Runtime error: work area has fewer fields than selected (labels form) | The SELECT fields did not match the structure used as the work area | Made the type match the SELECT in number, order and field names |
3. Error: field "IT" is unknown on the loop node | The table was renamed but the loop node still used the old name | Updated the Internal Table and Work Area on the loop's Data tab |
4. Error: field WA_VBAK is unknown | WA_VBAK and WA_KNA1 were missing from the Output Parameters of the Initialization node | Added all the variables used in the code to the Output Parameters |
5. Warnings: WA_VBAP field has no defined value | The check cannot see that the table node fills the work area at runtime | Confirmed the table node's Data tab and ignored the warnings, as they do not stop activation |
6. Field names such as &WA_VBAK-VBELN& printed as plain text | The text was not recognised as fields | Recreated the text node, copying the working address node |
7. Item number wrapped onto a second line | The Item column was too narrow for the 6 digit item number | Made the column wider and reduced another column so the total stayed 17.00 CM |
8. Items of many orders printed together | The selection screen was left empty or had a wide range | Entered a single order number in the From field |

## Limitations

- If a range of order numbers is entered, the header and customer address show only the first order, while the item table contains items of all orders in the range
- The generated function module name (`/1BCDWB/SF...`) is different in every SAP system, so it must be changed in the driver program

## Possible Improvements

- Print one form per order when a range is entered (call the form in a loop, one order at a time)
- Format the order date as DD.MM.YYYY
- Add a page footer with the page number
- Add the material labels form as a second part of the project