-- Llista el total de factures d'un client/a en un període determinat.
SELECT 
    c.client_nom,
    COUNT(v.venta_id) AS total_factures
FROM 
    ex1.venta v
JOIN 
    ex1.client c ON v.client_client_id = c.client_client_id
WHERE 
    v.venta_data BETWEEN '2024-11-01' AND '2024-11-15'
GROUP BY 
    c.client_nom;


    
-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT 
    u.ulleres_marca, 
    u.ulleres_graduació, 
    u.ulleres_tipus, 
    u.ulleres_colorMuntura, 
    u.ulleres_colorVidre
FROM 
    ex1.venta v
JOIN 
    ex1.ulleres u ON v.ulleres_ulleres_id = u.ulleres_id
JOIN 
    ex1.empleats e ON v.empleats_empleats_id = e.empleats_id
WHERE 
    e.empleats_id = 1
    AND v.venta_data BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    u.ulleres_marca, 
    u.ulleres_graduació, 
    u.ulleres_tipus, 
    u.ulleres_colorMuntura, 
    u.ulleres_colorVidre;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT 
    p.proveïdor_nom
FROM 
    ex1.venta v
JOIN 
    ex1.ulleres u ON v.ulleres_ulleres_id = u.ulleres_id
JOIN 
    ex1.proveïdor p ON u.proveïdor_proveïdor_id = p.proveïdor_id;
