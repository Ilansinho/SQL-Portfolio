-- DVDRental SQL Project
-- Author: Ilan Landau
-- Database: PostgreSQL (dvdrental)
-- This file will store the queries developed during practice.

-- 1. Total Revenue:
Select SUM (amount) from payment;

--2. Revenue per month:
SELECT
  TO_CHAR(DATE_TRUNC('month', payment_date), 'Mon/YYYY') AS month,
  ROUND(SUM(amount), 2) AS revenue
FROM payment
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY DATE_TRUNC('month', payment_date);

--3. Top 10 customers per total revenue generated:
Select payment.customer_id, first_name || ' ' || last_name AS customer_name, SUM (amount) from payment
JOIN customer
ON customer.customer_id = payment.customer_id
Group by payment.customer_id, first_name, last_name
Order by SUM (amount) DESC
LIMIT 10

--4. Top categories per total rentals:
Select category.category_id, name AS category_name, COUNT (*) AS total_rentals from rental
JOIN inventory
ON rental.inventory_id = inventory.inventory_id
JOIN film_category
ON inventory.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id
Group By category.category_id, name
Order by total_rentals DESC
