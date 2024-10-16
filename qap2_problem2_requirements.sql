{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww14460\viewh13180\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ---------------------------------------------------------------------------------------------------------------------\
-- CREATE TABLES\
---------------------------------------------------------------------------------------------------------------------\
\
-- Products Table\
CREATE TABLE products (\
	id SERIAL PRIMARY KEY,\
	product_name TEXT,\
	price DECIMAL(10, 2),\
	stock_quantity INTEGER\
);\
\
-- Customers Table\
CREATE TABLE customers (\
	id SERIAL PRIMARY KEY,\
	first_name TEXT,\
	last_name TEXT,\
	email TEXT UNIQUE\
);\
\
-- Orders Table\
CREATE TABLE orders (\
	id SERIAL PRIMARY KEY,\
	customer_id INTEGER,\
	order_date DATE,\
	FOREIGN KEY (customer_id) REFERENCES customers(id)\
);\
\
-- Order Items Table\
CREATE TABLE order_items (\
	order_id INTEGER,\
	product_id INTEGER,\
	quantity INTEGER,\
	PRIMARY KEY (order_id, product_id),\
	FOREIGN KEY (order_id) REFERENCES orders(id),\
	FOREIGN KEY (product_id) REFERENCES product(id)\
);\
\
---------------------------------------------------------------------------------------------------------------------\
-- INSERT DATA\
---------------------------------------------------------------------------------------------------------------------\
\
-- Products Table\
INSERT INTO products (product_name, price, stock_quantity) VALUES\
	(\'91iPhone 16\'92, 1129.00, 30),\
	(\'91MacBook Pro 14-inch\'92, 2099.00, 8),\
	(\'91iPad Air\'92, 799.00, 13),\
	(\'91Apple Watch Series 10\'92, 549.00, 19),\
	(\'91AirPods Max\'92, 779.00, 11)\
;\
\
-- Customers Table\
INSERT INTO customers (first_name, last_name, email) VALUES\
	(\'91Steve\'92, \'91Jobs\'92, \'91steve.jobs@apple.com\'92),\
	(\'92Steve\'92, \'91Wozniak\'92, \'91steve.wozniak@apple.com\'92),\
	(\'91Ronald\'92, \'92Wayne\'92, \'91ronald.wayne@apple.com\'92),\
	(\'91Tim\'92, \'91Cook\'92, \'91tim.cook@apple.com\'92)\
;\
\
-- Orders Table\
INSERT INTO orders (customer_id, order_date) VALUES\
	(1, \'912024-10-01\'92),\
	(1, \'922024-10-09\'92),\
	(2, \'912024-10-10\'92),\
	(3, \'912024-10-13\'92),\
	(4, \'912024-10-15\'92)\
;\
\
-- Order Items Table\
INSERT INTO order_items (order_id, product_id, quantity) VALUES\
	(1, 2, 2),\
	(1, 5, 3),\
	(2, 1, 3),\
	(2, 4, 2),\
	(3, 3, 1),\
	(3, 5, 1),\
	(4, 1, 1),\
	(4, 5, 1),\
	(5, 4, 3),\
	(5, 2, 2),\
	(5, 1, 5)\
;}