# sql-data-transformation-bronze-silver
SQL transformation script for moving and cleaning energy market data from Bronze to Silver layer in a data warehouse pipeline.

# SQL Data Transformation: Bronze → Silver

Practical task completed during an internship at ERÚ (Energy Regulatory Office of the Czech Republic).

## Overview
SQL transformation script that moves and cleans energy market data from the Bronze layer to the Silver layer in a data warehouse pipeline. The source data contains electricity revenue reports submitted by energy suppliers under the REMIT monitoring regulation.

## Tech Stack
- PostgreSQL
- DBeaver

## How to Run
1. Create the Bronze table and load test data: `bronze_setup.sql`
2. Create the Silver table (`TRZBY`) using the provided DDL
3. Run the transformation script: `transformation.sql`

## Data Quality Issues Handled
- Mixed decimal separators (comma vs dot)
- Whitespace around numeric values
- Invalid date format in `obdobi` column (`2026/02` instead of `2026-02`)
- Empty strings converted to NULL
- Soft-deleted rows excluded via `isDeleted` flag

## Files
- `transformation.sql` — main transformation script
- `bronze_setup.sql` — creates Bronze table and loads test data
