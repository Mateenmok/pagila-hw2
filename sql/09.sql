SELECT special_features, COUNT(*) AS count
FROM (
    SELECT film_id, unnest(special_features) AS special_features FROM film
) sub
GROUP BY special_features
ORDER BY special_features;
