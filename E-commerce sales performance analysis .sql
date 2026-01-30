-- Monthly Revenue by Product Category

SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    p.product_category_name AS category,
    SUM(oi.price) AS total_revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY month, category
ORDER BY month, total_revenue DESC;


-- Total Revenue by Product Category (All Time)
SELECT 
    p.product_category_name AS category,
    SUM(oi.price) AS total_revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY category
ORDER BY total_revenue DESC;


-- Orders Count by Product Category

SELECT 
    p.product_category_name AS category,
    COUNT(oi.order_id) AS total_orders
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY category
ORDER BY total_orders DESC;


-- Average Review Score by Category
SELECT 
    p.product_category_name AS category,
    AVG(r.review_score) AS avg_review_score
FROM olist_order_reviews_dataset r
JOIN olist_order_items_dataset oi ON r.order_id = oi.order_id
JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY category
ORDER BY avg_review_score DESC;

-- Revenue Lost / Paid vs Orders
SELECT 
    o.order_id,
    SUM(p.payment_value) AS total_paid,
    SUM(oi.price) AS order_value,
    SUM(oi.price) - SUM(p.payment_value) AS unpaid_amount
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
GROUP BY o.order_id
HAVING unpaid_amount > 0
ORDER BY unpaid_amount DESC;

-- Late Deliveries Analysis

SELECT 
    o.order_id,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_customer_date
FROM olist_orders_dataset o
WHERE o.order_delivered_customer_date > o.order_approved_at;

-- Which products generate the most revenue? Which products actually pay the bills?

SELECT
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
JOIN olist_orders_dataset o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;



-- TOTAL & MONTHLY REVENUE TREND (BASELINE) : Business intent: Is the business growing, stagnating, or declining over time?

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- Business intent:Is revenue driven by loyalty or constant acquisition?
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM olist_orders_dataset
WHERE order_status = 'delivered'
GROUP BY customer_id;
 SELECT
    CASE 
        WHEN customer_orders.total_orders > 1 THEN 'Repeat Customer'
        ELSE 'One-Time Customer'
    END AS customer_type,
    ROUND(SUM(oi.price), 2) AS revenue
FROM (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM olist_orders_dataset
    WHERE order_status = 'delivered'
    GROUP BY customer_id
) customer_orders
JOIN olist_orders_dataset o
    ON customer_orders.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY customer_type;

-- AVERAGE ORDER VALUE (AOV): Business intent: Are customers buying more per transaction?
SELECT
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';


-- FUNNEL DROP-OFF (THE STRATEGIC PIECE): Business intent: Where are we losing customers?
SELECT
    COUNT(DISTINCT o.order_id) AS orders_created,
    COUNT(DISTINCT p.order_id) AS orders_paid,
    COUNT(DISTINCT CASE 
        WHEN o.order_status = 'delivered' THEN o.order_id 
    END) AS orders_delivered
FROM olist_orders_dataset o
LEFT JOIN olist_order_payments_dataset p
    ON o.order_id = p.order_id;



