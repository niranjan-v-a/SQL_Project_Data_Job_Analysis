/*
Question : What are the top paying data analyst jobs?
- Identify the top paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment trends and salary expectations.
*/

WITH top_paying_jobs AS (
    SELECT 
        job_postings.job_id,
        job_postings.job_title,
        job_postings.salary_year_avg,
        job_postings.job_posted_date,
        companies.name AS company_name
    FROM
        job_postings_fact AS job_postings
    LEFT JOIN company_dim AS companies
        ON job_postings.company_id = companies.company_id
    WHERE
        job_postings.job_title_short = 'Data Analyst' AND
        job_postings.job_location = 'Anywhere' AND
        job_postings.salary_year_avg IS NOT NULL
    ORDER BY
        job_postings.salary_year_avg DESC
    LIMIT 10
)

SELECT
    *,
    skills.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim AS skills_job
    ON top_paying_jobs.job_id = skills_job.job_id
INNER JOIN skills_dim AS skills
    ON skills_job.skill_id = skills.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC