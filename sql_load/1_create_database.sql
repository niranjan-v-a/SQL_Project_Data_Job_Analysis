SELECT DISTINCT
    jp.company_id,
    c.name
FROM   
    job_postings_fact AS jp
LEFT JOIN company_dim AS c
    ON jp.company_id = c.company_id
WHERE
    jp.job_health_insurance = TRUE
    AND EXTRACT(QUARTER FROM job_posted_date) = 2
    AND EXTRACT(YEAR FROM job_posted_date) = 2023
ORDER BY
    c.name;

    

SELECT *
FROM job_postings_fact
LIMIT 5;

SELECT *
FROM company_dim
LIMIT 5;