{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0\cname textColor;}
\margl1440\margr1440\vieww14460\viewh13180\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf2 ---------------------------------------------------------------------------------------------------------------------\
-- WRITE SQL QUERIES\
---------------------------------------------------------------------------------------------------------------------\
\
-- Retrieve the names and stock quantities of all products\
SELECT product_name, stock_quantity\
FROM products;\
\
-- Retrieve the product names and quantities for one of the orders placed\
SELECT products.product_name, order_items.quantity\
FROM order_items\
JOIN products ON order_items.product_id = products.id\
WHERE order_items.order_id = 1\
;\
\
-- Retrieve all the orders placed by a specific customer (including the IDs of what was ordered and the quantities)\
SELECT orders.id AS orders_id, order_items.product_id, order_items.quantity\
FROM orders\
JOIN order_items ON orders.id = order_items.order_id\
WHERE orders.customer_id = 1\
;\
\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf2 ---------------------------------------------------------------------------------------------------------------------\
-- UPDATE DATA\
---------------------------------------------------------------------------------------------------------------------\
\
-- Update stock for all items in order with id = 1\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf2 UPDATE products\
SET stock_quantity = stock_quantity - order_items.quantity\
FROM order_items\
WHERE products.id = order_items.product_id\
AND order_items.order_id = 1\
;\
\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf2 ---------------------------------------------------------------------------------------------------------------------\
-- DELETE DATA\
---------------------------------------------------------------------------------------------------------------------\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf2 \
DELETE FROM order_items\
WHERE order_id =1;\
\
DELETE FROM orders\
WHERE id = 1;\
}