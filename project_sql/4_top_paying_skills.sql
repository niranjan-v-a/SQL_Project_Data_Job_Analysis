/*
Question : What are the top skills based on salary?
- Lokk at tyhe average salary associated with each skill for Data Analyst positions.
- Focus on roles with specified salaries, regarless of location.
- Why? It reveals how different skills impact salary levels, for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim AS skills_job
    ON job_postings_fact.job_id = skills_job.job_id
INNER JOIN skills_dim AS skills
    ON skills_job.skill_id = skills.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    -- AND job_postings_fact.job_work_from_home = True
GROUP BY skills.skills
ORDER BY avg_salary DESC
LIMIT 25;