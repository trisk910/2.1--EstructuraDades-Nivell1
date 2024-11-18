INSERT INTO `ex1`.`address` (`address_carrer`, `address_numero`, `address_pis`, `address_porta`, `address_ciutat`, `address_cp`, `address_pais`)
VALUES 
    ('Carrer Major', 123, 2, 'A', 'Barcelona', '08001', 'Espanya'),
    ('Carrer Tuset', 13, 6, 'C', 'Barcelona', '08201', 'Espanya'),
	('Avinguda Diagonal', 233, 7, 'B', 'Barcelona', '08208', 'Espanya'),
    ('Carrer Mallorca', 136, 1, 'A', 'Barcelona', '08205', 'Espanya');
    
INSERT INTO `ex1`.`proveïdor` (`proveïdor_nom`, `proveïdor_tel`, `proveïdor_fax`, `proveïdor_nif`,`address_address_id`)
VALUES 
    ('Vision 2000', 123456789, 1234567890, 'A12345678',1),
    ('VisionX', 987654321, 1987654321, 'B87654321',2);
    
INSERT INTO `ex1`.`client` (`client_nom`, `client_telefon`, `client_correu`, `client_dataregistre`,`client_client_id`,`address_address_id`)
VALUES 
    ('Marc', '666777888', 'marc@example.com', '2023-09-11', NULL, 3),
    ('Anna', '666555444', 'anna@example.com','2024-11-11','1',4);

INSERT INTO `ex1`.`ulleres` (`ulleres_marca`, `ulleres_graduació`,`ulleres_tipus`, `ulleres_colorMuntura`, `ulleres_colorVidre`,
 `ulleres_preu`,`proveïdor_proveïdor_id`)
VALUES 
    ('Raven', '1.25', 'pasta', 'vermelles', 'transparent', 200,1),
    ('Modular', '3.25', 'flotant', 'negres', 'ahumat', 500,2);
    
INSERT INTO `ex1`.`empleats` (`empleats_nom`, `empleats_telefon`, `empleats_correu`)
VALUES 
    ('Felipe', 936651275,'felipe@vision.com'),
    ('Macarena', 936651435,'macana@vision2.com');
    
INSERT INTO `ex1`.`venta` (`venta_data`, `client_client_id`, `empleats_empleats_id`, `ulleres_ulleres_id`)
VALUES 
    ('2024-11-01', 1, 1, 1),
    ('2024-11-02', 2, 2, 2);
    


