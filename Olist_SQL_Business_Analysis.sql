/*===========================================================
                 OLIST SQL BUSINESS ANALYSIS
============================================================

Project  : Olist Brazilian E-Commerce Analysis
Database : olist
Tool     : MySQL Workbench 8.0
Queries  : 100
Author   : SANJITH GOWDA B K

===========================================================*/


/*===========================================================
                    SALES ANALYSIS
===========================================================*/

-- Q1 - Q10


/*===========================================================
                  CUSTOMER ANALYSIS
===========================================================*/

-- Q11 - Q20


/*===========================================================
                  PRODUCT ANALYSIS
===========================================================*/

-- Q21 - Q30


/*===========================================================
                  PAYMENT ANALYSIS
===========================================================*/

-- Q31 - Q40


/*===========================================================
                  SELLER ANALYSIS
===========================================================*/

-- Q41 - Q50


/*===========================================================
               DELIVERY & LOGISTICS ANALYSIS
===========================================================*/

-- Q51 - Q60


/*===========================================================
              CUSTOMER REVIEW ANALYSIS
===========================================================*/

-- Q61 - Q70


/*===========================================================
               ADVANCED BUSINESS ANALYSIS
===========================================================*/

-- Q71 - Q80


/*===========================================================
             WINDOW FUNCTIONS & CTE ANALYSIS
===========================================================*/

-- Q81 - Q90


/*===========================================================
             ADVANCED SQL BUSINESS INSIGHTS
===========================================================*/

-- Q91 - Q100


create database olist;
use olist;


-- CREATING customer table
CREATE TABLE customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);
LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state);


-- CREATING geolocation table
CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat INT,
    geolocation_lng INT,
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(50)
);
LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/olist_geolocation_dataset.csv'
INTO TABLE geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(geolocation_zip_code_prefix,geolocation_lat,geolocation_lng,geolocation_city,geolocation_state);


-- CREATING order_items table
CREATE TABLE order_items (
    order_id VARCHAR(200),
    order_item_id INT,
    product_id VARCHAR(200),
    seller_id VARCHAR(200),
    shipping_limit_date DATETIME,
    price INT,
    freight_value INT
);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value );


-- CREATING order_payments table
CREATE TABLE order_payments (
    order_id VARCHAR(200),
    payment_sequential INT,
    payment_type VARCHAR(200),
    payment_installments INT,
    payment_value INT
);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/olist_order_payments_dataset.csv'
INTO TABLE order_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id,payment_sequential,payment_type,payment_installments,payment_value);


-- CREATING order_reviews table
CREATE TABLE order_reviews (
    review_id VARCHAR(200),
    order_id VARCHAR(200),
    review_score INT,
    review_comment_title VARCHAR(500),
    review_comment_message VARCHAR(5000),
    review_creation_date VARCHAR(50),
    review_answer_timestamp VARCHAR(50)
);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/olist_order_reviews_dataset.csv'
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp);


-- CREATING orders table
CREATE TABLE orders(
order_id VARCHAR(200),
customer_id VARCHAR(200),
order_status VARCHAR(200),
order_purchase_timestamp VARCHAR(200),
order_approved_at VARCHAR(200),
order_delivered_carrier_date VARCHAR(200),
order_delivered_customer_date VARCHAR(200),
order_estimated_delivery_date VARCHAR(200)
);


LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id,customer_id,order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date);


-- CREATING products table
CREATE TABLE products(
product_id VARCHAR(200),
product_category_name VARCHAR(200),
product_name_lenght INT,
product_description_lenght INT,
product_photos_qty INT,
product_weight_g INT,
product_length_cm INT,
product_height_cm INT,
product_width_cm INT);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id,product_category_name,product_name_lenght,product_description_lenght,product_photos_qty,product_weight_g,product_length_cm,product_height_cm,product_width_cm);


-- CREATING sellers table
CREATE TABLE sellers(
seller_id VARCHAR(200),
seller_zip_code_prefix INT,
seller_city VARCHAR(200),
seller_state VARCHAR(200)
);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(seller_id,seller_zip_code_prefix,seller_city,seller_state);


-- CREATING category_translation
CREATE TABLE category_translation(
product_category_name VARCHAR(200),
product_category_name_english VARCHAR(200)
);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/Desktop/archive/product_category_name_translation.csv'
INTO TABLE  category_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_category_name,product_category_name_english);

SHOW FULL TABLES;

