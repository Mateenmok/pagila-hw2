SELECT b.title
FROM (
    SELECT film_id, title FROM (
        SELECT film_id, title, unnest(special_features) AS feature FROM film
    ) sub WHERE feature = 'Behind the Scenes'
) b
JOIN (
    SELECT film_id FROM (
        SELECT film_id, unnest(special_features) AS feature FROM film
    ) sub WHERE feature = 'Trailers'
) t ON b.film_id = t.film_id
ORDER BY b.title;
