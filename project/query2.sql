   
WITH top_paying_jobs AS (
    SELECT
        job_id, 
        job_title,
        salary_year_avg,
        companies.name
    FROM job_postings_fact
    LEFT JOIN company_dim AS companies ON companies.company_id = job_postings_fact.company_id
    WHERE
        job_title_short LIKE '%Data Analyst%' AND 
        job_work_from_home = TRUE AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10

)

SELECT 
    t.*,
    skills.skills
FROM top_paying_jobs t
INNER JOIN skills_job_dim AS id ON id.job_id = t.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = id.skill_id
ORDER BY
    salary_year_avg DESC