SELECT * FROM customers;
SELECT * FROM geolocation;
SELECT * FROM order_items;
SELECT * FROM order_payments;
SELECT * FROM order_reviews;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM sellers;
SELECT * FROM category_translation;


DESCRIBE customers;
DESCRIBE geolocation;
DESCRIBE order_items;
DESCRIBE order_payments;
DESCRIBE order_reviews;
DESCRIBE orders;
DESCRIBE products;
DESCRIBE sellers;
DESCRIBE category_translation;


SELECT COUNT(*)  FROM customers;
SELECT COUNT(*) FROM geolocation;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM order_payments;
SELECT COUNT(*) FROM order_reviews;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM category_translation;


SELECT * FROM customers LIMIT 5;
SELECT * FROM geolocation LIMIT 5;
SELECT * FROM order_items LIMIT 5;
SELECT * FROM order_payments LIMIT 5;
SELECT * FROM order_reviews LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM sellers LIMIT 5;
SELECT * FROM category_translation LIMIT 5;


-- Q1. Find the total revenue generated

SELECT
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM order_payments;


-- Q2. Find the total number of orders

SELECT
    COUNT(order_id) AS total_orders
FROM orders;


-- Q3. Find the average order value (AOV)

SELECT
    ROUND(SUM(payment_value) /
          (SELECT COUNT(order_id) FROM orders), 2) AS average_order_value
FROM order_payments;


-- Q4. Find the top 10 product categories by revenue

SELECT
    ct.product_category_name_english,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN category_translation ct
ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;


-- Q5. Find the top 10 customers by total spending

SELECT
    c.customer_unique_id,
    ROUND(SUM(op.payment_value),2) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;

-- Q6. Find the monthly revenue trend

SELECT
    DATE_FORMAT(
    STR_TO_DATE(o.order_purchase_timestamp, '%d-%m-%Y %H:%i'),'%Y-%m') AS month,
    ROUND(SUM(op.payment_value), 2) AS total_revenue
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;


-- Q7. Find the monthly order trend

SELECT
    DATE_FORMAT(
        STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y %H:%i'),
        '%Y-%m'
    ) AS month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- Q8. Find the top 10 states by revenue

SELECT
    c.customer_state,
    ROUND(SUM(op.payment_value), 2) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC
LIMIT 10;


-- Q9. Find the top 10 cities by revenue

SELECT
    c.customer_city,
    ROUND(SUM(op.payment_value), 2) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_city
ORDER BY total_revenue DESC
LIMIT 10;


-- Q10. Find the top 10 best-selling products

SELECT
    p.product_id,
    p.product_category_name,
    COUNT(oi.order_id) AS total_units_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_category_name
ORDER BY total_units_sold DESC
LIMIT 10;


-- Q11. Find the total number of customers

SELECT
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers;


-- Q12. Find the number of new customers each month

SELECT
    DATE_FORMAT(
        STR_TO_DATE(o.order_purchase_timestamp, '%d-%m-%Y %H:%i'),
        '%Y-%m'
    ) AS month,
    COUNT(DISTINCT c.customer_unique_id) AS new_customers
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY month
ORDER BY month; 


-- Q13. Find the top 10 customers with the highest number of orders

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 10;


-- Q14. Find the top 10 customers by total spending

SELECT
    c.customer_unique_id,
    ROUND(SUM(op.payment_value),2) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;


-- Q15. Find the average spending per customer

SELECT
    ROUND(AVG(customer_spending),2) AS average_customer_spending
FROM
(
    SELECT
        c.customer_unique_id,
        SUM(op.payment_value) AS customer_spending
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    JOIN order_payments op
    ON o.order_id = op.order_id
    GROUP BY c.customer_unique_id
) t;


-- Q16. Find the top 10 customer states by number of customers

SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC
LIMIT 10;


-- Q17. Find the top 10 customer cities by number of customers

SELECT
    customer_city,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;


-- Q18. Find the average number of orders per customer

SELECT
    ROUND(AVG(total_orders),2) AS average_orders_per_customer
FROM
(
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) t;


-- Q19. Find customers who placed more than 5 orders

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING total_orders > 5
ORDER BY total_orders DESC;


-- Q20. Find customers who spent more than the average customer spending

SELECT
    customer_unique_id,
    total_spent
