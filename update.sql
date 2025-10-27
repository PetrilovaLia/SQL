-- Create.Read.Update.Delete
-- sada prikazov 

DROP TABLE IF EXISTS customer CASCADE;

CREATE TABLE IF NOT EXISTS customer (
    customer_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    company VARCHAR(80),
    address VARCHAR(70),
    city VARCHAR(40),
    stat VARCHAR(40),
    country VARCHAR(40),
    postal_code VARCHAR(10),
    phone VARCHAR(24),
    fax VARCHAR(24),
    email VARCHAR(60) NOT NULL,
    support_rep_id INT
);

INSERT INTO customer (customer_id, first_name, last_name, company, address, city, stat, country, postal_code, phone, fax, email, support_rep_id) VALUES (1, N'Luís', N'Gonçalves', N'Embraer - Empresa Brasileira de Aeronáutica S.A.', N'Av. Brigadeiro Faria Lima, 2170', N'São José dos Campos', N'SP', N'Brazil', N'12227-000', N'+55 (12) 3923-5555', N'+55 (12) 3923-5566', N'luisg@embraer.com.br', 3);
INSERT INTO customer (customer_id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (2, N'Leonie', N'Köhler', N'Theodor-Heuss-Straße 34', N'Stuttgart', N'Germany', N'70174', N'+49 0711 2842222', N'leonekohler@surfeu.de', 5);
INSERT INTO customer (customer_id, first_name, last_name, address, city, stat, country, postal_code, phone, email, support_rep_id) VALUES (3, N'François', N'Tremblay', N'1498 rue Bélanger', N'Montréal', N'QC', N'Canada', N'H2G 1A7', N'+1 (514) 721-4711', N'ftremblay@gmail.com', 3);
INSERT INTO customer (customer_id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (4, N'Bjørn', N'Hansen', N'Ullevålsveien 14', N'Oslo', N'Norway', N'0171', N'+47 22 44 22 22', N'bjorn.hansen@yahoo.no', 4);
INSERT INTO customer (customer_id, first_name, last_name, company, address, city,country, postal_code, phone, fax, email, support_rep_id) VALUES (5, N'Frantiešek', N'Wichterlová', N'JetBrains s.r.o.', N'Klanova 9/506', N'Prague', N'Czech Republic', N'14700', N'+420 2 4172 5555', N'+420 2 4172 5555', N'frantisekw@jetbrains.com', 4);


SELECT * 
FROM customer

-- chcem premenovat tabulku
ALTER TABLE customer
RENAME TO customers

-- chcem zmenit nazov stlpca
ALTER TABLE customers
RENAME COLUMN customer_id TO customers_id

-- zmena udajov v tabulke
-- identifukujem pomocou id
UPDATE customers
SET first_name = 'Some',
	last_name = 'Stranger'
WHERE customers_id = 2

-- PK je naspodku tabulky - nevieme aka je specifikacia zoradenia
SELECT * 
FROM customers

-- viaceri naraz
UPDATE customers
SET first_name = 'Some',
	last_name = 'Stranger'
WHERE customers_id <= 3

-- trik, ktory sa moze zist
-- filter nazvou
-- ctrl + medzernik
-- speci schema - udaje o tabulkach
-- filter nazvov stlpcov
SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'customers'


ALTER TABLE customers
ADD COLUMN test_column_not_null VARCHAR(256);

UPDATE customers
SET test_column_not_null = 'x'

ALTER TABLE customers
ALTER COLUMN test_column_not_null SET NOT NULL 















