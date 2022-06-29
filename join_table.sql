WITH
c_name AS (SELECT id,
                  name
           FROM company AS c
           WHERE milestones > 6),
round AS (SELECT id,
                 company_id,
                 raised_amount
          FROM funding_round
          WHERE EXTRACT(YEAR FROM CAST(funded_at AS DATE)) BETWEEN '2012' AND '2013'),
f_name AS (SELECT i.company_id AS company_id,
                  i.funding_round_id AS funding_round_id,
                  f.name AS name
           FROM fund AS f
           RIGHT OUTER JOIN investment AS i ON f.id = i.fund_id)
           
SELECT fn.name AS name_of_fund,
       cn.name AS name_of_company,
       r.raised_amount AS amount
FROM f_name AS fn
JOIN round AS r ON fn.funding_round_id = r.id
JOIN c_name AS cn ON fn.company_id = cn.id