FROM
(
    SELECT
        c.customer_unique_id,
        SUM(op.payment_value) AS total_spent
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    JOIN order_payments op
    ON o.order_id = op.order_id
    GROUP BY c.customer_unique_id
) t
WHERE total_spent >
(
    SELECT AVG(customer_spending)
    FROM
    (
        SELECT
            SUM(op.payment_value) AS customer_spending
        FROM customers c
        JOIN orders o
        ON c.customer_id = o.customer_id
        JOIN order_payments op
        ON o.order_id = op.order_id
        GROUP BY c.customer_unique_id
    ) x
)
ORDER BY total_spent DESC;

-- Q21. Find the total number of products

SELECT
    COUNT(product_id) AS total_products
FROM products;


-- Q22. Find the total number of product categories

SELECT
    COUNT(DISTINCT product_category_name) AS total_categories
FROM products;


-- Q23. Find the top 10 best-selling product categories

SELECT
    ct.product_category_name_english,
    COUNT(oi.product_id) AS total_units_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN category_translation ct
ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY total_units_sold DESC
LIMIT 10;


-- Q24. Find the top 10 product categories by revenue

SELECT
    ct.product_category_name_english,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN category_translation ct
ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;


-- Q25. Find the average product price by category

SELECT
    ct.product_category_name_english,
    ROUND(AVG(oi.price),2) AS average_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN category_translation ct
ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY average_price DESC;


-- Q26. Find the top 10 most expensive products sold

SELECT
    product_id,
    MAX(price) AS highest_price
FROM order_items
GROUP BY product_id
ORDER BY highest_price DESC
LIMIT 10;


-- Q27. Find the top 10 cheapest products sold

SELECT
    product_id,
    MIN(price) AS lowest_price
FROM order_items
GROUP BY product_id
ORDER BY lowest_price
LIMIT 10;


-- Q28. Find the top 10 products generating the highest revenue

SELECT
    product_id,
    ROUND(SUM(price),2) AS total_revenue
FROM order_items
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;


-- Q29. Find the top 10 products with the highest sales quantity

SELECT
    product_id,
    COUNT(*) AS total_quantity
FROM order_items
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 10;


-- Q30. Find the top 10 categories with the highest average product weight

SELECT
    ct.product_category_name_english,
    ROUND(AVG(product_weight_g),2) AS average_weight
FROM products p
JOIN category_translation ct
ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY average_weight DESC
LIMIT 10;


-- Q31. Find the most preferred payment method

SELECT
    payment_type,
    COUNT(*) AS total_transactions
FROM order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;


-- Q32. Find the revenue generated by each payment method

SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments
GROUP BY payment_type
ORDER BY total_revenue DESC;


-- Q33. Find the average payment value for each payment method

SELECT
    payment_type,
    ROUND(AVG(payment_value),2) AS average_payment
FROM order_payments
GROUP BY payment_type
ORDER BY average_payment DESC;


-- Q34. Find the maximum payment made using each payment method

SELECT
    payment_type,
    MAX(payment_value) AS highest_payment
FROM order_payments
GROUP BY payment_type;


-- Q35. Find the average number of installments for each payment method

SELECT
    payment_type,
    ROUND(AVG(payment_installments),2) AS average_installments
FROM order_payments
GROUP BY payment_type
ORDER BY average_installments DESC;


-- Q36. Find the top 10 orders with the highest payment value

SELECT
    order_id,
    payment_value
FROM order_payments
ORDER BY payment_value DESC
LIMIT 10;


-- Q37. Find the percentage contribution of each payment method to total revenue

SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS revenue,
    ROUND((SUM(payment_value) /
          (SELECT SUM(payment_value) FROM order_payments))*100,2) AS revenue_percentage
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC;


-- Q38. Find the payment method with the highest average installment count

SELECT
    payment_type,
    ROUND(AVG(payment_installments),2) AS avg_installments
FROM order_payments
GROUP BY payment_type
ORDER BY avg_installments DESC
LIMIT 1;


-- Q39. Find orders paid in more than 10 installments

SELECT
    order_id,
    payment_type,
    payment_installments,
    payment_value
FROM order_payments
WHERE payment_installments > 10
ORDER BY payment_installments DESC;


-- Q40. Find the distribution of orders by installment count

SELECT
    payment_installments,
    COUNT(*) AS total_orders
FROM order_payments
GROUP BY payment_installments
ORDER BY payment_installments;


-- Q41. Find the total number of sellers

SELECT
    COUNT(seller_id) AS total_sellers
FROM sellers;


