SELECT rank, title, revenue,
    SUM(revenue) OVER (ORDER BY rank) AS "total revenue"
FROM (
    SELECT
        RANK() OVER (ORDER BY COALESCE(SUM(p.amount), 0.00) DESC) AS rank,
        f.title,
        COALESCE(SUM(p.amount), 0.00) AS revenue
    FROM film f
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    LEFT JOIN payment p ON r.rental_id = p.rental_id
    GROUP BY f.title
) ranked
ORDER BY rank, title;
