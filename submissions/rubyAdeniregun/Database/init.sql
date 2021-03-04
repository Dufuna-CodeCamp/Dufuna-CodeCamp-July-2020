/* name of database */
CREATE DATABASE ecommerce_database;

use ecommerce_database;

/* shows the different product categories in the database */
CREATE TABLE product_categories (
id INT NOT NULL AUTO_INCREMENT,
categories VARCHAR (100) NOT NULL,
created_at datetime NOT NULL,
primary key(id)
);

INSERT INTO product_categories (categories, created_at)
VALUES 
	('Skincare', now()),
	('Haircare', now()),
	('Cereals', now()),
	('Fashion', now()),
	('Electronics', now());
    
SELECT * FROM product_categories;

/* shows the list of administrative staff that has access to the database */ 
CREATE TABLE adminstaff_users (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
password VARCHAR(20) NOT NULL,
phonenumber VARCHAR(40) NOT NULL,
created_at datetime NOT NULL,
primary key(id)
);

INSERT INTO adminstaff_users (name, email, password, phonenumber, created_at) 
VALUES
('Vera Thompson', 'verathompson@lilistores.com', 'ver2345', '0813776566', now()),
('Lilian Bach', 'lilianbach@lilistores.com', 'lily6755', '08194565223', now()),
('Howard Bark', 'howardbark@lilistores.com', 'hown0976', '0807347785', now());

/* shows the list of products and availability */
CREATE TABLE products (
id INT NOT NULL AUTO_INCREMENT,
created_by_adminstaff_users_id INT NOT NULL, -- links products to the admin staff who uploaded the product
product_categories_id INT NOT NULL, -- links products to categories
product_name VARCHAR(100) NOT NULL,
product_description VARCHAR(255) NOT NULL,
product_image BLOB(255) NOT NULL,
unit_price DECIMAL (20,2) NOT NULL,
quantity_available INT NOT NULL,
status VARCHAR(40) NOT NULL,
created_at datetime NOT NULL,
primary key (id),
FOREIGN KEY (created_by_adminstaff_users_id) REFERENCES adminstaff_users (id),
FOREIGN KEY (product_categories_id) REFERENCES product_categories (id)
);

SELECT * FROM products;

/* shows the registered customers in the database */
CREATE TABLE registered_customers (
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email_address VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL,
created_at datetime NOT NULL,
primary key(id)
);

INSERT INTO registered_customers (first_name, last_name, email_address, password, created_at) 
VALUES
('Laila', 'Thomas', 'lailathomas@gmail.com', 'thomas2345', now()),
('Sean', 'Akintunde', 'Seanakintunde@yahoo.com', 'tundey6755', now()),
('Hauwa', 'Dauda', 'hauwadada@frontend.com', 'dadacio0976', now());

SELECT * FROM registered_customers;

/* shows the registered customers addresses */
CREATE TABLE customers_addresses (
id INT NOT NULL AUTO_INCREMENT,
registered_customers_id INT NOT NULL, -- links the addresses to the respective customers
street_address VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
state  VARCHAR(100) NOT NULL,
zip_code VARCHAR(100),
country VARCHAR(100) NOT NULL,
phone_number VARCHAR (40) NOT NULL,
created_at DATETIME NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (registered_customers_id) REFERENCES registered_customers (id)
);

INSERT INTO customers_addresses (registered_customers_id, street_address, city, state, zip_code, country, phone_number, created_at) 
VALUES
(3, '11 Barkin Lane', 'Barkin', 'Saudi East', '', 'Saudi Arabia', '239848045536', now()),
(1, '2 Southern close', 'Parkey', 'Phillipi', '456EA8', 'Phillipines', '28965044555', now()),
(2, '15 Adelabu Close', 'Lagos Island', 'Lagos', '', 'Nigeria', '234803453921', now());

SELECT * FROM customers_addresses;

/* shows the order from each customer */
CREATE TABLE customer_orders (
id INT NOT NULL AUTO_INCREMENT,
created_by_registered_customers_id INT NOT NULL,
order_amount DECIMAL (10,2) NOT NULL,
created_at DATETIME NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (created_by_registered_customers_id) REFERENCES registered_customers (id)
);

INSERT INTO customer_orders (created_by_registered_customers_id, order_amount, created_at) 
VALUES
(1, 2750.00, now()),
(3, 14750.00, now()),
(2, 300000.00, now());

SELECT * FROM customer_orders;

/* shows a breakdown of the different items ordered by each customer */
CREATE TABLE order_items (
id INT NOT NULL AUTO_INCREMENT,
customer_orders_id INT NOT NULL,
products_id INT NOT NULL,
quantity INT NOT NULL,
unit_prices DECIMAL (10,2) NOT NULL,
total_amount DECIMAL (10,2) NOT NULL,
created_at DATETIME NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (customer_orders_id) REFERENCES customer_orders (id),
FOREIGN KEY (products_id) REFERENCES products (id)
);

INSERT INTO order_items (customer_orders_id, products_id, quantity, unit_prices, total_amount, created_at) 
VALUES
(1, 2, 1, 2750.00, 2750.00, now()),
(2, 1, 1, 4500.00, 4500.00, now()),
(2, 2, 1, 2750.00, 2750.00, now()),
(2, 5, 1, 7500.00, 7500.00, now()),
(3, 3, 1, 15000.00, 15000.00, now()),
(3, 4, 1, 285000.00, 285000.00, now());

SELECT * FROM order_items;

SHOW TABLES;