-- Q42. Find the top 10 sellers by total revenue

SELECT
    oi.seller_id,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
GROUP BY oi.seller_id
ORDER BY total_revenue DESC
LIMIT 10;


-- Q43. Find the top 10 sellers by total orders

SELECT
    seller_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC
LIMIT 10;


-- Q44. Find the average revenue generated per seller

SELECT
    ROUND(AVG(total_revenue),2) AS average_revenue
FROM
(
    SELECT
        seller_id,
        SUM(price) AS total_revenue
    FROM order_items
    GROUP BY seller_id
) t;


-- Q45. Find the seller with the highest average selling price

SELECT
    seller_id,
    ROUND(AVG(price),2) AS average_price
FROM order_items
GROUP BY seller_id
ORDER BY average_price DESC
LIMIT 1;


-- Q46. Find the top 10 sellers by total freight charges

SELECT
    seller_id,
    ROUND(SUM(freight_value),2) AS total_freight
FROM order_items
GROUP BY seller_id
ORDER BY total_freight DESC
LIMIT 10;


-- Q47. Find the states with the highest number of sellers

SELECT
    seller_state,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;


-- Q48. Find the cities with the highest number of sellers

SELECT
    seller_city,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_city
ORDER BY total_sellers DESC
LIMIT 10;


-- Q49. Find sellers who sold products in more than 100 orders

SELECT
    seller_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_items
GROUP BY seller_id
HAVING total_orders > 100
ORDER BY total_orders DESC;


-- Q50. Find the seller contributing the highest percentage of total revenue

SELECT
    seller_id,
    ROUND(SUM(price),2) AS revenue,
    ROUND(
        SUM(price) * 100 /
        (SELECT SUM(price) FROM order_items),
        2
    ) AS revenue_percentage
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 1;


-- Q51. Find the average delivery time for all orders

SELECT
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(order_delivered_customer_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(order_purchase_timestamp,'%d-%m-%Y %H:%i')
    )),2) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


-- Q52. Find the average shipping time from seller to customer

SELECT
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(order_delivered_customer_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(order_delivered_carrier_date,'%d-%m-%Y %H:%i')
    )),2) AS avg_shipping_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
AND order_delivered_carrier_date IS NOT NULL;


-- Q53. Find the average processing time before shipment

SELECT
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(order_delivered_carrier_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(order_purchase_timestamp,'%d-%m-%Y %H:%i')
    )),2) AS avg_processing_days
FROM orders
WHERE order_delivered_carrier_date IS NOT NULL;


-- Q54. Find the top 10 states with the fastest average delivery

SELECT
    c.customer_state,
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(o.order_delivered_customer_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i')
    )),2) AS avg_delivery_days
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days 
LIMIT 10;


-- Q55. Find the top 10 states with the slowest average delivery

SELECT
    c.customer_state,
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(o.order_delivered_customer_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i')
    )),2) AS avg_delivery_days
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC
LIMIT 10;


-- Q56. Find the number of orders delivered after the estimated delivery date

SELECT
    COUNT(*) AS late_orders
FROM orders
WHERE STR_TO_DATE(order_delivered_customer_date,'%d-%m-%Y %H:%i')
>
STR_TO_DATE(order_estimated_delivery_date,'%d-%m-%Y %H:%i');


-- Q57. Find the number of orders delivered before the estimated delivery date

SELECT
    COUNT(*) AS early_orders
FROM orders
WHERE STR_TO_DATE(order_delivered_customer_date,'%d-%m-%Y %H:%i')
<
STR_TO_DATE(order_estimated_delivery_date,'%d-%m-%Y %H:%i');


-- Q58. Find the percentage of delayed deliveries

SELECT
    ROUND(
        COUNT(CASE
            WHEN STR_TO_DATE(order_delivered_customer_date,'%d-%m-%Y %H:%i')
            >
            STR_TO_DATE(order_estimated_delivery_date,'%d-%m-%Y %H:%i')
            THEN 1
        END)
        *100.0/COUNT(*),2
    ) AS delayed_delivery_percentage
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


-- Q59. Find the average estimated delivery time

SELECT
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(order_estimated_delivery_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(order_purchase_timestamp,'%d-%m-%Y %H:%i')
    )),2) AS avg_estimated_delivery_days
FROM orders;


-- Q60. Find the average delivery delay for late orders

SELECT
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(order_delivered_customer_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(order_estimated_delivery_date,'%d-%m-%Y %H:%i')
    )),2) AS avg_delay_days
