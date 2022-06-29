WITH
rm AS (SELECT title,
               rental_rate,
               length,
               rating
        FROM movie
        WHERE rental_rate > 2
        ORDER BY length DESC
        LIMIT 40)
SELECT rm.rating,
       MIN(rm.length) AS min_length,
       MAX(rm.length) AS max_length,
       AVG(rm.length) AS avg_length,
       MIN(rm.rental_rate) AS min_rental_rate,
       MAX(rm.rental_rate) AS max_rental_rate,
       AVG(rm.rental_rate) AS avg_rental_rate
FROM rm
GROUP BY rm.rating
ORDER BY avg_length
