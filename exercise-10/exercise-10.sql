-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE

SELECT
  EXTRACT(YEAR from payment.payment_date) AS y,
  EXTRACT(MONTH from payment.payment_date) AS m,
  EXTRACT(DAY from payment.payment_date) AS d,
  film.rating,
  SUM(amount) FROM payment
INNER JOIN rental
  ON payment.rental_id = rental.rental_id
INNER JOIN inventory
  ON rental.inventory_id = inventory.inventory_id
INNER JOIN film
  ON inventory.film_id = film.film_id
GROUP BY
	CUBE(film.rating, y, m, d)
ORDER BY
	film.rating, y, m, d;