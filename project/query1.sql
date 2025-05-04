
SELECT
    job_id, 
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    companies.name,
    job_posted_date::DATE
FROM job_postings_fact
LEFT JOIN company_dim AS companies ON companies.company_id = job_postings_fact.company_id
WHERE
    job_title_short LIKE '%Data Analyst%' AND 
    job_work_from_home = TRUE AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10