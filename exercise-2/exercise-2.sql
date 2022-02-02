-- the top 10 cities with the most total rental payment amount
-- include the city name and sum
-- use SUM to sum up the amounts

SELECT city, SUM(payment.amount) AS sum FROM payment
INNER JOIN customer
  ON customer.customer_id = payment.customer_id
INNER JOIN address
  ON customer.address_id = address.address_id
INNER JOIN city
  ON address.city_id = city.city_id
GROUP BY city
ORDER BY sum DESC
LIMIT 10;
