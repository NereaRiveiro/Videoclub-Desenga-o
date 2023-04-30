-- INTRODUCCIÖN DE DATOS EN NUEVAS TABLAS --

-- Añado nueva columna para tener registro de los códigos postales --

ALTER TABLE client
ADD COLUMN postal_code INT;

-- Añado info del primer cliente ficticio para pruebas --

insert into client (client_id, name, lastname, mail, phone_number, adress, birthday, postal_code)
values (1, 'Antón', 'Utray', 'antonutray@gmail.com', '666999777', 'C/ San Bernardo 62, 27006, Madrid', '1995-12-31', 27006); 

-- Añado info del primer registro de alquiler ficticio para pruebas --

insert into rental (rental_id, rental_date, inventory_id, client_id, return_date, rating)
values (1, '2023-04-28 10:00:30', 1, 1, '2023-04-30 21:39:30', 4)

;