FROM orders
WHERE STR_TO_DATE(order_delivered_customer_date,'%d-%m-%Y %H:%i')
>
STR_TO_DATE(order_estimated_delivery_date,'%d-%m-%Y %H:%i');


-- Q61. Find the average review score

SELECT
    ROUND(AVG(review_score),2) AS average_review_score
FROM order_reviews;


-- Q62. Find the distribution of review scores

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC;


-- Q63. Find the percentage of 5-star reviews

SELECT
    ROUND(
        COUNT(CASE WHEN review_score = 5 THEN 1 END) * 100.0 /
        COUNT(*),2
    ) AS five_star_review_percentage
FROM order_reviews;


-- Q64. Find the percentage of 1-star reviews

SELECT
    ROUND(
        COUNT(CASE WHEN review_score = 1 THEN 1 END) * 100.0 /
        COUNT(*),2
    ) AS one_star_review_percentage
FROM order_reviews;


-- Q65. Find the average review score by payment method

SELECT
    op.payment_type,
    ROUND(AVG(orv.review_score),2) AS average_review_score
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
JOIN order_reviews orv
ON o.order_id = orv.order_id
GROUP BY op.payment_type
ORDER BY average_review_score DESC;


-- Q66. Find the average review score by product category

SELECT
    ct.product_category_name_english,
    ROUND(AVG(orv.review_score),2) AS average_review_score
FROM orders o
JOIN order_reviews orv
ON o.order_id = orv.order_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
JOIN category_translation ct
ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY average_review_score DESC;


-- Q67. Find the top 10 sellers with the highest average review score

SELECT
    oi.seller_id,
    ROUND(AVG(orv.review_score),2) AS average_review_score
FROM order_items oi
JOIN order_reviews orv
ON oi.order_id = orv.order_id
GROUP BY oi.seller_id
ORDER BY average_review_score DESC
LIMIT 10;


-- Q68. Find the top 10 sellers with the lowest average review score

SELECT
    oi.seller_id,
    ROUND(AVG(orv.review_score),2) AS average_review_score
FROM order_items oi
JOIN order_reviews orv
ON oi.order_id = orv.order_id
GROUP BY oi.seller_id
ORDER BY average_review_score
LIMIT 10;


-- Q69. Find the average delivery time for each review score

SELECT
    orv.review_score,
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(o.order_delivered_customer_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i')
    )),2) AS average_delivery_days
FROM orders o
JOIN order_reviews orv
ON o.order_id = orv.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY orv.review_score
ORDER BY orv.review_score DESC;


-- Q70. Find the review score with the highest number of reviews

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY total_reviews DESC
LIMIT 1;


-- Q71. Find customers who spent more than the average customer spending

SELECT
    c.customer_unique_id,
    ROUND(SUM(op.payment_value),2) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
HAVING total_spent >
(
    SELECT AVG(customer_spending)
    FROM
    (
        SELECT
            SUM(payment_value) AS customer_spending
        FROM orders o
        JOIN order_payments op
        ON o.order_id = op.order_id
        GROUP BY o.customer_id
    ) t
)
ORDER BY total_spent DESC;


-- Q72. Find products priced above the average product price

SELECT
    product_id,
    price
FROM order_items
WHERE price >
(
    SELECT AVG(price)
    FROM order_items
)
ORDER BY price DESC;


-- Q73. Find sellers generating above-average revenue

SELECT
    seller_id,
    ROUND(SUM(price),2) AS total_revenue
FROM order_items
GROUP BY seller_id
HAVING total_revenue >
(
    SELECT AVG(total_revenue)
    FROM
    (
        SELECT
            SUM(price) AS total_revenue
        FROM order_items
        GROUP BY seller_id
    ) t
)
ORDER BY total_revenue DESC;


-- Q74. Find customers who purchased from multiple sellers

SELECT
    o.customer_id,
    COUNT(DISTINCT oi.seller_id) AS total_sellers
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id
HAVING total_sellers > 1
ORDER BY total_sellers DESC;


-- Q75. Find the top 10 orders with the highest freight cost

SELECT
    order_id,
    ROUND(SUM(freight_value),2) AS total_freight
FROM order_items
GROUP BY order_id
ORDER BY total_freight DESC
LIMIT 10;


-- Q76. Find the average freight cost by seller

SELECT
    seller_id,
    ROUND(AVG(freight_value),2) AS average_freight
