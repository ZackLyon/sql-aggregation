-- ROLLUP of amount made per year, month, day
-- use ROLLUP and EXTRACT YEAR, MONTH, DAY from payment_date

SELECT
  EXTRACT(YEAR from payment.payment_date) AS y,
  EXTRACT(MONTH from payment.payment_date) AS m, 
  EXTRACT(DAY from payment.payment_date) AS d,
  SUM(amount) from payment
GROUP BY
	ROLLUP(y, m, d);
