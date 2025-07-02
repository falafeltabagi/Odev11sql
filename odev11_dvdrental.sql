-- 1. Tüm isimler - tekrarlar hariç
SELECT first_name FROM actor
UNION
SELECT first_name FROM customer
ORDER BY first_name;

-- 1. Tüm isimler - tekrarlar dahil
SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer
ORDER BY first_name;



-- 2. Kesişim - tekrarlar hariç
SELECT DISTINCT first_name
FROM actor
WHERE first_name IN (
    SELECT first_name FROM customer
)
ORDER BY first_name;

-- 2. Kesişim - tekrarlar dahil
SELECT a.first_name AS actor_first, c.first_name AS customer_first
FROM actor a
JOIN customer c
  ON a.first_name = c.first_name
ORDER BY a.first_name;



-- 3. Actor'da olup Customer'da olmayan - tekrarlar hariç
SELECT DISTINCT first_name
FROM actor
WHERE first_name NOT IN (
    SELECT first_name FROM customer
)
ORDER BY first_name;

-- 3. Actor'da olup Customer'da olmayan - tekrarlar dahil
SELECT first_name
FROM actor
WHERE first_name NOT IN (
    SELECT first_name FROM customer
)
ORDER BY first_name;
