
--1. List all customers who live in Texas (use jons)
SELECT customer.customer_id, customer.first_name,customer.last_name,address.district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';


--2. Get all payments above $6.99 with the Customer's FullName)
SELECT payment_id, payment.amount, payment_date, customer.customer_id, concat(customer.first_name,' ',customer.last_name) as fullname
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;


--3. Show all customers names who have made payments over $175(use subqueries)
SELECT customer.customer_id, customer.first_name,customer.last_name
FROM customer 
WHERE customer.customer_id IN
(SELECT payment.customer_id 
FROM payment 
GROUP BY payment.customer_id 
HAVING SUM(payment.amount) > 175
ORDER BY SUM(payment.amount) DESC);


--4. List all customers that live in Nepal (use the city table)
SELECT customer.customer_id, customer.first_name, customer.last_name,city.city
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
WHERE city.city = 'Nepal';


--5. Which staff member had the most transactions?
SELECT staff.staff_id, staff.first_name, staff.last_name,COUNT(payment.payment_id) as No_Of_Transactions
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id, staff.first_name, staff.last_name
ORDER BY COUNT(payment.payment_id) DESC
LIMIT 1;


--6. How many movies of each rating are there?
SELECT rating, COUNT(film_id) FROM film
GROUP BY rating;


--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
SELECT customer.customer_id, customer.first_name, customer.last_name
FROM customer
WHERE customer.customer_id IN
(SELECT payment.customer_id
FROM payment 
WHERE payment.amount > 6.99)
ORDER BY customer.customer_id;


--8. How many free rentals did our stores give away?
SELECT COUNT(payment_id) 
FROM payment 
WHERE amount = 0;