-- Загальна кількість фільмів у кожній категорії
SELECT c.name AS category, COUNT(f.film_id) AS total_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- Середня тривалість фільмів у кожній категорії
SELECT c.name AS category, AVG(f.length) AS avg_length
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- Мінімальна та максимальна тривалість фільмів
SELECT MIN(length) AS min_length, MAX(length) AS max_length
FROM film;

-- Загальна кількість клієнтів
SELECT COUNT(customer_id) AS total_customers
FROM customer;

-- Сума платежів по кожному клієнту
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- П'ять клієнтів з найбільшою сумою платежів
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_payments DESC
LIMIT 5;

-- Загальна кількість орендованих фільмів кожним клієнтом
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Середній вік фільмів у базі даних
SELECT AVG(EXTRACT(YEAR FROM AGE(NOW(), f.release_year))) AS avg_age
FROM film f;

-- Кількість фільмів, орендованих за певний період
SELECT COUNT(r.rental_id) AS films_rented
FROM rental r
WHERE r.rental_date BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD';

-- Сума платежів по кожному місяцю
SELECT TO_CHAR(p.payment_date, 'YYYY-MM') AS month, SUM(p.amount) AS total_payments
FROM payment p
GROUP BY TO_CHAR(p.payment_date, 'YYYY-MM')
ORDER BY month;

-- Максимальна сума платежу, здійснена клієнтом
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, MAX(p.amount) AS max_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Середня сума платежів для кожного клієнта
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, AVG(p.amount) AS avg_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Кількість фільмів у кожному рейтингу
SELECT f.rating, COUNT(f.film_id) AS total_films
FROM film f
GROUP BY f.rating;

-- Середня сума платежів по кожному магазину
SELECT s.store_id, AVG(p.amount) AS avg_payment
FROM store s
JOIN customer c ON s.store_id = c.store_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY s.store_id;