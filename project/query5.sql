WITH demand_skills AS (
    SELECT
        skills.skill_id,
        skills.skills,
        COUNT (id.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim AS id ON id.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim AS skills ON skills.skill_id = id.skill_id
    WHERE  job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
            AND job_work_from_home = TRUE
    GROUP BY
        skills.skill_id
), average_salary AS (
    SELECT 
        skills.skill_id,
        skills.skills,
        ROUND(AVG (salary_year_avg), 2)AS average_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim AS id ON id.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim AS skills ON skills.skill_id = id.skill_id
    WHERE  
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills.skill_id
)

SELECT 
    demand_skills.skill_id,
    demand_skills.skills,
    demand_count,
    average_salary
FROM demand_skills
INNER JOIN average_salary ON average_salary.skill_id = demand_skills.skill_id
WHERE 
    demand_count > 10
ORDER BY 
    average_salary DESC,
    demand_count DESC
LIMIT 20