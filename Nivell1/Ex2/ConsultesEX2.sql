-- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.

SELECT 
    COUNT(od.order_details_quantity) AS sodas_sold
FROM 
    ex2.product p
JOIN 
    ex2.category c ON p.category_category_id = c.category_id
JOIN 
    ex2.order_details od ON p.product_id = od.product_product_id
JOIN 
    ex2.order o ON od.order_order_id = o.order_id
JOIN 
    ex2.client cl ON o.client_client_id = cl.client_id
JOIN 
    ex2.location l ON cl.location_location_id = l.location_id
WHERE 
    c.category_name = 'Beguda'
    AND l.location_id = 4; 

-- Llista quantes comandes ha efectuat un determinat empleat/da.

SELECT 
    w.worker_name, 
    w.worker_surname,
    COUNT(o.order_id) AS total_orders
FROM 
    ex2.worker w
JOIN 
    ex2.store s ON w.store_store_id = s.store_id
JOIN 
    ex2.order o ON s.order_order_id = o.order_id
WHERE 
    w.worker_id = 1 
GROUP BY 
    w.worker_name, w.worker_surname;
