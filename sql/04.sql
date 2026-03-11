SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.customer_id = 1
GROUP BY f.title
HAVING COUNT(*) > 1
ORDER BY f.title;
