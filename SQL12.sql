SELECT COUNT(length) FROM film
WHERE length > 
(
	SELECT AVG(length) FROM film
);

SELECT COUNT(*) FROM film
WHERE rental_rate =
(
	SELECT MAX(rental_rate) FROM film
);

SELECT * FROM film
WHERE rental_rate = 
(
	SELECT mIN(rental_rate) FROM film
)
AND
replacement_cost =
(
	SELECT MIN(replacement_cost) FROM film
);

SELECT * FROM payment
WHERE customer_id =
(
	SELECT customer_id FROM payment
	GROUP BY customer_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
);
