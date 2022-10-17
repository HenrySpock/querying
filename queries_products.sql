-- Comments in SQL Start with dash-dash --
1. 
INSERT INTO products (name, price, can_be_returned) VALUES ('chair', '44.00', 'false');

2. 
INSERT INTO products (name, price, can_be_returned) VALUES ('stool', '25.99', 'true'); 

3. 
INSERT INTO products (name, price, can_be_returned) VALUES ('table', '124.00', 'false');

4. 
products_db=# SELECT * FROM products;
 id | name  | price | can_be_returned
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t
  3 | table |   124 | f

5.
products_db=# SELECT name FROM products;
 name
-------
 chair
 stool
 table
(3 rows)

6.
products_db=# SELECT name, price FROM products;
 name  | price
-------+-------
 chair |    44
 stool | 25.99
 table |   124
(3 rows)

7. INSERT INTO products (name, price, can_be_returned) VALUES ('standing mirror', '499.00', 'false');
UPDATE products SET price = 499.00 WHERE name = 'standing mirror';

8. 
products_db=# SELECT name FROM products WHERE can_be_returned = 't';
 name
-------
 stool
(1 row)

9.
products_db=# SELECT name FROM products WHERE price < 44;
 name
-------
 stool
(1 row)

10.
products_db=# SELECT name FROM products WHERE price BETWEEN 22.50 AND 99.99;
 name
-------
 chair
 stool
(2 rows)

11.
products_db=# UPDATE products SET price = price * .8;
products_db=# UPDATE products SET price = ROUND(price::numeric, 2);
products_db=# SELECT * FROM products;
 id |      name       | price | can_be_returned
----+-----------------+-------+-----------------
  2 | stool           | 20.79 | t
  3 | table           |  99.2 | f
  4 | standing mirror | 399.2 | f
  1 | chair           |  35.2 | f
(4 rows)

12. 
products_db=# DELETE FROM products WHERE price < 25;
DELETE 1
products_db=# SELECT * FROM products;
 id |      name       | price | can_be_returned
----+-----------------+-------+-----------------
  3 | table           |  99.2 | f
  4 | standing mirror | 399.2 | f
  1 | chair           |  35.2 | f
(3 rows)

13. 
products_db=# UPDATE products SET price = price / .8;
UPDATE 3
products_db=# UPDATE products SET price = ROUND(price::numeric, 2);
UPDATE 3
products_db=# SELECT * FROM products;
 id |      name       | price | can_be_returned
----+-----------------+-------+-----------------
  3 | table           |   124 | f
  4 | standing mirror |   499 | f
  1 | chair           |    44 | f
(3 rows)

14.
products_db=# UPDATE products SET can_be_returned = 't';
UPDATE 3
products_db=# SELECT * FROM products;
 id |      name       | price | can_be_returned
----+-----------------+-------+-----------------
  3 | table           |   124 | t
  4 | standing mirror |   499 | t
  1 | chair           |    44 | t
(3 rows)

