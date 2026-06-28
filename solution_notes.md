Písemné zdůvodnění:



1. Rozklad období a desetinná čárka

Sloupec `obdobi` jsem rozdělil pomocí funkce `SPLIT_PART` — pro rok jsem vzal první část před pomlčkou, pro pololetí druhou část. V datech byl problematický řádek kde `obdobi` používalo lomítko místo pomlčky (`2026/02`), proto jsem před rozdělením 	přidal funkci `REPLACE` která lomítko nahradila pomlčkou. Desetinnou čárku jsem také řešil pomocí `REPLACE` — čárku jsem nahradil tečkou před přetypováním na decimal.

2. Opakovatelnost

Opakovatelnost bez duplicit jsem zajistil příkazem `DELETE FROM TRZBY` na začátku skriptu. Před každým spuštěním INSERT se silver tabulka vyprázdní a naplní znovu — silver vrstva je odvozená z bronze, takže její kompletní přepočet je bezpečný a přehledný.

3. Problematické řádky

Ve vzorku jsem narazil na několik problematických řádků: řádek se špatným formátem `obdobi` (`2026/02`), řádek s mezerami kolem hodnoty ve sloupci `pocet_om`, prázdné řetězce v `dodavkaMwh` a `typZakaznika`, a NULL hodnotu v `trzbyRegulovanaSlozka`. Prázdné řetězce a NULL jsem ošetřil pomocí `NULLIF`, mezery pomocí `TRIM`. Řádek s `isDeleted = true` jsem vyfiltroval podmínkou `WHERE isDeleted = false`. V zadání nebylo jednoznačně určeno jak naložit s řádkem kde typZakaznika je prázdný řetězec — rozhodl jsem se ho převést na NULL pomocí NULLIF, protože prázdný řetězec není platná hodnota kódu zákazníka.

4. Použití AI

AI jsem použil jako pomoc při získávání funkcí které jsem dříve nepoužíval a na kontrolu správnosti postupu. Konkrétní případ kde AI navrhla špatné řešení byl sloupec `pocet_om` — AI navrhla `CAST na integer`, což nefungovalo kvůli hodnotě `150.0`. Musel jsem přidat mezikrok přes `decimal` — nejdřív přetypovat na decimal a pak na integer.
