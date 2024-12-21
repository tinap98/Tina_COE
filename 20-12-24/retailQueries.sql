mysql> CREATE TABLE salespeople (
    ->          snum    INT  NOT NULL,
    ->          sname VARCHAR(30)   NOT NULL,
    ->          city  VARCHAR(30)   NOT NULL,
    ->          comm  DECIMAL(4,2)  NOT NULL,
    ->          PRIMARY KEY  (snum)
    ->        );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO salespeople VALUES (1001, 'Peel', 'London', 0.12);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO salespeople VALUES (1002, 'Serres', 'San Jose', .13);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO salespeople VALUES (1004,'Motika', 'London', .11);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO salespeople VALUES (1007,'Rifkin', 'Barcelona', .15);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO salespeople VALUES (1003,'AxelRod', 'New York', .10);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO salespeople VALUES (1005,'Fran', 'London', .26);
Query OK, 1 row affected (0.00 sec)

mysql> CREATE TABLE customer (
    ->          cnum    INT  NOT NULL,
    ->          cname VARCHAR(30)   NOT NULL,
    ->          city  VARCHAR(30)   NOT NULL,
    ->          rating int not null,
    ->          snum  int  NOT NULL,
    ->          PRIMARY KEY  (cnum),
    ->      FOREIGN KEY (snum) REFERENCES salespeople(snum));
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> INSERT INTO customer VALUES (2001, 'Hoffman', 'London',100, 1001);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO customer VALUES (2002,'Giovanni', 'Rome', 200, 1003);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO customer VALUES (2003,'Liu','San Jose',200,1002);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO customer VALUES (2004,'Grass', 'Berlin', 300,1002);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO customer VALUES (2006,'Clemens', 'London', 100, 1001);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO customer VALUES(2008,'Cisneros','San Jose',300, 1007);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO customer VALUES (2007,'Pereira', 'Rome', 100 ,1004);
Query OK, 1 row affected (0.03 sec)

mysql> CREATE TABLE orders (
    ->          onum    INT  NOT NULL,
    ->     amt  DECIMAL(7,2)  NOT NULL,
    ->          odate  Date   NOT NULL,
    ->  cnum  int  NOT NULL,
    ->          PRIMARY KEY  (onum),
    ->      FOREIGN KEY (cnum) REFERENCES customer(cnum)
    ->        );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO orders VALUES (3001, 18.69, '1996-03-10', 2008);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO orders VALUES (3003, 767.19, '1996-10-03', 2001);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO orders VALUES (3002, 1900.10, '1996-10-03', 2007);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO orders VALUES (3005, 5160.45, '1996-10-03', 2003);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO orders VALUES (3006, 1098.16, '1996-10-03', 2008);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO orders VALUES (3009, 1713.23, '1996-10-04', 2002);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO orders VALUES (3007, 75.75, '1996-10-04', 2002);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO orders VALUES (3008, 4723.00, '1996-10-05', 2006);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO orders VALUES (3010, 1309.95, '1996-10-06', 2004);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO orders VALUES (3011, 9891.88, '1996-10-06', 2006);
Query OK, 1 row affected (0.03 sec)

Q1: Find number of customers for each salespeople
Q2: Best Salesperson based on customer rating
Q3: To whom we need to fire from salespeople team.
Q4: Who has less customer rating.
Q5. Display salespeople who has customers from same city.
Q6. Find the names and numbers of all salespeople who had more than one customer.
Q7.Find customers in San Jose who have a rating above 200.
Q8. List all customers with ratings above San Jose average.

mysql> SELECT sname, COUNT(cnum) AS num_of_customers
    -> FROM salespeople
    -> JOIN customer ON salespeople.snum = customer.snum
    -> GROUP BY sname;
+---------+------------------+
| sname   | num_of_customers |
+---------+------------------+
| AxelRod |                1 |
| Motika  |                1 |
| Peel    |                2 |
| Rifkin  |                1 |
| Serres  |                2 |
+---------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT sname
    -> FROM salespeople
    -> JOIN customer ON salespeople.snum = customer.snum
    -> GROUP BY sname
    -> ORDER BY AVG(rating) DESC
    -> LIMIT 1;
+--------+
| sname  |
+--------+
| Rifkin |
+--------+
1 row in set (0.00 sec)

mysql> SELECT sname
    -> FROM salespeople
    -> JOIN customer ON salespeople.snum = customer.snum
    -> GROUP BY sname
    -> ORDER BY AVG(rating) ASC
    -> LIMIT 1;
+--------+
| sname  |
+--------+
| Motika |
+--------+
1 row in set (0.00 sec)

mysql> SELECT cname
    -> FROM customer
    -> ORDER BY rating ASC
    -> LIMIT 1;
+---------+
| cname   |
+---------+
| Hoffman |
+---------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT sname
    -> FROM salespeople
    -> JOIN customer ON salespeople.snum = customer.snum
    -> WHERE salespeople.city = customer.city;
+--------+
| sname  |
+--------+
| Peel   |
| Serres |
+--------+
2 rows in set (0.00 sec)

mysql> SELECT sname, snum
    -> FROM salespeople
    -> JOIN customer ON salespeople.snum = customer.snum
    -> GROUP BY snum
    -> HAVING COUNT(cnum) > 1;
ERROR 1052 (23000): Column 'snum' in field list is ambiguous
mysql> SELECT salespeople.sname, salespeople.snum
    -> FROM salespeople
    -> JOIN customer ON salespeople.snum = customer.snum
    -> GROUP BY salespeople.snum
    -> HAVING COUNT(customer.cnum) > 1;
+--------+------+
| sname  | snum |
+--------+------+
| Peel   | 1001 |
| Serres | 1002 |
+--------+------+
2 rows in set (0.00 sec)

mysql> SELECT cname, rating
    -> FROM customer
    -> WHERE city = 'San Jose' AND rating > 200;
+----------+--------+
| cname    | rating |
+----------+--------+
| Cisneros |    300 |
+----------+--------+
1 row in set (0.00 sec)

mysql> SELECT cname, rating
    -> FROM customer
    -> WHERE rating > (
    ->     SELECT AVG(rating) FROM customer WHERE city = 'San Jose'
    -> );
+----------+--------+
| cname    | rating |
+----------+--------+
| Grass    |    300 |
| Cisneros |    300 |
+----------+--------+
2 rows in set (0.01 sec)
