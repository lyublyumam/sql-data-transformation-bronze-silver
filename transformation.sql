-- =====================================================================
--  Transformace Bronze -> Silver
--  Zdroj: brz_mv_e2_trzby | Cíl: TRZBY
-- =====================================================================

delete from TRZBY;

insert into TRZBY
(vykaz_id, rok, pololeti, typ_zakaznika_kod, spotrebni_pasmo_e, 
pocet_om, dodavka_mwh, trzby_obchodni_slozka, trzby_regulovana_slozka, 
trzby_dph, trzby_dan_elektrina, trzby_ostatni_poplatky)
select 
	vykazbrzid,
	cast(split_part(replace(obdobi, '/', '-'), '-', 1) as integer),
	cast(split_part(replace(obdobi, '/', '-'), '-', 2) as integer), 
	nullif(typzakaznika, ''), 
	spotrebnipasmo, 
	cast(cast(trim(pocetom) as decimal) as integer),
	cast(nullif(replace(dodavkamwh, ',', '.'), '') as decimal(18,3)), 
	cast(replace(trzbyobchodnislozka, ',', '.') as decimal(18,2)),
	cast(nullif(replace(trzbyregulovanaslozka, ',', '.'), '') as decimal(18,2)), 
	cast(replace(trzbydph, ',', '.') as decimal(18,2)), 
	cast(replace(trzbydanelektrina, ',', '.') as decimal(18,2)),
	cast(replace(trzbyostatnipoplatky, ',', '.') as decimal(18,2)) 
from brz_mv_e2_trzby
where isdeleted = false;

select * from TRZBY;