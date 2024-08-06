--Q1: Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1

--Q2: Which countries have the most invoices?

SELECT COUNT(*) AS c, billing_country FROM invoice
GROUP BY billing_country
ORDER BY c DESC

--Q3:  What are the top 3 values of total invoice?

SELECT * FROM invoice
ORDER BY total DESC
LIMIT 5
