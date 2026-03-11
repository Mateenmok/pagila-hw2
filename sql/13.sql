SELECT
    EXTRACT(YEAR FROM rental_date)::int AS "Year",
    EXTRACT(MONTH FROM rental_date)::int AS "Month",
    COUNT(*) AS "Total Rentals"
FROM rental
GROUP BY ROLLUP("Year", "Month")
ORDER BY "Year", "Month";