FROM order_items
GROUP BY seller_id
ORDER BY average_freight DESC;


-- Q77. Find the top 10 cities with the highest average order value

SELECT
    c.customer_city,
    ROUND(AVG(op.payment_value),2) AS average_order_value
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_city
ORDER BY average_order_value DESC
LIMIT 10;


-- Q78. Find the states where average delivery exceeded 15 days

SELECT
    c.customer_state,
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(o.order_delivered_customer_date,'%d-%m-%Y %H:%i'),
        STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i')
    )),2) AS average_delivery_days
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
HAVING average_delivery_days > 15
ORDER BY average_delivery_days DESC;


-- Q79. Find product categories with more than 1000 products sold

SELECT
    ct.product_category_name_english,
    COUNT(*) AS total_products_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN category_translation ct
ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
HAVING total_products_sold > 1000
ORDER BY total_products_sold DESC;


-- Q80. Find customers who placed more than the average number of orders

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING total_orders >
(
    SELECT AVG(order_count)
    FROM
    (
        SELECT
            COUNT(order_id) AS order_count
        FROM orders
        GROUP BY customer_id
    ) t
)
ORDER BY total_orders DESC;


-- Q81. Rank sellers based on total revenue

SELECT
    seller_id,
    ROUND(SUM(price),2) AS total_revenue,
    RANK() OVER(ORDER BY SUM(price) DESC) AS seller_rank
FROM order_items
GROUP BY seller_id;


-- Q82. Assign a row number to products based on revenue

SELECT
    product_id,
    ROUND(SUM(price),2) AS total_revenue,
    ROW_NUMBER() OVER(ORDER BY SUM(price) DESC) AS row_num
FROM order_items
GROUP BY product_id;


-- Q83. Find the top-selling product in each category

