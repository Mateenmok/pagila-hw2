SELECT
    EXTRACT(YEAR FROM r.rental_date)::int AS "Year",
    EXTRACT(MONTH FROM r.rental_date)::int AS "Month",
    SUM(p.amount) AS "Total Revenue"
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY ROLLUP("Year", "Month")
ORDER BY "Year", "Month";
