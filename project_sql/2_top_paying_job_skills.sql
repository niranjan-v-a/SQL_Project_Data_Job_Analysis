/*
Question: What skills are required for the top paying Data Analyst jobs?
- Use the top paying Data Analyst jobs from the previous query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries.
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
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim AS skills_job
    ON top_paying_jobs.job_id = skills_job.job_id
INNER JOIN skills_dim AS skills
    ON skills_job.skill_id = skills.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC