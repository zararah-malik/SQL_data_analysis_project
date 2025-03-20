SELECT
    skill_sim.skill_id,
    skill_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary,
    COUNT(job_postings_fact.job_id) AS job_count
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim AS skill_dim ON skills_job_dim.skill_id = skill_dim.skill_id
    INNER JOIN skills_dim AS skill_sim ON skill_sim.skill_id = skill_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_work_from_home = TRUE
GROUP BY
    skill_sim.skill_id,
    skill_dim.skills
HAVING
    COUNT(job_postings_fact.job_id) > 10
ORDER BY
    job_count DESC,
    avg_salary DESC
LIMIT 25;