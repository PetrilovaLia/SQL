-- prikaz LIMIT
-- SELECT * vrati vsetko, ale ja nechcem, obmedzim pocet riadkov
-- vrati 10 riadkov
SELECT *
FROM "Track"
LIMIT 10

-- indexuje od 1
-- chcem 4 pesnicky od 3 miesta
SELECT *
FROM "Track"
LIMIT 4
OFFSET 3
-- prve 3 sa vynechaju - kolko ich chceme preskocit

-- Priklad najdi 10 najdlhsich filmov pod 5 minut pricom vypis len ich meno a dobu v minutach
-- Bonus pomocou internetu zisti ako vypises minuty zaokruhlene na 2 desatinne miesta
-- SELECT "Name", ROUND(("Milliseconds"/1000)/60::decimal,2) as minutes
SELECT "Name", ROUND("Milliseconds"::decimal/60000,2) as minutes
FROM "Track"
WHERE ROUND("Milliseconds"::decimal/60000,2) < 5
ORDER BY "Milliseconds" DESC
LIMIT 10

SELECT *
FROM "Track"
LIMIT 4
OFFSET 3

-- Priklad najdi 10 najdlhsich pesniciek pod 5 minut pricom vypis len ich meno a dobu v minutach
-- Bonus pomocou internetu zisti ako vypises minuty zaokruhlene na 2 desatinne miesta

SELECT "Name", ROUND(("Milliseconds"/1000)/60::decimal,2) as minutes
FROM "Track"
WHERE ROUND(("Milliseconds"/1000)/60::decimal,2) < 5

-- Najdi top dvoch unikatnych autorov skladieb, 
-- ktore maju dlzku nazvu medzi 8 az 15 znakov  a su zoradeny podla mena
SELECT DISTINCT "Composer" 
FROM "Track"
-- WHERE LENGTH("Name") > 8 AND LENGTH("Name") < 15
WHERE LENGTH("Name") BETWEEN 8 AND 15
ORDER BY "Composer"
LIMIT 2

-- UPOZORNENIE LIMIT nie je SQL standard je mozne ze v niektorych relacnych databazach nie je LIMIT podporovany 
-- Oficialne podla SQL standardu sa pouziva prikaz FETCH ktory robi presne to iste ako LIMIT len ma trosku inu syntax
