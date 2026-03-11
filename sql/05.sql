SELECT a.last_name, a.first_name
FROM actor a
WHERE (a.first_name, a.last_name) NOT IN (
    SELECT first_name, last_name FROM customer
)
ORDER BY a.last_name, a.first_name;
