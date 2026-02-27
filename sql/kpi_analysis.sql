-- Total Revenue
SELECT 
    SUM(p.selling_price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- Gross Profit
SELECT 
    SUM((p.selling_price - p.cost_price) * oi.quantity) AS gross_profit
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- Gross Margin Percentage
SELECT 
    ROUND(
        (SUM((p.selling_price - p.cost_price) * oi.quantity) * 100.0) /
        SUM(p.selling_price * oi.quantity),
    2) AS gross_margin_percentage
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- Revenue by Category
SELECT 
    p.category,
    SUM(p.selling_price * oi.quantity) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- Top 5 Products by Revenue
SELECT 
    p.product_name,
    SUM(p.selling_price * oi.quantity) AS product_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY product_revenue DESC
LIMIT 5;

-- Revenue by Store
SELECT 
    s.store_name,
    SUM(p.selling_price * oi.quantity) AS store_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY store_revenue DESC;

-- Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', o.order_date) AS revenue_month,
    SUM(p.selling_price * oi.quantity) AS monthly_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY revenue_month
ORDER BY revenue_month;

-- Store Revenue Ranking
SELECT 
    s.store_name,
    SUM(p.selling_price * oi.quantity) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(p.selling_price * oi.quantity) DESC
    ) AS revenue_rank
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY s.store_name;
