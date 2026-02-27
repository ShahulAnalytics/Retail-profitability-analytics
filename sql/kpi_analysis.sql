Total Revenue SELECT SUM(p.selling_price * oi.quantity) AS total_revenue FROM order_items oi JOIN products p ON oi.product_id = p.product_id;
Gross Profit SELECT SUM((p.selling_price - p.cost_price) * oi.quantity) AS gross_profit FROM order_items oi JOIN products p ON oi.product_id = p.product_id;
