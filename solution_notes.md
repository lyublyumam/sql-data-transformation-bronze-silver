# Solution Notes

## 1. Splitting the period and decimal separator
The `obdobi` column was split using the `SPLIT_PART` function — the first part before the dash was used for year, the second part for half-year. One row contained a slash instead of a dash (`2026/02`), so I added a `REPLACE` function before splitting to normalize the format. The decimal comma issue was also solved using `REPLACE` — replacing the comma with a dot before casting to decimal.

## 2. Idempotency
Idempotency was achieved by adding `DELETE FROM TRZBY` at the beginning of the script. Before each INSERT run, the Silver table is cleared and fully reloaded — since the Silver layer is derived from Bronze, a full reload is safe and straightforward.

## 3. Problematic rows
The sample data contained several problematic rows: a row with an invalid `obdobi` format (`2026/02`), a row with whitespace around the value in `pocet_om`, empty strings in `dodavkaMwh` and `typZakaznika`, and a NULL value in `trzbyRegulovanaSlozka`. Empty strings and NULLs were handled using `NULLIF`, whitespace using `TRIM`. Soft-deleted rows were excluded using `WHERE isDeleted = false`. The task did not explicitly specify how to handle an empty string in `typZakaznika` — I decided to convert it to NULL using `NULLIF`, as an empty string is not a valid customer type code.

## 4. Use of AI
AI was used as assistance in finding functions I had not used before and to verify the correctness of my approach. One case where AI suggested an incorrect solution was the `pocet_om` column — AI suggested a direct `CAST to integer`, which failed due to the value `150.0`. I had to add an intermediate step through `decimal` — first casting to decimal, then to integer.
