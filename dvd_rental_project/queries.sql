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

