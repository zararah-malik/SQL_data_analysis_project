WITH top_paying_jobs AS (
    SELECT
    job_id,
    job_title,
    job_location,
    company_dim.name AS company_name,
    salary_year_avg
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title = 'Data Analyst' 
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
    AND job_schedule_type = 'Full-time'
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT
    top_paying_jobs.job_id,
    top_paying_jobs.job_title,
    top_paying_jobs.job_location,
    top_paying_jobs.company_name,
    top_paying_jobs.salary_year_avg,
    skills_dim.skills 
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC