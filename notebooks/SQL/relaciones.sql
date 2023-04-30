-- creo conexiones entre las tablas --

-- relacion entre film e inventory --

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_film
	FOREIGN KEY (film_id) 
    REFERENCES videoclub.film (film_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    
-- relacion entre inventory y rental --

ALTER TABLE rental
ADD CONSTRAINT fk_rental_inventory
	FOREIGN KEY (inventory_id)
    REFERENCES videoclub.inventory (inventory_id)
    ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    
-- relacion entre inventory y client --

ALTER TABLE rental
ADD CONSTRAINT fk_rental_client
	FOREIGN KEY (client_id)
    REFERENCES videoclub.client (client_id)
    ON DELETE NO ACTION
	ON UPDATE NO ACTION



;