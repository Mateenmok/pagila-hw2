SELECT f.title
FROM film f
WHERE f.film_id NOT IN (
    SELECT DISTINCT film_id FROM inventory
)
ORDER BY f.title;
