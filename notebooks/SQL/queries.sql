-- QUERIES RELEVANTES --

-- 1. Saber la película que mejor rating le dan los clientes. --

select film.title, rental.rating
from rental
inner join inventory
on rental.inventory_id = inventory.inventory_id
inner join film
on inventory.film_id = film.film_id
order by rental.rating DESC
limit 1;

;

-- 2. Qué clientes han alquilado más veces.alter. -- 

SELECT client.name, client.lastname, COUNT(rental.rental_id) as total_rents
FROM rental
INNER JOIN client ON rental.client_id = client.client_id
GROUP BY client.name, client.lastname
ORDER BY COUNT(rental.rental_id) DESC
LIMIT 5;

-- 3. En qué zona viven los clientes que más alquilan. --

SELECT client.postal_code, COUNT(rental.rental_id) as total_rents
FROM rental
INNER JOIN client ON rental.client_id = client.client_id
GROUP BY client.postal_code
ORDER BY COUNT(rental.rental_id) DESC
LIMIT 5;

-- 4. Lista de los cumpleaños de este mes. --

SELECT client.name, client.lastname, client.birthday, client.mail, client.phone_number
FROM client
WHERE MONTH(birthday) = 12
ORDER BY MONTH(birthday), DAY(birthday);


-- 5. Las peliculas de duración más corta con mejor rating. --

select film.title, film.length, max(rental.rating) as best_rating
from rental
inner join inventory
on rental.inventory_id = inventory.inventory_id
inner join film
on inventory.film_id = film.film_id
GROUP BY film.title, film.length
order by film.length DESC
limit 1;

-- 6. Películas del actor x que duren menos de 2 horas.

SELECT title, actors, length
FROM film
WHERE actors = 'SANDRA KILMER' AND length <= 120
ORDER BY length DESC;

-- 7. 10 películas de las que tenemos más stock.

SELECT film.title, count(inv.inventory_id) as 'stock'
FROM film
INNER JOIN inventory as inv
ON film.film_id = inv.film_id
GROUP BY film.title
ORDER BY count(inv.inventory_id) DESC
LIMIT 10;

-- 8. Las 5 pelicukas se pueden alquilar más días.

SELECT title, max(rental_duration) AS max_days
FROM film
GROUP BY title
ORDER BY max(rental_duration)
LIMIT 5;


-- 9. 
