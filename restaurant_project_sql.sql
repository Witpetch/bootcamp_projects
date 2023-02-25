.mode markdown
.header on 


CREATE TABLE fact_orders (
    order_no INT UNIQUE NOT NULL,
    order_date DATE,
    menu_id INT,
    customer_id INT,
    emp_id INT,
    payment_id INT,
  FOREIGN KEY (menu_id) REFERENCES dim_menus(menu_id),
  FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
  FOREIGN KEY (emp_id) REFERENCES dim_emps(emp_id),
  FOREIGN KEY (payment_id) REFERENCES dim_payment(pay_id)
);

INSERT INTO fact_orders VALUES
  (1,'2022-08-13', 2, 3, 1, 1),
  (2,'2022-08-16', 1, 2, 2, 2),
  (3,'2022-08-19', 3, 2, 3, 2),
  (4,'2022-08-19', 5, 1, 3, 3),
  (5,'2022-08-21', 4, 4, 4, 1),
  (6,'2022-08-22', 4, 4, 1, 1),
  (7,'2022-08-22', 4, 2, 1, 1),
  (8,'2022-08-22', 5, 2, 3, 1),
  (9,'2022-08-22', 5, 2, 2, 1),
  (10,'2022-08-22', 2, 2, 4, 1);
CREATE TABLE dim_customers (
    customer_id INT UNIQUE NOT NULL,
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    Tel TEXT
);

INSERT INTO dim_customers VALUES
  (1, 'Noina', 'Sasi', '089-998-8899'),
  (2, 'Supa', 'Pasu', '083-456-7890'),
  (3, 'Tuu', 'Pom', '081-112-2211'),
  (4, 'Song', 'Nueng', '084-444-4444');

CREATE TABLE dim_menus (
  menu_id INT UNIQUE NOT NULL,
  name VARCHAR(30),
  price REAL
);

INSERT INTO dim_menus values
  (1,'Somtum', 150.0),
  (2,'Larb', 120.0),
  (3,'Namtok', 130.0),
  (4,'Tomzaab', 130.0),
  (5,'Grilled Chicken', 220.0);

CREATE TABLE dim_emps (
  emp_id INT UNIQUE NOT NULL,
  name VARCHAR(30),
  nation VARCHAR(30)
);

INSERT INTO dim_emps values
  (1,'Ploy', 'Thai'),
  (2,'Petch', 'Thai'),
  (3,'John', 'England'),
  (4,'Mai', 'Japan');

CREATE TABLE dim_payment (
  pay_id INT UNIQUE NOT NULL,
  source VARCHAR(30)
);

INSERT INTO dim_payment values
  (1,'Cash'),
  (2,'Credit/Debit Card'),
  (3,'Online payment');

--SELECT TOP 3 BEST SELLER MENU
SELECT 
  menu_name,
  count(menu_name) AS total_order
FROM (
  SELECT
  ord.order_date,
  men.menu_id,
  men.name AS menu_name
  FROM fact_orders AS ord
JOIN dim_menus AS men 
ON ord.menu_id = men.menu_id
) AS sub
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

--SELECT TOP SPENDER
SELECT
  cus.customer_id,
  cus.firstname || ' ' || cus.lastname AS CustomerName,
  sum(men.price) AS total_spend
FROM fact_orders AS ord
JOIN dim_menus AS men
ON ord.menu_id = men.menu_id
JOIN dim_customers AS cus
ON cus.customer_id = ord.customer_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 1;

--SELECT AMOUNT INCOME ON DATE
SELECT 
  ord.order_date AS Orderdate,
  count(ord.order_no) AS Totalorder,
  sum(men.price) AS TotalIncome
FROM fact_orders AS ord
JOIN dim_menus AS men
ON ord.menu_id = men.menu_id
WHERE ord.order_date = '2022-08-22';

--ADD SERVICE CHARGE FOR CASE PAYMENT CREDIT/DEBIT PER ORDER
SELECT
  OrderNo,
  CustomerID,
  CustomerName,
  Payment,
  Price,
  ServiceCharge,
  AddonPrice
FROM (
  SELECT 
  cus.customer_id AS CustomerID,
  ord.order_no AS OrderNo,
  cus.firstname || ' ' || cus.lastname AS CustomerName,
  men.price AS Price,
  pay.source AS Payment,
  CASE WHEN pay.source = 'Credit/Debit Card' THEN 'Add Service Charge 10%'
  ELSE 'No Service Charge'
  END AS ServiceCharge,
  CASE WHEN pay.source = 'Credit/Debit Card' THEN Price*1.10 
  ELSE Price END AS AddonPrice
  FROM fact_orders AS ord
  JOIN dim_customers AS cus ON ord.customer_id = cus.customer_id
  JOIN dim_payment AS pay ON ord.payment_id = pay.pay_id
  JOIN dim_menus AS men ON ord.menu_id = men.menu_id
) AS sub1
  GROUP BY 1;