-- pridávanie a mazanie tabuľky v postgresql
-- Názvy kľúčových slov SQL budeme písať veľkými písmenami 
-- Názvy tabuliek a stĺpcov = snake_case  
-- SQL NIE je case sensitive


-- CREATE TABLE [IF NOT EXISTS] table_name (
--    column1 datatype(length) column_contraint,
--    column2 datatype(length) column_contraint,
-- );

CREATE TABLE IF NOT EXISTS students (
	student_id   serial PRIMARY KEY,
	username     VARCHAR (128) UNIQUE NOT NULL
);


-- DROP TABLE [IF EXISTS] table_name 
-- [CASCADE | RESTRICT];
-- CASCADE - zmaže tabuľku a všetky jej závislosti (viac neskôr)
-- RESTRICT - zmaže tabuľku len ak nemá závislosti ... toto je default, aj bez toho, aby to bolo napísané

DROP TABLE IF EXISTS student
RESTRICT;

CREATE TABLE student (
	student_id 	serial PRIMARY KEY,
	username 	VARCHAR (128) UNIQUE NOT NULL,
)

-- Keď vytvoríme tabuľku s veľkým písmenom, uloží sa s malými písmenami lebo je case insensitive (nerozlišuje)
CREATE TABLE TestTabulky();
-- Toto je teda ten istý CREATE a vráti error, pretože tabuľka s takým názvom už existuje
CREATE TABLE TESTTabulky();

-- To isté platí aj pre názvy stĺpcov v tabuľke 
-- Ak chceme použiť veľké písmená musíme použiť dvojité úvodzovky 
DROP TABLE IF EXISTS TestTabulky;
CREATE TABLE IF NOT EXISTS "TestTabulky"(
	"COLMUN_NAME" varchar(256) NOT NULL
);
-- TERAZ VSAK VZDY MUSIME POUZIT DVOJITE UVODZOVKY NA TO ABY SME MOHLI PRACOVAT S TABULKOU
-- Preto toto vráti chybu 
DROP TABLE TestTabulky;
-- A toto prejde
DROP TABLE "TestTabulky";

-- Nechcem, aby ste používali veľké písmená pre názvy tabuliek a stĺpcov!!!!
