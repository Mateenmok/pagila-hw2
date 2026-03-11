SELECT special_feature, SUM(revenue) AS profit
FROM (
    SELECT unnest(f.special_features) AS special_feature, SUM(p.amount) AS revenue
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN payment p ON r.rental_id = p.rental_id
    GROUP BY f.film_id
) sub
GROUP BY special_feature
ORDER BY special_feature;
