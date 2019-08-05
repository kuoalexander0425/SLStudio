-- SELECT * FROM orders;
-- 
-- 
-- SELECT orders.id, customer_id, name,order_date FROM orders 
--             JOIN order_items ON orders.id=order_items.order_id            
--             WHERE customer.id='E279729353';
--     
-- 
-- SELECT orders.id, customer_id, name,order_date FROM orders 
--             JOIN order_items ON orders.id=order_items.order_id            
--             WHERE customer.id='E279729353';
--     
-- SELECT orders.id, customer_id, name,order_date,SUM(price*quantity) FROM orders 
--             JOIN customers ON order_items.order_id = customer.id AND customer_id= 'E279729353'          
--             LEFT JOIN order_items ON orders.id = order_item.order_id
--             GROUP BY orders.id;
-- 
-- SELECT orders.id, customer_id, name,order_date,SUM(price*quantity) as total_amount FROM orders 
--             JOIN customers ON order_items.order_id = customer.id AND customer_id= 'E279729353'          
--             LEFT JOIN order_items ON orders.id = order_item.order_id
--             GROUP BY orders.id;

SELECT orders.id, customer_id, customers.name, order_date, order_time, payment_type,payment_fee,shipping_type,
        shipping_fee, shipping_note, payment_note, 
        product_id,price,quantity, products.name as product_name, photo_url
        FROM orders  JOIN customers ON orders.customer_id = customers.id                 
        LEFT JOIN order_items ON orders.id = order_items.order_id
        JOIN products ON order_items.product_id = products.id
        WHERE orders.id=1;