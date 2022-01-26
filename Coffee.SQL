/* Create Employee table */
CREATE TABLE EMPLOYEE
(
  employee_id INTEGER PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  hire_date DATE,
  job_title VARCHAR(30)
);

/* Create Coffee Shop table */
CREATE TABLE COFFEE_SHOP
(
  shop_id INTEGER PRIMARY KEY,
  shop_name VARCHAR(50),
  city VARCHAR(50),
  state CHAR(2)
);

/* Create Coffee table */
CREATE TABLE COFFEE
(
  coffee_id INTEGER PRIMARY KEY,
  coffee_name VARCHAR(30),
  price_per_pound NUMERIC(5,2)
);

/* Create Supplier table */
CREATE TABLE SUPPLIER
(
  supplier_id INTEGER PRIMARY KEY,
  company_name VARCHAR(50),
  country VARCHAR(30),
  sales_contact_name VARCHAR(60),
  email VARCHAR(50) NOT NULL
);

/* Add shop_id FK */
ALTER TABLE EMPLOYEE
  ADD shop_id INTEGER,
  ADD FOREIGN KEY(shop_id) REFERENCES COFFEE_SHOP(shop_id);

/* Add shop_id and supplier_id FKs */
ALTER TABLE COFFEE
  ADD shop_id INTEGER,
  ADD supplier_id INTEGER,
  ADD FOREIGN KEY(shop_id) REFERENCES COFFEE_SHOP(shop_id),
  ADD FOREIGN KEY(supplier_id) REFERENCES SUPPLIER(supplier_id);
  
/* Insert example data for employee table */ 
INSERT INTO EMPLOYEE(employee_id, first_name, last_name, hire_date, job_title) 
VALUES(133, "Jean", "Craigson", "1978-03-16", "Team Manager"), 
(244, "Annie", "Jefferson", "1986-12-03", "Marketing Analyst"), 
(355, "John", "Michaels", "1992-04-20", "Systems Administrator"); 

/* Insert example data for Coffee Shop table */ 
INSERT INTO COFFEE_SHOP(shop_id, shop_name, city, state) 
VALUES(15643, "Jaunty New Haven Coffee Beanery", "New Haven", “CO”), 
(25353, "Jaunty South Coffee Beanery", "Jacksonville", “FL”), 
(35364, "Jaunty Midwest Coffee", "Chicago", “IL”); 

/* Insert example data for Coffee table */ 
INSERT INTO COFFEE(coffee_id, coffee_name, price_per_pound) 
VALUES(123, "Abyssal", 16.45), 
(234, "Caramel Macchiato", 13.95), 
(345, "Celeste", 14.55); 

/* Insert example data for Supplier table */ 
INSERT INTO SUPPLIER(supplier_id, company_name, country, sales_contact_name, email) 
VALUES(1234, "Coffee Beans R Us", "United States", "Abby Deans", "ADeans1@cbru.com"), 
(2345, "Yum Yum Coffee", "China", "Jian Yang", "JianYang@yumyumcoffee.com"), 
(3456, "The Beanz", "United States", "Mike Docker", "crichalds@thebeanz.rocks");

/* Set shop_id for each employee */ 
UPDATE EMPLOYEE 
SET shop_id = 15643 WHERE employee_id = 133; 
UPDATE EMPLOYEE 
SET shop_id = 25353 WHERE employee_id = 244; 
UPDATE EMPLOYEE 
SET shop_id = 35364 WHERE employee_id = 355; 

/* Set shop and supplier id for each coffee */ 
UPDATE COFFEE 
SET shop_id = 15643, supplier_id = 1234 WHERE coffee_id = 345; 
UPDATE COFFEE 
SET shop_id = 25353, supplier_id = 2345 WHERE coffee_id = 234; 
UPDATE COFFEE 
SET shop_id = 35364, supplier_id = 3456 WHERE coffee_id = 123; 

/* Create view to concatenate employee names */ 
CREATE VIEW Full_names AS 
SELECT CONCAT(first_name, ' ', last_name) AS employee_full_name, employee_id, hire_date, job_title, shop_id 
FROM EMPLOYEE 
WHERE first_name IS NOT NULL AND last_name IS NOT NULL; 
