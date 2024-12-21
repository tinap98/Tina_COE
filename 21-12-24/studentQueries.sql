Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.5.16 MySQL Community Server (GPL)

Copyright (c) 2000, 2011, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database coe;
Query OK, 1 row affected (0.00 sec)

mysql> use coe;
Database changed
mysql> show tables
    -> ;
Empty set (0.00 sec)

mysql> CREATE TABLE student (
    ->     sno INT,
    ->     sname VARCHAR(20),
    ->     marks INT,
    ->     city VARCHAR(20),
    ->     mobile BIGINT,
    ->     gender VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> INSERT INTO student VALUES(1, 'TINA', 85, 'Chennai', 9988776655, 'female');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(2, 'PUNITH', 92, 'Hyderabad', 9876543210, 'male');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(3, 'SHREYA', 76, 'Mumbai', 9123456789, 'female');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(4, 'SRIJA', 88, 'Delhi', 9988774433, 'female');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(5, 'SHUBAM', 70, 'Bangalore', 9988332211, 'male');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(6, 'VAISHNAVI', 95, 'Hyderabad', 9222334455, 'female');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(7, 'AARAV', 80, 'Chennai', 9345678901, 'male');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(8, 'VIKRAM', 65, 'Pune', 9754332211, 'male');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(9, 'LALIT', 78, 'Bangalore', 9345678123, 'male');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(10, 'PRANATHI', 90, 'Delhi', 9888776655, 'female');
Query OK, 1 row affected (0.00 sec)

mysql> select
    -> * from student;
+------+-----------+-------+-----------+------------+--------+
| sno  | sname     | marks | city      | mobile     | gender |
+------+-----------+-------+-----------+------------+--------+
|    1 | TINA      |    85 | Chennai   | 9988776655 | female |
|    2 | PUNITH    |    92 | Hyderabad | 9876543210 | male   |
|    3 | SHREYA    |    76 | Mumbai    | 9123456789 | female |
|    4 | SRIJA     |    88 | Delhi     | 9988774433 | female |
|    5 | SHUBAM    |    70 | Bangalore | 9988332211 | male   |
|    6 | VAISHNAVI |    95 | Hyderabad | 9222334455 | female |
|    7 | AARAV     |    80 | Chennai   | 9345678901 | male   |
|    8 | VIKRAM    |    65 | Pune      | 9754332211 | male   |
|    9 | LALIT     |    78 | Bangalore | 9345678123 | male   |
|   10 | PRANATHI  |    90 | Delhi     | 9888776655 | female |
+------+-----------+-------+-----------+------------+--------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM student WHERE city = 'Pune';
+------+--------+-------+------+------------+--------+
| sno  | sname  | marks | city | mobile     | gender |
+------+--------+-------+------+------------+--------+
|    8 | VIKRAM |    65 | Pune | 9754332211 | male   |
+------+--------+-------+------+------------+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM student WHERE city = 'Hyderabad' OR city = 'Pune';
+------+-----------+-------+-----------+------------+--------+
| sno  | sname     | marks | city      | mobile     | gender |
+------+-----------+-------+-----------+------------+--------+
|    2 | PUNITH    |    92 | Hyderabad | 9876543210 | male   |
|    6 | VAISHNAVI |    95 | Hyderabad | 9222334455 | female |
|    8 | VIKRAM    |    65 | Pune      | 9754332211 | male   |
+------+-----------+-------+-----------+------------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM student WHERE (gender = 'female' AND city = 'Hyderabad')
    ->                          OR (gender = 'male' AND city = 'Pune')
    ->                          OR city = 'Bangalore';
+------+-----------+-------+-----------+------------+--------+
| sno  | sname     | marks | city      | mobile     | gender |
+------+-----------+-------+-----------+------------+--------+
|    5 | SHUBAM    |    70 | Bangalore | 9988332211 | male   |
|    6 | VAISHNAVI |    95 | Hyderabad | 9222334455 | female |
|    8 | VIKRAM    |    65 | Pune      | 9754332211 | male   |
|    9 | LALIT     |    78 | Bangalore | 9345678123 | male   |
+------+-----------+-------+-----------+------------+--------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM student WHERE (city = 'Hyderabad' AND gender = 'male' AND marks > 70)
    ->                          OR (city = 'Hyderabad' AND gender = 'female' AND marks > 50)
    ->                          OR (city = 'Pune' AND gender = 'male');
+------+-----------+-------+-----------+------------+--------+
| sno  | sname     | marks | city      | mobile     | gender |
+------+-----------+-------+-----------+------------+--------+
|    2 | PUNITH    |    92 | Hyderabad | 9876543210 | male   |
|    6 | VAISHNAVI |    95 | Hyderabad | 9222334455 | female |
|    8 | VIKRAM    |    65 | Pune      | 9754332211 | male   |
+------+-----------+-------+-----------+------------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM student WHERE marks BETWEEN 50 AND 80 AND city IN ('Hyderabad', 'Bangalore');
+------+--------+-------+-----------+------------+--------+
| sno  | sname  | marks | city      | mobile     | gender |
+------+--------+-------+-----------+------------+--------+
|    5 | SHUBAM |    70 | Bangalore | 9988332211 | male   |
|    9 | LALIT  |    78 | Bangalore | 9345678123 | male   |
+------+--------+-------+-----------+------------+--------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM student WHERE sname LIKE 'S%A';
+------+--------+-------+--------+------------+--------+
| sno  | sname  | marks | city   | mobile     | gender |
+------+--------+-------+--------+------------+--------+
|    3 | SHREYA |    76 | Mumbai | 9123456789 | female |
|    4 | SRIJA  |    88 | Delhi  | 9988774433 | female |
+------+--------+-------+--------+------------+--------+
2 rows in set (0.00 sec)

mysql> SELECT city, COUNT(*) AS "NO of stds" FROM student GROUP BY city;
+-----------+------------+
| city      | NO of stds |
+-----------+------------+
| Bangalore |          2 |
| Chennai   |          2 |
| Delhi     |          2 |
| Hyderabad |          2 |
| Mumbai    |          1 |
| Pune      |          1 |
+-----------+------------+
6 rows in set (0.00 sec)

mysql> SELECT city, AVG(marks) AS "avg score" FROM student GROUP BY city ORDER BY "avg score" DESC LIMIT 1;
+---------+-----------+
| city    | avg score |
+---------+-----------+
| Chennai |   82.5000 |
+---------+-----------+
1 row in set (0.00 sec)

mysql> SELECT city, MAX(marks) AS top_score FROM student GROUP BY city ORDER BY top_score DESC;
+-----------+-----------+
| city      | top_score |
+-----------+-----------+
| Hyderabad |        95 |
| Delhi     |        90 |
| Chennai   |        85 |
| Bangalore |        78 |
| Mumbai    |        76 |
| Pune      |        65 |
+-----------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM student WHERE city = 'Hyderabad' ORDER BY marks DESC LIMIT 1;
+------+-----------+-------+-----------+------------+--------+
| sno  | sname     | marks | city      | mobile     | gender |
+------+-----------+-------+-----------+------------+--------+
|    6 | VAISHNAVI |    95 | Hyderabad | 9222334455 | female |
+------+-----------+-------+-----------+------------+--------+
1 row in set (0.00 sec)

mysql>