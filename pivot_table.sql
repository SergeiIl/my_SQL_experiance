WITH
country AS (SELECT DISTINCT country_code
            FROM company
            ORDER BY country_code),
year_2011 AS (SELECT country_code,
                     AVG(funding_total) AS f_total_2011
              FROM company
              WHERE EXTRACT(YEAR FROM CAST(founded_at AS DATE)) = 2011
              GROUP BY country_code),
year_2012 AS (SELECT country_code,
                     AVG(funding_total) AS f_total_2012
              FROM company
              WHERE EXTRACT(YEAR FROM CAST(founded_at AS DATE)) = 2012
              GROUP BY country_code),
year_2013 AS (SELECT country_code,
                     AVG(funding_total) AS f_total_2013
              FROM company
              WHERE EXTRACT(YEAR FROM CAST(founded_at AS DATE)) = 2013
              GROUP BY country_code)
             
SELECT country.country_code,
       year_2011.f_total_2011 AS year_2011,
       year_2012.f_total_2012 AS year_2012,
       year_2013.f_total_2013 AS year_2013
FROM country
JOIN year_2011 ON country.country_code = year_2011.country_code
JOIN year_2012 ON country.country_code = year_2012.country_code
JOIN year_2013 ON country.country_code = year_2013.country_code
ORDER BY year_2011.f_total_2011 DESC
