-- =====================================================================
--  Testovací data pro úkol Bronze -> Silver
--  Tabulka: brz_mv_e2_trzby  (zdroj, bronze)
--
--  Toto je vzorek "surových" dat tak, jak přišla od dodavatelů do bronzové
--  vrstvy. Data nejsou vyčištěná. Počítej s tím, že některé řádky mohou být
--  problematické -- tvoje řešení by se s nimi mělo vypořádat rozumně.
--
--  Skript předpokládá, že tabulka brz_mv_e2_trzby existuje. Jednoduchá
--  definice (vše jako text, jak odpovídá bronzové vrstvě) je níže zakomentovaná.
-- =====================================================================

-- CREATE TABLE brz_mv_e2_trzby (
--   brzId                 integer,
--   vykazBrzId            integer,
--   isDeleted             boolean,
--   loadTimestamp         timestamp,
--   sourceFile            varchar(255),
--   obdobi                varchar(255),
--   typZakaznika          varchar(255),
--   spotrebniPasmo        varchar(255),
--   pocetOm               varchar(255),
--   dodavkaMwh            varchar(255),
--   trzbyObchodniSlozka   varchar(255),
--   trzbyRegulovanaSlozka varchar(255),
--   trzbyDph              varchar(255),
--   trzbyDanElektrina     varchar(255),
--   trzbyOstatniPoplatky  varchar(255)
-- );

INSERT INTO brz_mv_e2_trzby
(brzId, vykazBrzId, isDeleted, loadTimestamp, sourceFile, obdobi, typZakaznika,
 spotrebniPasmo, pocetOm, dodavkaMwh, trzbyObchodniSlozka, trzbyRegulovanaSlozka,
 trzbyDph, trzbyDanElektrina, trzbyOstatniPoplatky)
VALUES
(1, 100, false, '2026-08-20 09:00:00', 'vykaz_100.xlsx', '2026-01', 'C',
 'do 0,999', '1500', '980.500', '1250000.00', '640000.00', '396900.00', '28000.00', '15300.00'),

(2, 100, false, '2026-08-20 09:00:00', 'vykaz_100.xlsx', '2026-01', 'D',
 'od 1,000 do 2,499', '4200', '7350.250', '5880000.00', '3010000.00', '1867000.00', '147000.00', '63000.00'),

(3, 100, false, '2026-08-20 09:00:00', 'vykaz_100.xlsx', '2026-01', 'C',
 'od 2,500 do 4,999', '880', '3120,750', '2450000,50', '1180000,00', '764100,10', '61000,00', '22000,00'),

(4, 100, true, '2026-08-20 09:05:00', 'vykaz_100.xlsx', '2026-01', 'C',
 'do 0,999', '999', '510.000', '410000.00', '210000.00', '129000.00', '14000.00', '7000.00'),

(5, 101, false, '2026-08-21 10:00:00', 'vykaz_101.xlsx', '2026-02', '',
 'od 5,000 do 14,999', '320', '2880.000', '2100000.00', '980000.00', '646000.00', '45000.00', '12000.00'),

(6, 101, false, '2026-08-21 10:00:00', 'vykaz_101.xlsx', '2026-02', 'C',
 'od 15,000', '40', '', '1500000.00', '700000.00', '462000.00', '30000.00', '9000.00'),

(7, 102, false, '2026-08-22 11:00:00', 'vykaz_102.xlsx', '2026/02', 'D',
 'do 0,999', '2100', '1650.000', '1320000.00', '690000.00', '402000.00', '33000.00', '10000.00'),

(8, 102, false, '2026-08-22 11:00:00', 'vykaz_102.xlsx', '2026-02', 'C',
 'od 1,000 do 2,499', '150.0', '1120.500', '900000.00', '470000.00', '288000.00', '21000.00', '8000.00'),

(9, 103, false, '2026-08-23 08:30:00', 'vykaz_103.xlsx', '2026-01', 'D',
 'od 2,500 do 4,999', ' 600 ', ' 4200.000 ', '3360000.00', '1750000.00', '1071000.00', '84000.00', '30000.00'),

(10, 103, false, '2026-08-23 08:30:00', 'vykaz_103.xlsx', '2026-01', 'C',
 'od 5,000 do 14,999', '75', '5200.000', '4100000.00', NULL, '1281000.00', '90000.00', '25000.00'),

(11, 104, false, '2026-08-24 14:00:00', 'vykaz_104.xlsx', '2026-02', 'D',
 'od 15,000', '12', '980.000', '850000.00', '400000.00', '262000.00', '18000.00', '5000.00'),

(12, 100, false, '2026-08-20 09:10:00', 'vykaz_100.xlsx', '2026-01', 'C',
 'od 1,000 do 2,499', '300', '1980.000', '1600000.00', '820000.00', '500000.00', '36000.00', '11000.00');