WITH category_sales AS
(
    SELECT
        ct.product_category_name_english,
        oi.product_id,
        COUNT(*) AS total_sales,
        ROW_NUMBER() OVER(
            PARTITION BY ct.product_category_name_english
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM order_items oi
    JOIN products p
    ON oi.product_id = p.product_id
    JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
    GROUP BY ct.product_category_name_english, oi.product_id
)

SELECT
    product_category_name_english,
    product_id,
    total_sales
FROM category_sales
WHERE rn = 1;


-- Q84. Find the running total of monthly revenue

SELECT
    DATE_FORMAT(
        STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i'),
        '%Y-%m'
    ) AS month,
    ROUND(SUM(op.payment_value),2) AS monthly_revenue,
    ROUND(
        SUM(SUM(op.payment_value))
        OVER(
            ORDER BY DATE_FORMAT(
                STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i'),
                '%Y-%m'
            )
        ),
        2
    ) AS running_total
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY month;


-- Q85. Find the previous month's revenue

WITH monthly_sales AS
(
    SELECT
        DATE_FORMAT(
            STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i'),
            '%Y-%m'
        ) AS month,
        ROUND(SUM(op.payment_value),2) AS revenue
    FROM orders o
    JOIN order_payments op
    ON o.order_id = op.order_id
    GROUP BY month
)

SELECT
    month,
    revenue,
    LAG(revenue) OVER(ORDER BY month) AS previous_month_revenue
FROM monthly_sales;


-- Q86. Find the next month's revenue

WITH monthly_sales AS
(
    SELECT
        DATE_FORMAT(
            STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i'),
            '%Y-%m'
        ) AS month,
        ROUND(SUM(op.payment_value),2) AS revenue
    FROM orders o
    JOIN order_payments op
    ON o.order_id = op.order_id
    GROUP BY month
)

SELECT
    month,
    revenue,
    LEAD(revenue) OVER(ORDER BY month) AS next_month_revenue
FROM monthly_sales;


-- Q87. Divide customers into 4 spending groups

WITH customer_spending AS
(
    SELECT
        c.customer_unique_id,
        ROUND(SUM(op.payment_value),2) AS total_spent
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    JOIN order_payments op
    ON o.order_id = op.order_id
    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,
    total_spent,
    NTILE(4) OVER(ORDER BY total_spent DESC) AS spending_group
FROM customer_spending;
-- Q88. Find each seller's contribution to total revenue

SELECT
    seller_id,
    ROUND(SUM(price),2) AS revenue,
    ROUND(
        SUM(price) * 100 /
        SUM(SUM(price)) OVER(),
        2
    ) AS revenue_percentage
FROM order_items
GROUP BY seller_id;


-- Q89. Find the top 5 customers from each state based on spending

WITH customer_sales AS
(
    SELECT
        c.customer_state,
        c.customer_unique_id,
        ROUND(SUM(op.payment_value),2) AS total_spent,
        ROW_NUMBER() OVER(
            PARTITION BY c.customer_state
            ORDER BY SUM(op.payment_value) DESC
        ) AS rn
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    JOIN order_payments op
    ON o.order_id = op.order_id
    GROUP BY c.customer_state, c.customer_unique_id
)

SELECT
    customer_state,
    customer_unique_id,
    total_spent
FROM customer_sales
WHERE rn <= 5;


-- Q90. Find the revenue difference between consecutive months

WITH monthly_sales AS
(
    SELECT
        DATE_FORMAT(
            STR_TO_DATE(o.order_purchase_timestamp,'%d-%m-%Y %H:%i'),
            '%Y-%m'
        ) AS month,
        ROUND(SUM(op.payment_value),2) AS revenue
    FROM orders o
    JOIN order_payments op
    ON o.order_id = op.order_id
    GROUP BY month
)

SELECT
    month,
    revenue,
    revenue - LAG(revenue) OVER(ORDER BY month) AS revenue_difference
FROM monthly_sales;


-- Q91. Find the top 3 highest revenue-generating sellers

WITH seller_revenue AS
(
    SELECT
        seller_id,
        ROUND(SUM(price),2) AS total_revenue
    FROM order_items
    GROUP BY seller_id
)

SELECT *
FROM seller_revenue
ORDER BY total_revenue DESC
LIMIT 3;


-- Q92. Find customers who never gave a review

SELECT DISTINCT
    c.customer_unique_id
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN order_reviews r
ON o.order_id = r.order_id
WHERE r.review_id IS NULL;


-- Q93. Find orders containing more than one product

SELECT
    order_id,
    COUNT(product_id) AS total_products
FROM order_items
GROUP BY order_id
HAVING total_products > 1
ORDER BY total_products DESC;


-- Q94. Find products sold by more than 10 sellers

SELECT
    product_id,
    COUNT(DISTINCT seller_id) AS total_sellers
FROM order_items
GROUP BY product_id
HAVING total_sellers > 10
ORDER BY total_sellers DESC;


-- Q95. Find customers who purchased products from multiple categories

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT p.product_category_name) AS total_categories
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY c.customer_unique_id
HAVING total_categories > 1
ORDER BY total_categories DESC;


-- Q96. Find the most expensive product in each category

WITH ranked_products AS
(
    SELECT
        ct.product_category_name_english,
        oi.product_id,
        oi.price,
        ROW_NUMBER() OVER(
            PARTITION BY ct.product_category_name_english
            ORDER BY oi.price DESC
        ) AS rn
    FROM order_items oi
    JOIN products p
    ON oi.product_id = p.product_id
    JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
)

SELECT
    product_category_name_english,
    product_id,
    price
FROM ranked_products
WHERE rn = 1;


-- Q97. Find the monthly growth in revenue

WITH monthly_sales AS
(
    SELECT
        DATE_FORMAT(
            STR_TO_DATE(order_purchase_timestamp,'%d-%m-%Y %H:%i'),
            '%Y-%m'
        ) AS month,
        SUM(op.payment_value) AS revenue
    FROM orders o
    JOIN order_payments op
    ON o.order_id = op.order_id
    GROUP BY month
)

SELECT
    month,
    revenue,
    revenue - LAG(revenue) OVER(ORDER BY month) AS growth
FROM monthly_sales;


-- Q98. Categorize customers based on total spending

SELECT
    c.customer_unique_id,
    ROUND(SUM(op.payment_value),2) AS total_spent,
    CASE
        WHEN SUM(op.payment_value) >= 1000 THEN 'High Value'
        WHEN SUM(op.payment_value) >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_unique_id;


-- Q99. Find the percentage of delivered and cancelled orders

SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM orders),2) AS percentage
FROM orders
GROUP BY order_status
ORDER BY percentage DESC;


-- Q100. Find the overall business summary

SELECT
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT COUNT(DISTINCT customer_unique_id) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM sellers) AS total_sellers,
    (SELECT COUNT(*) FROM products) AS total_products,
    (SELECT ROUND(SUM(payment_value),2) FROM order_payments) AS total_revenue;