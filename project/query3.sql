

SELECT 
    skills.skills,
    COUNT (id.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim AS id ON id.job_id = job_postings_fact.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = id.skill_id
WHERE  job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5