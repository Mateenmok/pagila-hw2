SELECT DISTINCT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN (
    SELECT DISTINCT i2.film_id
    FROM inventory i2
    JOIN rental r ON i2.inventory_id = r.inventory_id
    JOIN customer c ON r.customer_id = c.customer_id
    JOIN address a ON c.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN country co ON ci.country_id = co.country_id
    WHERE co.country = 'United States'
) us ON f.film_id = us.film_id
WHERE us.film_id IS NULL
ORDER BY f.title;
