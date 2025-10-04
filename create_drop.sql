-- pridavanie a mazanie tabulky v postgresql
-- Nazvy klucovych slov SQL budeme pisat velkymi pismenami 
-- Nazvy tabuliek a stlpcov = snake_case  
-- SQL NIE je case sensitive


-- CREATE TABLE [IF NOT EXISTS] table_name (
--    column1 datatype(length) column_contraint,
--    column2 datatype(length) column_contraint,
-- );



DROP TABLE IF EXISTS students;

CREATE TABLE IF NOT EXISTS students (
	student_id   serial PRIMARY KEY,
	username     VARCHAR (128) UNIQUE NOT NULL,
	password     VARCHAR (128) NOT NULL,
	is_new       BOOLEAN,
	year_born    INTEGER NOT NULL,
	created_on   TIMESTAMP NOT NULL,
    last_login TIMESTAMP 
);


-- DROP TABLE [IF EXISTS] table_name 
-- [CASCADE | RESTRICT];
-- CASCADE - zmaže tabuľku a všetky jej závislosti (viac neskôr)
-- RESTRICT - zmaže tabuľku len ak nemá závislosti ... toto je default, aj bez toho, aby to bolo napísané

DROP TABLE IF EXISTS students
RESTRICT;

CREATE TABLE student (
	student_id serial PRIMARY KEY,
	username VARCHAR (128) UNIQUE NOT NULL,
)

DROP TABLE Student


-- Keď vytvoríme tabuľku s veľkým písmenom, uloží sa s malými písmenami lebo je case insensitive (nerozlišuje)
CREATE TABLE TestTable();
-- Toto je teda ten istý CREATE a vráti error, pretože tabuľka s takým názvom už existuje
CREATE TABLE TESTTable();

-- To isté platí aj pre názvy stĺpcov v tabuľke 
-- Ak chceme použiť veľké písmená musíme použiť dvojité úvodzovky 
DROP TABLE IF EXISTS TESTTABLE;
CREATE TABLE IF NOT EXISTS "TESTTABLE"(
	"COLMUN_NAME" varchar(256) NOT NULL
);
-- TERAZ VSAK VZDY MUSIME POUZIT DVOJITE UVODZOVKY NA TO ABY SME MOHLI PRACOVAT S TABULKKOU
-- Preto toto vráti chybu 
DROP TABLE TESTTABLE;
-- A toto prejde
DROP TABLE "TESTTABLE";

-- Nechcem, aby ste používali veľké písmená pre názvy tabuliek a stĺpcov!!!!
