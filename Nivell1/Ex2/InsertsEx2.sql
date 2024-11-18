INSERT INTO `ex2`.`state` (`state_name`) VALUES ('Barcelona'), ('Girona'), ('Tarragona'), 
('Lleida');

INSERT INTO `ex2`.`location` (`location_name`, `state_state_id`) VALUES 
    ('Castelldefels',1), ('Espot',2), ('Reus',3), ('Tàrrega',4);

    
INSERT INTO `ex2`.`client` (`client_name`, `client_surname`, `client_address`, `client_zip`, `client_number`, `location_location_id`) 
VALUES 
    ('Ernest','Bergada','Carrer Arcadi 30','08860','666555544',1),
    ('Marta', 'Serra', 'Carrer Major 45', '25597', '777888999', 2),
    ('Joan', 'Pons', 'Carrer Nou 10', '43201', '555444333', 3),    
    ('Martí','Babau','Carrer Grantoa 12','25300','333444455',4);

    
INSERT INTO `ex2`.`order` (`order_date`, `order_orderType`, `order_price`, `client_client_id`) 
VALUES 
    ('2024-10-01','Delivery',25,1),
    ('2024-10-06','Onsite',15,2),
    ('2024-10-13','Delivery',65,3),
    ('2024-10-18','Onsite',32,4),
    ('2024-10-30','Onsite',8,4);

    
INSERT INTO `ex2`.`category` (`category_name`) VALUES ('Tradicionals'), ('Especials'),
('Hamburgues'), ('Beguda');

INSERT INTO `ex2`.`product` (`product_name`, `product_description`, `product_image`, `product_price`, `category_category_id`) 
VALUES 
    ('Pizza 4 Formatges','4 formatges diferents','foto',12,1),
    ('Pizza 4 Estacions','diferents ingredients','foto',14,1),
    ('Pizza Estrellada','Ingredients especials amb un ou','foto',15,2),
    ('Pizza Carnivora','diferents tipus de carn','foto',16,2),
    ('Hamburgues Trufada','carn de bou amb truga','foto',13,3),
    ('Refresc','beguda refrescan','foto',3,4);


INSERT INTO `ex2`.`product` (`product_name`,`product_description`,`product_image`,`product_price`,
`category_category_id`)
VALUES
	('Pizza 4 Formatges','4 formatges diferents','foto',12,1),
	('Pizza 4 Estacions','diferents ingredients','foto',14,1),
	('Pizza Estrellada','Ingredients especials amb un ou','foto',15,2),
	('Pizza Carnivora','diferents tipus de carn','foto',16,2),
	('Hamburgues Trufada','carn de bou amb truga','foto',13,3),
	('Refresc','beguda refrescan','foto',3,4);

INSERT INTO `ex2`.`order_details` (`order_details_quantity`, `order_order_id`, `product_product_id`) 
VALUES 
    (2,1,1), (3,2,2), (1,3,3), (5,4,5), (2,5,6);


INSERT INTO `ex2`.`store` (`store_address`, `store_zip`, `location_location_id`, `order_order_id`) 
VALUES 
    ('carrer major 40', '08860',1,1),
    ('carrer valencia 10', '25597',2,2),
    ('carrer numancia 33', '43201',3,3),
    ('carrer mallorca 23', '25300',4,4);

    
INSERT INTO `ex2`.`worker` (`worker_name`,`worker_surname`,`worker_nif`,`worker_number`,
`worker_type`,`store_store_id`)
VALUES
    ('Anna', 'Ribas', 'A12345678', '600123456', 'chef', 1),
    ('David', 'López', 'B23456789', '600234567', 'deliver', 1),
    ('Laura', 'Martínez', 'C34567890', '600345678', 'chef', 2),
    ('Jordi', 'Soler', 'D45678901', '600456789', 'deliver', 2),
    ('Pere', 'Ramírez', 'E56789012', '600567890', 'chef', 3),
    ('Marta', 'Ferrer', 'F67890123', '600678901', 'deliver', 3),
    ('Clara', 'Puig', 'G78901234', '600789012', 'chef', 4),
    ('Albert', 'Vila', 'H89012345', '600890123', 'deliver', 4);
    
